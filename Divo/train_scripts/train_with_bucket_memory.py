import os, sys
import json
import argparse
import typing
import random

import torch

from lib.torch.seed import seed
from lib.tools.compatibility import reconstruct_object
from lib.tools.io_capture import capture
from lib.tools import console_to_html, delay_callback
from model.rl.replay_memory import BucketMemory, PackedMemory, HashPairMemory

from ..train import warm_up, send_email, exception_notify, get_logger
from ..train import Trainer, load_checkpoint_torch, ValueBasedRL
from ..core.sql_featurizer import Sql, database
from ..core.plan_featurizer import Plan
from ..model.train import SqlDataset, load_dataset
from ..utils.custom_tqdm import tqdm


class BucketValueBasedRL(ValueBasedRL):
    def add_pair_memory(self, state, value : float):
        value = self._value_preprocess(value)
        state = state.clone()
        state.clear_embeddings()
        state_hash_op = f'{state.sql.filename} {state.hints(operators=True)}'
        if isinstance(self.pair_memory, PackedMemory):
            self.pair_memory['online'].push(state, key=state.sql.filename, hash=state_hash_op)
        else:
            self.pair_memory.push(state, key=state.sql.filename, hash=state_hash_op)
        self._update_best_value(state, value)
        self.best_values[state.sql.filename] = value
        self.recent_values[state.sql.filename] = value

class BucketExperienceTrainer(Trainer):
    check_checkpoint_validity = False

    def __init__(
        self,
        train_dataset: typing.Iterable[Sql],
        test_dataset: typing.Iterable[Sql],
        device,
        checkpoint_file=None,
        load_checkpoint=True,
        extra_train_datasets: typing.Iterable[SqlDataset] = None,
        extra_test_datasets: typing.Iterable[SqlDataset] = None,
        experience_checkpoint_file=None,
        parameter_checkpoint_file=None,
        force_normalization=False,
        excluded=None,
        reference_dataset=None,
        preserve_ratio=None,
        disable_resampling=False,
    ):
        if excluded:
            self.excluded = [sql.filename for sql in excluded]
        else:
            self.excluded = None
        self.preserve_ratio = preserve_ratio
        self.reference_dataset = reference_dataset
        self.disable_resampling = disable_resampling
        super().__init__(
            train_dataset,
            test_dataset,
            device,
            checkpoint_file=checkpoint_file,
            load_checkpoint=load_checkpoint,
            extra_train_datasets=extra_train_datasets,
            extra_test_datasets=extra_test_datasets,
            experience_checkpoint_file=experience_checkpoint_file,
            parameter_checkpoint_file=parameter_checkpoint_file,
            force_normalization=force_normalization,
        )

    def reset(self):
        res = super().reset()
        self.rl_model = BucketValueBasedRL(
            self.device,
            num_table_layers=database.config.extractor_num_table_layers,
            initial_exploration_prob=database.config.rl_initial_exploration_prob,
        )
        return res

    @classmethod
    def is_valid_plan(cls, plan):
        all_aliases = set()
        for left, right, op in plan.actions:
            if isinstance(left, str):
                all_aliases.add(left)
            if isinstance(right, str):
                all_aliases.add(right)
        return all_aliases.issubset(plan.sql.aliases)

    def load_experiences(self, checkpoint_file):
        test_set_queries = set(x.filename for x in self.test_dataset)
        if self.extra_test_datasets:
            for d in self.extra_test_datasets:
                test_set_queries.update(x.filename for x in d)
        train_dataset = list(self.train_dataset)
        if self.extra_train_datasets:
            for d in self.extra_train_datasets:
                train_dataset.extend(d)

        self.log(f'Loading experiences from {checkpoint_file}')
        dic = load_checkpoint_torch(checkpoint_file)
        self.rl_model.best_values.load_state_dict(dic['rl_model']['best_values'])
        bucket_memory_dic = dic['rl_model']['bucket_memory']
        bucket_memory = BucketMemory(0)
        bucket_memory.load_state_dict(bucket_memory_dic)
        new_buckets = []
        new_weights = []

        def plan_filter(plan):
            if plan.sql.filename in test_set_queries:
                return False
            if self.excluded and plan.sql.filename in self.excluded:
                return False
            return True

        sqls = {sql.filename: sql for sql in train_dataset}
        if self.reference_dataset:
            for sql in self.reference_dataset:
                sqls[sql.filename] = sql

        def plan_preprocess(plan : Plan):
            nonlocal sqls
            plan = reconstruct_object(plan, Plan)
            new_sql = sqls.get(plan.sql.filename, None)
            if new_sql is None:
                #self.log(f'Warning: cannot found {plan.sql.filename}, trying to restore from checkpoint')
                new_sql = reconstruct_object(plan.sql, Sql)
                new_sql.to(self.device)
                for alias, features in new_sql.table_features.items():
                    table_index, table_name, table = new_sql.get_table(alias)
                    table_id = database.schema.name_to_indexes[table.name]
                    features['table_id'] = table_id
                sqls[new_sql.filename] = new_sql
            plan.sql = new_sql
            # check plan validity
            if not self.is_valid_plan(plan):
                # invalid plan
                self.log(f'Warning: invalid plan {plan.hints()} for sql {new_sql.filename}')
                return None
            plan.to(self.device)
            return plan

        def random_remove(bucket, ratio):
            ratio = min(max(ratio, 0.), 1.)
            sql_plans = {}
            for plan in bucket:
                sql_plans.setdefault(plan.sql.filename, []).append(plan)
            res = []
            for plans in sql_plans.values():
                target_size = round(len(plans) * ratio)
                if target_size > 0:
                    res.extend(self.randomizers['sample'].sample(plans, target_size))
            self.randomizers['sample'].shuffle(res)
            return res

        for bucket, weight in zip(bucket_memory._buckets, bucket_memory.weights):
            new_data = list(filter(plan_filter, bucket._data))
            new_data = list(filter(lambda x: x is not None, map(plan_preprocess, new_data)))
            if isinstance(self.preserve_ratio, float) and 0. <= self.preserve_ratio <= 1.:
                self.log(f'Random removing {100 * self.preserve_ratio}% plans from bucket of size {len(new_data)}')
                new_data = random_remove(new_data, self.preserve_ratio)
            if new_data:
                if len(new_data) < len(bucket._data):
                    bucket._p = 0
                bucket._data = new_data
                new_buckets.append(bucket)
                new_weights.append(weight)
        bucket_memory._buckets = new_buckets
        bucket_memory.weights = new_weights
        self._init_pair_memory(bucket_memory)
        self.log('Loaded')

    def _init_pair_memory(self, bucket_memory=None):
        if bucket_memory is None:
            bucket_memory = BucketMemory(0)
        self.rl_model.pair_memory = PackedMemory(database.config.seed, default_sample_mode='random')
        bucket_weight = 2 / 3
        self.rl_model.pair_memory.add('bucket', bucket_memory, weight=bucket_weight)
        self.rl_model.pair_memory.add('online', HashPairMemory(seed=database.config.seed), weight=1 - bucket_weight)

    def _set_training_dataset(self, force=False):
        if self.disable_resampling:
            train_dataset = [(sql, None, True) for sql in self.train_dataset]
            for dataset in self.extra_train_datasets:
                train_dataset.extend((sql, None, False) for sql in dataset)
            self.randomizers['sample'].shuffle(train_dataset)
            self._current_training_dataset = train_dataset
            return
        return super()._set_training_dataset(force)

    def load_checkpoint(self, checkpoint_file=None):
        if self.experience_checkpoint_file is not None:
            self._init_pair_memory()
        res = super().load_checkpoint(checkpoint_file=checkpoint_file)
        if self.check_checkpoint_validity:
            self.log('Removing invalid plans from bucket')
            bucket_memory = self.rl_model.pair_memory['bucket']
            for bucket in bucket_memory._buckets:
                new_data = []
                pointer_offset = 0
                for index, plan in enumerate(bucket._data):
                    if not self.is_valid_plan(plan):
                        self.log(f'Remove plan {plan.hints()} for sql {plan.sql.filename}')
                        if index < bucket._p:
                            pointer_offset += 1
                    else:
                        new_data.append(plan)
                bucket._data = new_data
                bucket._p = max(0, bucket._p - pointer_offset)
            self.log('Removed')
        return res


def main():
    os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

    sys.stderr = capture(sys.stderr, 2 ** 20)

    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('-d', '--dataset', nargs='+', type=str, default=['dataset/train_tpcds', 'dataset/test_tpcds'],
                        help='Training and testing dataset. When multiple datasets are taken as arguments, '
                             'the datasets before \'/\' are training dataset and the rest are testing dataset.')
    parser.add_argument('--reference-dataset', nargs='*', type=str, default=[],
                        help='SQL dataset for recovering checkpoints.')
    parser.add_argument('-e', '--epochs', type=int, default=200,
                        help='Total epochs.')
    parser.add_argument('-F', '--id', type=str, default=None,
                        help='File ID.')
    parser.add_argument('--fast-warm-up', action='store_true',
                        help='To warm up the database by traversing all relations.')
    parser.add_argument('--warm-up', type=int, default=None,
                        help='To warm up the database with specific iterations.')
    parser.add_argument('-S', '--seed', type=int, default=3407,
                        help='Random seed.')
    parser.add_argument('-D', '--database', type=str, default='database',
                        help='PostgreSQL database.')
    parser.add_argument('-U', '--user', type=str, default='postgres',
                        help='PostgreSQL user.')
    parser.add_argument('-P', '--password', type=str, default=None,
                        help='PostgreSQL user password.')
    parser.add_argument('--port', type=int, default=None,
                        help='PostgreSQL port.')
    parser.add_argument('--host', type=str, default=None,
                        help='PostgreSQL host.')
    parser.add_argument('--reset', action='store_true',
                        help='To ignore existing checkpoints.')
    parser.add_argument('--config', type=str, default=None,
                        help='The additional config file path.')
    parser.add_argument('--experiences', type=str, default=None,
                        help='To add initial experiences from another checkpoint.')
    parser.add_argument('--parameters', type=str, default=None,
                        help='To load initial parameters from another checkpoint.')
    parser.add_argument('--force-normalization', action='store_true',
                        help='To initialize Z-score normalization with current datasets '
                             'even when a parameter checkpoint is specified.')
    parser.add_argument('--use-lora', action='store_true',
                        help='To use LoRA for finetuning.')
    parser.add_argument('--drop-timeout-cache', action='store_true',
                        help='To drop unsuccessfully executed plans in the cache before training.')
    parser.add_argument('--timeout', type=float, default=None,
                        help='The SQL execution timeout limit.')
    parser.add_argument('--lora-alpha', type=float, default=None,
                        help='A parameter of LoRA.')
    parser.add_argument('--lora-rank', type=int, default=None,
                        help='The rank of LoRA weight matrices.')
    parser.add_argument('--learning-rate', type=float, default=None,
                        help='The learning rate.')
    parser.add_argument('--use-learned-emb', action='store_true',
                        help='To use table learned embeddings.')
    parser.add_argument('--exclude', nargs='*', type=str, default=[],
                        help='The dataset that will be removed from the experience checkpoint.')
    parser.add_argument('--server-name', type=str, default=None,
                        help='The server host name for caching.')
    parser.add_argument('--max-iter-per-epoch', type=int, default=200,
                        help='The max number of queries to be explored of each epoch.')
    parser.add_argument('--use-relative', type=str, default='none', choices=('none', 'base', 'best'),
                        help='The mode of using relative ground truth values.')
    parser.add_argument('--ignore-random-state', action='store_true',
                        help='To ignore random states in checkpoints.')
    parser.add_argument('--check-validity', action='store_true',
                        help='To check plan validity for loaded checkpoint.')
    parser.add_argument('--preserve-ratio', type=float, default=None,
                        help='To preserve only a specific ratio of bucket experiences.')
    parser.add_argument('--disable-resampling', action='store_true')

    args = parser.parse_args()

    BucketExperienceTrainer.check_checkpoint_validity = args.check_validity

    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

    database_args = {'dbname': args.database}
    if args.user is not None:
        database_args['user'] = args.user
    if args.password is not None:
        database_args['password'] = args.password
    if args.port is not None:
        database_args['port'] = args.port
    if args.host is not None:
        database_args['host'] = args.host
    if args.server_name is not None:
        database_args['hostname'] = args.server_name
    database.setup(**database_args)

    if args.config is not None:
        database.config.load_from_file(args.config)

    database.config.log_stdout = not sys.stdout.isatty()
    database.config.resample_count = args.max_iter_per_epoch
    database.config.predict_use_relative = args.use_relative
    database.config.load_random_state = not args.ignore_random_state

    if args.id is not None:
        database.config.experiment_id = args.id
    if args.seed is not None:
        database.config.seed = args.seed
    if args.epochs is not None:
        database.config.iteration = args.epochs

    default_logger = get_logger()

    if len(args.dataset) <= 1:
        raise RuntimeError('datasets should be at least 2')

    if len(args.dataset) <= 1:
        raise RuntimeError('datasets should be at least 2')

    if len(args.dataset) == 2:
        train_path, test_path = args.dataset

        default_logger('Generating train set')
        train_set = load_dataset(train_path, device=device, verbose=True)
        default_logger('Generating test set')
        test_set = load_dataset(test_path, device=device, verbose=True)
        extra_train_datasets, extra_test_datasets = [], []
    else:
        train_paths, test_paths = [], []
        _found_slash = False
        for d in args.dataset:
            if d == '/':
                _found_slash = True
            elif _found_slash:
                test_paths.append(d)
            else:
                train_paths.append(d)
        if not train_paths:
            raise RuntimeError('training dataset is not specified')
        if not test_paths:
            raise RuntimeError('testing dataset is not specified')

        default_logger('Generating train set')
        train_set = load_dataset(train_paths[0], device=device, verbose=True)
        extra_train_datasets = []
        for d in train_paths[1:]:
            _train_set = load_dataset(d, device=device, verbose=True)
            extra_train_datasets.append(_train_set)
        default_logger('Generating test set')
        test_set = load_dataset(test_paths[0], device=device, verbose=True)
        extra_test_datasets = []
        for d in test_paths[1:]:
            _test_set = load_dataset(d, device=device, verbose=True)
            extra_test_datasets.append(_test_set)

    reference_dataset = []
    for d in args.reference_dataset:
        default_logger(f'Loading reference dataset from {d}')
        reference_dataset.extend(load_dataset(d, device=device, verbose=True))

    excluded = []
    if args.exclude:
        default_logger('Loading excluded set')
    for ed in args.exclude:
        _excluded_dataset = load_dataset(ed, device=device, verbose=True)
        excluded.extend(_excluded_dataset)

    seed(database.config.seed)
    if args.fast_warm_up:
        gen = tqdm(database.schema.tables, 'Warm up')
        for table_obj in gen:
            gen.set_postfix({'name': table_obj.name})
            _sql = f'select * from {table_obj.name}'
            database.execute(_sql)
    if args.warm_up is not None:
        ds = []
        for d in (train_set, *extra_train_datasets, test_set, *extra_test_datasets):
            if len(d) > 200:
                d = random.sample(d, k=200)
            ds.extend(d)
        warm_up(ds, iterations=args.warm_up)
        seed(database.config.seed)

    config_output_file = database.config.config_file_name.format(database.config.experiment_id)
    database.config.postgresql_shared_buffer_size = database.get_settings('shared_buffers')
    database.config.postgresql_server_version = database.get_settings('server_version')
    database.config.postgresql_max_parallel_workers = database.get_settings('max_parallel_workers')
    database.config.postgresql_max_parallel_workers_per_gather = database.get_settings('max_parallel_workers_per_gather')

    os.makedirs(os.path.dirname(config_output_file), exist_ok=True)
    with open(config_output_file, 'w') as f:
        json.dump({
            'id': database.config.experiment_id,
            'config': database.config.to_dict(),
            'args': args.__dict__,
        }, f, ensure_ascii=False, indent=4)

    database.config.use_lora_only = args.use_lora

    if args.learning_rate is not None:
        database.config.learning_rate = args.learning_rate

    def mail_stderr():
        send_email('Automatic notification', console_to_html.format_escape(sys.stderr.output_record))
    delay_callback.appoint(mail_stderr, interval=database.config.auto_notify_interval)

    trainer = None
    def main_proc():
        nonlocal trainer
        trainer = BucketExperienceTrainer(
            train_set,
            test_set,
            device,
            load_checkpoint=not args.reset,
            extra_train_datasets=extra_train_datasets,
            extra_test_datasets=extra_test_datasets,
            experience_checkpoint_file=args.experiences,
            parameter_checkpoint_file=args.parameters,
            force_normalization=args.force_normalization,
            reference_dataset=reference_dataset,
            preserve_ratio=args.preserve_ratio,
            disable_resampling=args.disable_resampling,
        )
        # the parameters are already merged during initialization
        if database.config.use_lora_only:
            trainer.log('Set LoRA training')
            if args.lora_alpha is not None:
                database.config.lora_alpha = args.lora_alpha
                trainer.set_lora_alpha()
            if args.lora_rank is not None:
                database.config.lora_rank = args.lora_rank
                trainer.set_lora_rank()
            trainer.set_lora_training(True, False)
            trainer.mark_only_lora_as_trainable()
        else:
            trainer.set_lora_training(False, False)
        if args.use_learned_emb:
            database.config.extractor_use_table_emb_from_epoch = 0
            trainer.rl_model.model_extractor.embedding_table_id.requires_grad_(True)

        if args.drop_timeout_cache:
            trainer.log('Removing timeout plans from cache')
            trainer.cache_manager.remove_timeout_plans()
        if args.timeout is not None:
            trainer.log(f'Set timeout limit to {args.timeout}')
            database.timeout = args.timeout
        trainer.train()
    try:
        exception_notify(main_proc)
    except Exception as e:
        raise

if __name__ == '__main__':
    main()
