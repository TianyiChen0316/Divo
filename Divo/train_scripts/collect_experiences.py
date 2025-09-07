import os, sys
import json
import argparse
import math
import typing
from pathlib import Path

from tqdm import tqdm
import pandas as pd
import torch

from lib.torch.seed import seed
from lib.tools import smtp

from ..train import warm_up
from ..utils.exception import get_exception_str, get_traceback
from ..train import Trainer
from ..core.sql_featurizer import Sql, database
from ..model.train import SqlDataset, load_dataset

class ExperienceCollectTrainer(Trainer):
    @classmethod
    # we assume each sql has a unique file name
    def _dataset_sort_key(cls, value: Sql):
        if not isinstance(value, Sql):
            path = None if value is None else str(value)
        else:
            path = value.filename
        if path is None:
            return '0'
        if path.endswith('.sql'):
            path = path[:-4]
        try:
            value = int(path.replace('-', ''), 16)
            return f'1{value:05x}'
        except ValueError:
            return f'2{value}'

    def __init__(
        self,
        dataset : typing.Iterable[Sql],
        device,
        chunk_size = 100,
        chunk_switch_epoch = 4,
        checkpoint_file=None,
        load_checkpoint=True,
        experience_checkpoint_file=None,
        parameter_checkpoint_file=None,
        force_normalization=False,
    ):
        if isinstance(dataset, SqlDataset):
            dataset = SqlDataset(dataset, path=dataset.path)
            self._dataset_path = dataset.path
        else:
            dataset = list(dataset)
            self._dataset_path = None

        dataset.sort(key=self._dataset_sort_key)

        chunkgen = lambda x: SqlDataset(dataset[x: x + chunk_size], path=self._dataset_path)
        self._chunk_size = chunk_size
        self._chunk_switch_epoch = chunk_switch_epoch
        self._chunks = [chunkgen(i) for i in range(0, len(dataset), chunk_size)]
        if len(self._chunks) < 2:
            raise RuntimeError(f"training requires at least 2 chunks")

        self._current_chunk_index = 0
        self.experiences = {}
        self._train_df = self._test_df = None
        self.register('_train_df')
        self.register('_test_df')
        self.register('experiences')
        self.register('_current_chunk_index')
        self._set_dataset()

        super().__init__(
            self.train_dataset,
            self.test_dataset,
            device,
            checkpoint_file=checkpoint_file,
            load_checkpoint=load_checkpoint,
            extra_train_datasets=None,
            extra_test_datasets=None,
            experience_checkpoint_file=experience_checkpoint_file,
            parameter_checkpoint_file=parameter_checkpoint_file,
            force_normalization=force_normalization,
        )

    def _record_chunk_experience(self, chunk_index=None):
        if chunk_index is None:
            chunk_index = self._current_chunk_index
        info = {}
        for state in self.rl_model.memory.memory._data:
            state_hash = f'{state.sql.filename} {state.hints(operators=True)}'
            _info = info.get(state_hash, None)
            if _info is None:
                _info = {
                    'plan': state,
                    'key': state_hash,
                    'count': 1,
                }
                info[state_hash] = _info
            else:
                _info['count'] += 1
        pair_info = self.rl_model.pair_memory._memories.copy()
        experiences = {
            'memory': info,
            'pair_memory': pair_info,
        }
        self.experiences[chunk_index] = experiences

    def _model_reset(self):
        self.rl_model.memory.clear()
        self.rl_model.pair_memory.clear()
        self.worst_training_sqls = []
        self.rl_model.reset_parameters()
        self.rl_model.schedule(0)

    def _set_dataset(self):
        self.test_dataset = self._chunks[self._current_chunk_index]
        self.train_dataset = self.test_dataset
        self._test_sqls = set(map(lambda x: x.filename, self.test_dataset))
        self._train_sqls = self._test_sqls

    def _check_lora(self):
        if not database.config.use_lora_only and database.config.lora_finetuning_start_epoch is not None:
            epoch = self.epoch % self._chunk_switch_epoch
            if epoch == database.config.lora_finetuning_start_epoch:
                self.set_lora_training(True, True)
            elif epoch > database.config.lora_finetuning_start_epoch:
                self.set_lora_training(True, False)
            else:
                self.set_lora_training(False, False)

    def _train_one_epoch(self):
        current_index = (self.epoch // self._chunk_switch_epoch) % len(self._chunks)

        if current_index != self._current_chunk_index:
            self._record_chunk_experience()
            self._model_reset()
            self._current_chunk_index = current_index
            self._set_dataset()
            self.init(False)

        return super()._train_one_epoch()

    def _collect_train_and_test_df(self, target_df : pd.DataFrame, new_df : pd.DataFrame):
        new_df_files = set(new_df['file'])
        to_update = target_df['file'].map(lambda x: x in new_df_files)
        target_df = target_df.drop(index=target_df[to_update].index)
        target_df = pd.concat([target_df, new_df], axis=0)
        target_df['_$sort_key'] = target_df['file'].map(self._dataset_sort_key)
        target_df.sort_values(by='_$sort_key', inplace=True)
        del target_df['_$sort_key']
        target_df.index = pd.RangeIndex(len(target_df))
        return target_df

    def _postprocess(self):
        super()._postprocess()
        if self.parameter_checkpoint_file is not None:
            self.rl_model.model_extractor.freeze_token_embeddings_with_mask(self.table_embedding_unseen_table_mask)

    def _validation_preprocess(self):
        pass

    def _validate_df_collect_data(self, df : pd.DataFrame):
        is_test = df['file'].map(lambda x: x in self._test_sqls)
        train_df, test_df = df[~is_test], df[is_test]
        if len(train_df) > 0:
            if self._train_df is None:
                self._train_df = train_df
            else:
                self._train_df = self._collect_train_and_test_df(self._train_df, train_df)
        if len(test_df) > 0:
            if self._test_df is None:
                self._test_df = test_df
            else:
                self._test_df = self._collect_train_and_test_df(self._test_df, test_df)
        return super()._validate_df_collect_data(df)

    def _validate_extra_email_info(self):
        info = []
        if self._train_df is not None and len(self._train_df) > 0:
            train_res = self._validate_df_collect_data(self._train_df)
            self.log(f"Final train set GMRL: {train_res['gmrl']:.03f} / {train_res['gmrl_comparison']:.03f} speedup: {train_res['speedup']:.03f} / {train_res['speedup_comparison']:.03f}")
            self.log(f"Final train set comparison accuracy: {100 * train_res['comparison_accuracy']:.03f}%")
            info.append(f"""<span>Final train set speedup: {train_res['speedup']:.03f} / {train_res['speedup_comparison']:.03f}; GMRL: {train_res['gmrl']:.03f} / {train_res['gmrl_comparison']:.03f}; comparison accuracy: {100 * train_res['comparison_accuracy']:.03f}%</span><br />\n""")
        if self._test_df is not None and len(self._test_df) > 0:
            test_res = self._validate_df_collect_data(self._test_df)
            self.log(f"Final test set GMRL: {test_res['gmrl']:.03f} / {test_res['gmrl_comparison']:.03f} speedup: {test_res['speedup']:.03f} / {test_res['speedup_comparison']:.03f}")
            self.log(f"Final test set comparison accuracy: {100 * test_res['comparison_accuracy']:.03f}%")
            info.append(f"""<span>Final test set speedup: {test_res['speedup']:.03f} / {test_res['speedup_comparison']:.03f}; GMRL: {test_res['gmrl']:.03f} / {test_res['gmrl_comparison']:.03f}; comparison accuracy: {100 * test_res['comparison_accuracy']:.03f}%</span><br />\n""")
        return ''.join(info)

    def _validate(self, add_history=True, save_path=None, prefix=None):
        res = super()._validate(add_history, save_path, prefix)

        if save_path is None:
            save_path = database.config.path_results
        if prefix is not None:
            prefix = f'{prefix}.'
        else:
            prefix = ''
        path_results = Path(save_path) / f'{prefix}{self.experiment_id}'
        if self._train_df is not None and len(self._train_df) > 0:
            self._train_df.to_csv(path_results / f'all_train.csv', index=False)
        if self._test_df is not None and len(self._test_df) > 0:
            self._test_df.to_csv(path_results / f'all_test.csv', index=False)

        self.cache_manager.flush()
        return res


def main():
    os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('dataset', type=str, default='dataset/random_5000',
                        help='Training and testing dataset.')
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
    parser.add_argument('--init-validate', action='store_true',
                        help='To validate before the training process.')
    parser.add_argument('--use-lora', action='store_true',
                        help='To use LoRA for finetuning.')
    parser.add_argument('--drop-timeout-cache', action='store_true',
                        help='To drop unsuccessfully executed plans in the cache before training.')
    parser.add_argument('--chunk-size', type=int, default=100,
                        help='The chunk size of the dataset.')
    parser.add_argument('--chunk-switch-epoch', type=int, default=40,
                        help='The interval of switching to the next chunk for testing.')
    parser.add_argument('--timeout', type=float, default=None,
                        help='The SQL execution timeout limit.')
    parser.add_argument('--lora-alpha', type=float, default=None,
                        help='A parameter of LoRA.')

    args = parser.parse_args()

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
    database.setup(**database_args)

    if args.config is not None:
        database.config.load_from_file(args.config)

    if args.id is not None:
        database.config.experiment_id = args.id
    if args.seed is not None:
        database.config.seed = args.seed
    if args.epochs is not None:
        database.config.epochs = args.epochs

    if len(args.dataset) <= 1:
        raise RuntimeError('datasets should be at least 2')

    dataset_path = args.dataset
    print('Generating dataset', file=sys.stderr)
    dataset = load_dataset(dataset_path, device=device, verbose=True)

    seed(database.config.seed)
    if args.fast_warm_up:
        gen = tqdm(database.schema.tables, 'Warm up')
        for table_obj in gen:
            gen.set_postfix({'name': table_obj.name})
            _sql = f'select * from {table_obj.name}'
            database.execute(_sql)
    if args.warm_up is not None:
        warm_up(dataset, iterations=args.warm_up)
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

    try:
        trainer = ExperienceCollectTrainer(
            dataset,
            device,
            chunk_size=args.chunk_size,
            chunk_switch_epoch=args.chunk_switch_epoch,
            load_checkpoint=not args.reset,
            experience_checkpoint_file=args.experiences,
            parameter_checkpoint_file=args.parameters,
        )
        # the parameters are already merged during initialization
        if database.config.use_lora_only:
            trainer.log('Set LoRA training')
            if args.lora_alpha is not None:
                database.config.lora_alpha = args.lora_alpha
            trainer.set_lora_training(True, False)
            trainer.mark_only_lora_as_trainable()
        else:
            trainer.set_lora_training(False, False)
        if args.drop_timeout_cache:
            trainer.log('Removing timeout plans from cache')
            trainer.cache_manager.remove_timeout_plans()
        if args.init_validate:
            trainer.log('Running initial validation')
            trainer._validate(False)
        if args.timeout is not None:
            trainer.log(f'Set timeout limit to {args.timeout}')
            database.timeout = args.timeout
        trainer.train()
    except Exception as e:
        if database.config.email is not None and database.config.email_password is not None:
            with smtp.login(database.config.email, database.config.email_password, ssl=True) as m:
                if m is not None:
                    from_ = f'{database.config.email_product_name} | {database.config.experiment_id}'
                    title = get_exception_str(e)
                    html_args = {
                        'product_name': database.config.email_product_name,
                        'message': get_traceback(e),
                    }
                    receiver = database.config.email_receiver if database.config.email_receiver else None
                    success = smtp.mail(m, smtp.mime_from_file(title, 'html/remind.html', replace=html_args, from_=from_), receiver=receiver)
                else:
                    success = False
            if not success:
                print(f'Failed to send mail as {database.config.email}', file=sys.stderr)
        raise

if __name__ == '__main__':
    main()
