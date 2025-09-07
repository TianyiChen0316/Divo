import os, sys
import json
import argparse
import re
import typing
from pathlib import Path
import random
import logging

import numpy as np
import pandas as pd
import torch

from lib.tools.compatibility import reconstruct_object
from lib.torch.seed import seed
from lib.torch.safe_save import save_torch
from lib.tools import Logger, smtp
from lib.tools.interfaces import StateDictInterface
from lib.tools.randomizer import Randomizer
from lib.torch import lora
from model.rl.replay_memory import BucketMemory, get_buckets

from ..train import load_checkpoint_torch
from ..utils.exception import get_exception_str, get_traceback
from ..utils.custom_tqdm import tqdm
from ..core.sql_featurizer import Sql, database, sql_parser
from ..core.plan_featurizer import Plan
from ..model.rl import ValueBasedRL
from ..model.train import PostgresCacheManager, plan_latency, load_dataset


class StateDictDict:
    def __init__(self):
        self._items = {}

    def __getitem__(self, item):
        return self._items[item]

    def __setitem__(self, key, value):
        self._items[key] = value

    def __delitem__(self, key):
        del self._items[key]

    def __len__(self):
        return len(self._items)

    def __contains__(self, item):
        return item in self._items

    def __bool__(self):
        return bool(self._items)

    def get(self, key, default=None):
        return self._items.get(key, default)

    def clear(self):
        self._items = {}

    def state_dict(self):
        return {k : (v.state_dict() if isinstance(v, StateDictInterface) else v) for k, v in self._items.items()}

    def load_state_dict(self, state_dict):
        for k, v in state_dict.items():
            if k in self._items:
                _v = self._items[k]
                if isinstance(_v, StateDictInterface):
                    _v.load_state_dict(v)
                else:
                    self._items[k] = v
            else:
                self._items[k] = v


class BucketSplitter:
    def __init__(self):
        self._criteria = []
        self._total_num_buckets = 1

    def add_criterion(self, splitter_function, num_buckets):
        self._criteria.append((splitter_function, num_buckets))
        self._total_num_buckets *= num_buckets

    def get_bucket_index(self, sample):
        index = 0
        for splitter_function, num_buckets in self._criteria:
            index = index * num_buckets + splitter_function(sample)
        return index

    def get_buckets(self, samples : typing.Iterable[typing.Any], remove_empty=False, return_bucket_indices=False):
        buckets = [[] for i in range(self._total_num_buckets)]
        samples = tuple(samples)
        indices = np.zeros(len(samples), dtype=int)
        for splitter_function, num_buckets in self._criteria:
            scores = np.array(list(map(splitter_function, samples)), dtype=int)
            indices = indices * num_buckets + scores
        for sample, index in zip(samples, indices):
            if index >= 0:
                buckets[index].append(sample)
        if return_bucket_indices:
            if remove_empty:
                buckets, indices = list(zip(*filter(lambda x: bool(x[0]), zip(buckets, indices.tolist()))))
            else:
                indices = indices.tolist()
            return buckets, indices
        if remove_empty:
            buckets = list(filter(bool, buckets))
        return buckets


class CustomBucketMemory(BucketMemory):
    def __init__(self, num_buckets, bucket_size=None, seed=None, log=None):
        super().__init__(num_buckets, bucket_size, seed)
        self._log = log

    def sample(self, size, preserve=0, with_label=False):
        bucket_counts = self.randomizer.choice_counts(size, self.weights)
        if self._log:
            pass
            #self._log(f'Bucket counts: {", ".join(map(lambda x: "%d" % x, bucket_counts))}')
        res = []
        for index, bucket in enumerate(self._buckets):
            samples = self.randomizer.sample(bucket, min(len(bucket), bucket_counts[index]))
            if with_label:
                samples = map(lambda x: (index, x), samples)
            res.extend(samples)
        return res


class DoremiValueBasedRL(ValueBasedRL):
    def __init__(self, *args, **kwargs):
        if 'log' in kwargs:
            self._log = kwargs.pop('log')
        else:
            self._log = None
        super().__init__(*args, **kwargs)
        self._domain_weight_update_ratio = 0.25
        self.bucket_memory = CustomBucketMemory(0, seed=database.config.seed, log=self._log)
        self.domain_weights = None
        self.train_reference = True
        self.register('bucket_memory')
        self.register('domain_weights')
        self.reference_models = StateDictDict()
        self.register('reference_models')
        if not database.config.use_lstm:
            self.model_transformer.encoder_weight = 0

    def load_state_dict(self, dic : dict):
        if 'reference_models' in dic:
            self.set_reference_model()
        return super().load_state_dict(dic)

    def model_init(self):
        res = super().model_init()
        lora.set_lora_training(self.model_extractor, False, False)
        if database.config.use_lstm:
            lora.set_lora_training(self.model_lstm, False, False)
        else:
            lora.set_lora_training(self.model_transformer, False, False)
        return res

    def set_reference_model(self):
        self.reference_models['extractor'] = self.model_extractor
        if database.config.use_lstm:
            self.reference_models['lstm'] = self.model_lstm
        else:
            self.reference_models['transformer'] = self.model_transformer
        self.reset_parameters()

    def init_domain_weights(self, size=None):
        if size is None:
            if self.domain_weights is not None:
                size = self.domain_weights.shape[0]
            else:
                raise ValueError('size cannot be None')
        self.domain_weights = torch.zeros(size, device=self.device) + 1 / size

    def _get_domain_weights(self, labels : torch.Tensor):
        return self.domain_weights.gather(-1, labels)

    def _gather_label_mean(self, labels : torch.Tensor, values : torch.Tensor):
        num_labels = self.domain_weights.shape[-1]
        res = []
        for label_index in range(num_labels):
            label_mask = labels == label_index
            masked_values = values[label_mask]
            if masked_values.numel() == 0:
                label_mean = values.new_zeros(1).squeeze(0)
            else:
                label_mean = masked_values.mean()
            res.append(label_mean)
        res = torch.stack(res, dim=0)
        return res

    def _update_domain_weights(self, domain_excess_loss : torch.Tensor):
        step_size = 1.
        smoothing_param = 1e-1

        ones = self.domain_weights.new_zeros(*self.domain_weights.shape) + 1 / self.domain_weights.shape[0]
        _new_domain_weights = self.domain_weights * (step_size * domain_excess_loss).exp()
        normalized_weights = _new_domain_weights / _new_domain_weights.sum()
        new_domain_weights = (1 - smoothing_param) * normalized_weights + smoothing_param * ones
        if self._domain_weight_update_ratio is not None:
            self.domain_weights = (self._domain_weight_update_ratio * new_domain_weights +
                                   (1 - self._domain_weight_update_ratio) * self.domain_weights)
        else:
            self.domain_weights = new_domain_weights
        self.bucket_memory.weights = self.domain_weights.tolist()
        return new_domain_weights

    def _train(
        self,
        batch_size=512,
        preserve=4,
        reward_weighting=0.1,
        use_ranking_loss=False,
        use_complementary_loss=False,
        use_self_imitation=False,
        equal_suppress=8,
        use_other_states=False,
    ):
        batch = self.bucket_memory.sample(batch_size, with_label=True)
        domain_labels, batch = zip(*batch)
        domain_labels = torch.tensor(domain_labels, dtype=torch.long, device=self.device)
        batch = self._batch_embedding_update(batch)
        batch_gts = self._get_best_value(batch)
        seqs = []
        gts = []
        info = []
        for index, (state, (gt, gt_op)) in enumerate(zip(batch, batch_gts)):
            best_value = None#self.best_values[state.sql.filename]
            if database.config.use_lstm:
                seq = state.get_root_embeddings().mean(dim=0)
            else:
                seq = state.to_sequence()
            seqs.append(seq)
            gts.append((gt, gt_op, best_value))
            info.append((state.bushy_level, state.sql.baseline.bushy_level))
        gt, gt_op, best_values = zip(*gts)
        state_bushy_levels, state_baseline_bushy_levels = zip(*info)
        state_bushy_levels = torch.tensor(state_bushy_levels, dtype=torch.float, device=self.device)
        state_baseline_bushy_levels = torch.tensor(state_baseline_bushy_levels, dtype=torch.float, device=self.device)
        gt_stds = database.config.classification_normal_std + \
                  (database.config.classification_bushy_std - database.config.classification_normal_std) * \
                  (1 - 0.5 ** (state_bushy_levels - state_baseline_bushy_levels).clip(0))
        gts = self._gt_process(zip(gt, gt_op), reward_weighting=reward_weighting)

        #_best_values = torch.tensor(best_values, device=self.device)
        _gt_op = torch.tensor(gt_op, device=self.device)
        _gts = self._gt_to_class_labels(gts, gt_stds)

        if database.config.use_lstm:
            embs = seqs
            pred, regression_pred = self.model_lstm.predict(seqs)
        else:
            embs, pred, regression_pred = self.model_transformer(seqs)#.view(-1)
        regression_pred = regression_pred.squeeze(-1)
        pred = pred / database.config.classification_softmax_temperature

        main_loss_ori = torch.nn.functional.cross_entropy(pred, _gts, reduction='none') + (
                    _gts * _gts.clamp(1e-8).log()).sum(dim=-1, keepdim=False)
        main_regression_loss_ori = torch.nn.functional.mse_loss(regression_pred, gts, reduction='none')

        if not self.train_reference:
            with torch.no_grad():
                if database.config.use_lstm:
                    reference_pred, reference_regression_pred = self.reference_models['lstm'].predict(seqs)
                else:
                    _, reference_pred, reference_regression_pred = self.reference_models['transformer'](seqs)
                reference_pred, reference_regression_pred = reference_pred.detach(), reference_regression_pred.detach()
            reference_regression_pred = reference_regression_pred.squeeze(-1)
            reference_pred = reference_pred / database.config.classification_softmax_temperature

            reference_loss_ori = torch.nn.functional.cross_entropy(reference_pred, _gts, reduction='none') + (
                            _gts * _gts.clamp(1e-8).log()).sum(dim=-1, keepdim=False)
            reference_regression_loss_ori = torch.nn.functional.mse_loss(reference_regression_pred, gts, reduction='none')

            loss_weights = self.loss_weights
            _main_loss = loss_weights['cmp'] * main_loss_ori.detach() + loss_weights['reg'] * main_regression_loss_ori.detach()
            _reference_loss = loss_weights['cmp'] * reference_loss_ori + loss_weights['reg'] * reference_regression_loss_ori
            excess_loss = (_main_loss - _reference_loss).clip(0)
            domain_excess_loss = self._gather_label_mean(domain_labels, excess_loss)
            self._update_domain_weights(domain_excess_loss)

        domain_weights = self._get_domain_weights(domain_labels)
        main_cls_loss_by_domain = []
        main_reg_loss_by_domain = []
        for domain_label in range(len(self.bucket_memory._buckets)):
            elems = domain_labels == domain_label
            _cls_loss = main_loss_ori[elems]
            if _cls_loss.numel() == 0:
                _cls_loss = -1
            else:
                _cls_loss = _cls_loss.mean().item()
            _reg_loss = main_regression_loss_ori[elems]
            if _reg_loss.numel() == 0:
                _reg_loss = -1
            else:
                _reg_loss = _reg_loss.mean().item()
            main_cls_loss_by_domain.append(_cls_loss)
            main_reg_loss_by_domain.append(_reg_loss)
        self._log(f'Classification loss: {", ".join(map(lambda x: "%.2f" % x, main_cls_loss_by_domain))}')
        self._log(f'Regression loss: {", ".join(map(lambda x: "%.2f" % x, main_reg_loss_by_domain))}')

        #main_loss_ori = main_loss_ori * domain_weights * domain_weights.shape[0]
        #main_regression_loss_ori = main_regression_loss_ori * domain_weights * domain_weights.shape[0]

        return {
            'loss': {
                'cmp': main_loss_ori.mean(),
                'reg': main_regression_loss_ori.mean(),
                'ranking': 0.,
                'complementary': 0.,
                'self_imitation': 0.,
            },
            'time': {},
        }


class DoremiTrainer(StateDictInterface):
    def __init__(
        self,
        device,
        datasets=None,
        experience_checkpoint_file=None,
        checkpoint_file=None,
        load_checkpoint=True,
        restart_training_proxy=False,
    ):
        self.__device = device
        self.experience_checkpoint_file = experience_checkpoint_file
        self.datasets = datasets

        self.bucket_splitter = BucketSplitter()

        def by_query_workload(plan : Plan):
            filename = plan.sql.filename
            if re.match(r'^[0-9]+[A-Fa-f]\.sql$', filename):
                return 0 # JOB
            if re.match(r'^e[0-9]+[A-Fa-f]\.sql$', filename):
                return 1 # Extended JOB
            if re.match(r'^query[0-9]+_[0-9]+\.sql$', filename):
                return 2 # TPC-DS
            if re.match(r'q[0-9]+_[0-9]+_[^.]+\.sql', filename):
                return 3 # Stack
            if re.match(r'^[0-9]+\.sql$', filename):
                return 4 # Generated
            return 4 # Generated
        self.bucket_splitter.add_criterion(by_query_workload, 6)

        def by_num_tables(plan : Plan):
            num_tables = len(plan.sql.aliases)
            if num_tables <= 6:
                return 0
            if num_tables <= 12:
                return 1
            return 2
        #self.bucket_splitter.add_criterion(by_num_tables, 3)

        def by_latency(plan : Plan):
            latency = self.rl_model._get_best_value(plan)[1]
            latency = self.rl_model._rev_value_preprocess(latency)
            if latency <= 100:
                return 0
            if latency <= 1000:
                return 1
            return 2
        #self.bucket_splitter.add_criterion(by_latency, 3)
        self._bucket_indices = None

        default_checkpoint_file = Path(database.config.path_checkpoints) / f'{database.config.experiment_id}.checkpoint.pkl'
        if checkpoint_file is None or not os.path.exists(checkpoint_file):
            self.checkpoint_file = default_checkpoint_file
        else:
            self.checkpoint_file = Path(checkpoint_file)

        experience_checkpoint_file = Path(database.config.path_checkpoints) / experience_checkpoint_file if experience_checkpoint_file is not None else None
        if experience_checkpoint_file is None or not os.path.isfile(experience_checkpoint_file):
            self.experience_checkpoint_file = None
        else:
            self.experience_checkpoint_file = Path(experience_checkpoint_file)

        self._restart_training_proxy = restart_training_proxy
        self.reset()
        if load_checkpoint and os.path.exists(self.checkpoint_file):
            self.load_checkpoint(self.checkpoint_file)
        else:
            if self.datasets:
                self.load_experiences_cache(self.datasets)
            elif self.experience_checkpoint_file is not None:
                self.load_experiences(self.experience_checkpoint_file)
            self.init()

    def reset(self):
        seed(database.config.seed)

        self.experiment_id = database.config.experiment_id
        log_file = database.config.log_file_name.format(self.experiment_id)
        log_level = logging.DEBUG if database.config.log_debug else logging.INFO
        self.log = Logger(database.config.log_name, level=log_level, file=log_file, to_stderr=False, to_stdout=True)
        self.log.format('[%(levelname)s %(asctime)s.%(msecs)d] %(message)s', '%Y-%m-%d %H:%M:%S')

        self._log_data = []
        self.register('_log_data')

        self.randomizers = {
            'sample': Randomizer(random.getrandbits(64)),
            'exploration': Randomizer(random.getrandbits(64)),
        }
        self.register('randomizers')

        self.rl_model = DoremiValueBasedRL(
            self.__device,
            num_table_layers=database.config.extractor_num_table_layers,
            initial_exploration_prob=database.config.rl_initial_exploration_prob,
            log=self.log,
        )
        self.register('rl_model')

        self.buckets = None
        self.register('buckets')

        self.current_status = {
            'stage': 'train_reference',
            'iter': 0,
        }
        self.register('current_status')

        cache_file = database.config.cache_file_name
        if '{}' in cache_file:
            cache_file = cache_file.format(self.experiment_id)
        self.cache_manager = PostgresCacheManager(
            table_name=database.config.cache_table_name,
            schema_name='cache',
            auto_save_interval=database.config.cache_save_interval,
            cache_file=None if not os.path.isfile(cache_file) else cache_file,
        )

    def init(self):
        self.save_checkpoint(self.checkpoint_file)

    def _legacy_load_experiences(
        self,
        checkpoint_file,
    ):
        self.log(f'Loading experiences from {checkpoint_file}')
        dic = load_checkpoint_torch(checkpoint_file)
        self.rl_model.best_values.load_state_dict(dic['rl_model']['best_values'])
        experiences = dic['experiences']
        new_pair_memory = {}
        _sqls = {}
        plans = []
        for chunk_index, chunk in experiences.items():
            memory_info = chunk['memory']
            for info_dic in memory_info.values():
                plan, count = info_dic['plan'], info_dic['count']
                plan = reconstruct_object(plan, Plan)
                if plan.sql.filename in _sqls:
                    plan.sql = _sqls[plan.sql.filename]
                else:
                    plan.sql = reconstruct_object(plan.sql, Sql)
                    _sqls[plan.sql.filename] = plan.sql
                _, plan_best_value = self.rl_model._get_best_value(plan)
                baseline_plan = Plan(plan.sql)
                _, best_value = self.rl_model._get_best_value(plan.sql)
                if best_value is None:
                    _, best_value = self.rl_model._get_best_value(baseline_plan)
                for action in plan.sql.baseline.join_order:
                    baseline_plan.join(*action)
                _, baseline_value = self.rl_model._get_best_value(baseline_plan)
                #if baseline_value <= best_value:
                relative_value = plan_best_value / baseline_value
                #else:
                #    relative_value = (plan_best_value - best_value) / (baseline_value - best_value)
                plans.append((plan, count, relative_value))
                # filter the plans that are only explored once and decrease the number of duplicate plans
                #new_memory.extend((plan for _ in range(round(math.sqrt(count - 1)))))
            new_pair_memory.update(chunk['pair_memory'])

        _plans = []
        _criteria = (
            (6, 10, 15),
            (1 / 3, 1.0, 2.0),
        )
        for plan, count, relative_value in plans:
            _plans.append((
                (plan, count),
                (len(plan.sql.aliases), relative_value),
            ))
        self.buckets = get_buckets(_plans, _criteria)
        new_buckets = []
        for bucket_label, bucket in self.buckets.items():
            new_bucket = []
            new_buckets.append(new_bucket)
            for plan, count in bucket:
                # ignore plan counts
                new_bucket.append(plan)
        self.rl_model.bucket_memory.load_buckets(new_buckets)
        self.rl_model.bucket_memory.weights = [1. for _ in range(len(new_buckets))]
        self.rl_model.init_domain_weights(len(new_buckets))

        self.rl_model.pair_memory.load_state_dict({
            'memories': new_pair_memory,
        })
        self.log('Loaded')

    def load_experiences(self, checkpoint_file):
        self.log(f'Loading experiences from {checkpoint_file}')
        dic = load_checkpoint_torch(checkpoint_file)
        self.rl_model.best_values.load_state_dict(dic['rl_model']['best_values'])
        if 'experiences' in dic:
            pair_memories = [*map(lambda x: x['pair_memory'], dic['experiences'].values()), dic['rl_model']['pair_memory']['memories']]
        else:
            pair_memories = [dic['rl_model']['pair_memory']['memories']]
        cache = dic['rl_model']['best_values']['cache']

        def reconstruct_plan(plan):
            new_plan : Plan = reconstruct_object(plan, Plan)
            new_plan.sql = reconstruct_object(new_plan.sql, Sql)
            return new_plan

        new_pair_memory = []
        for pair_memory_dict in pair_memories:
            for sql_name, plan_dict in pair_memory_dict.items():
                new_pair_memory.extend(
                    map(
                        lambda x: (
                            x[0],
                            reconstruct_plan(x[1]),
                            self.rl_model._rev_value_preprocess(cache[x[0]]),
                        ),
                        plan_dict.items(),
                    ),
                )

        plans = list(
            filter(
                lambda x: self.rl_model._get_best_value(x)[1] is not None,
                map(lambda x: x[1], new_pair_memory),
            ),
        )
        self.log(f'Loaded {len(plans)} plans')
        buckets, indices = self.bucket_splitter.get_buckets(plans, remove_empty=True, return_bucket_indices=True)
        self._bucket_indices = indices
        self.rl_model.bucket_memory.load_buckets(buckets)
        self.rl_model.bucket_memory.weights = [1. for _ in range(len(buckets))]
        self.rl_model.init_domain_weights(len(buckets))

        self.log('Loaded')
        self.log(f'Bucket size: {len(buckets)}')

    def load_experiences_cache(self, sql_dataset):
        self.log('Loading experiences from cache')

        cache_table = self.cache_manager._check_postgres()
        def quote(k : str):
            return k.replace("'", "''").replace("\\", "\\\\")

        def load_plan(plan_str, sql):
            plan_dict = json.loads(plan_str)
            parsed = sql_parser.PlanParser(plan_dict)
            plan = Plan(sql)
            try:
                for action in parsed.join_order:
                    plan.join(*action)
                return plan
            except:
                return None

        sql_dataset = {sql.filename : sql for sql in sql_dataset}
        sql_dataset = list(sql_dataset.values())

        base_sql = f"""select latency, plan from {cache_table} where hostname = E'{quote(database._hostname)}' and dbname = E'{quote(database._dbname)}' and port = {database._port}"""
        self.log('Collecting plans')
        collected_complete_plans = []
        for sql in tqdm(sql_dataset, desc='Collecting'):
            sql_hash = f'{sql.filename}'
            cache_sql = base_sql + f" and plan is not null and plan <> 'null' and hash_key like E'{sql_hash}%' order by latency asc"
            values = list(database.execute(cache_sql))
            base_plan_latency = plan_latency(sql, self.cache_manager)
            completed_plans = []
            added_completed = set()
            for latency, plan_str in values:
                plan = load_plan(plan_str, sql)
                if not plan:
                    continue
                plan_hash = f'{plan.sql.filename} {plan.hints(operators=True)}'
                if plan_hash not in added_completed:
                    added_completed.add(plan_hash)
                    completed_plans.append((plan, latency, latency / base_plan_latency))
            collected_complete_plans.extend(completed_plans)

        self.log(f'Loaded {len(collected_complete_plans)} plans')
        plans = [x[0] for x in collected_complete_plans]
        for plan, latency, relative in collected_complete_plans:
            self.rl_model.add_pair_memory(plan, latency)
        buckets, indices = self.bucket_splitter.get_buckets(plans, remove_empty=True, return_bucket_indices=True)
        self._bucket_indices = indices
        self.rl_model.bucket_memory.load_buckets(buckets)
        self.rl_model.bucket_memory.weights = [1. for _ in range(len(buckets))]
        self.rl_model.init_domain_weights(len(buckets))

        self.log('Loaded')
        self.log(f'Bucket size: {len(buckets)}')

    def load_checkpoint(self, checkpoint_file=None):
        if checkpoint_file is None:
            checkpoint_file = self.checkpoint_file
        elif not isinstance(checkpoint_file, Path):
            checkpoint_file = Path(checkpoint_file)
        self.log(f'Loading checkpoint from {checkpoint_file}')
        if os.path.isdir(checkpoint_file):
            checkpoint_file = checkpoint_file / 'checkpoint.pkl'
        dic = load_checkpoint_torch(checkpoint_file)
        self.load_state_dict(dic)
        if self.current_status['stage'] in ('train_proxy', 'done') and self._restart_training_proxy:
            self.current_status = {
                'stage': 'train_proxy',
                'iter': 0,
            }
            self.rl_model.reset_parameters()
            self.rl_model.init_domain_weights()
        self.log('Loaded')

    def save_checkpoint(self, checkpoint_file=None):
        if checkpoint_file is None:
            checkpoint_file = self.checkpoint_file
        elif not isinstance(checkpoint_file, Path):
            checkpoint_file = Path(checkpoint_file)
        self.log(f'Saving checkpoint to {checkpoint_file}')
        if database.config.save_checkpoint_as_folder:
            tmp_file = checkpoint_file.parent / '.{}.tmp'.format(checkpoint_file.name)
            target_file = checkpoint_file / 'checkpoint.pkl'
            if os.path.isfile(checkpoint_file):
                if os.path.isfile(tmp_file):
                    os.remove(tmp_file)
                os.rename(checkpoint_file, tmp_file)
            os.makedirs(checkpoint_file, exist_ok=True)
            if not os.path.isfile(target_file) and os.path.isfile(tmp_file):
                os.rename(tmp_file, checkpoint_file / 'checkpoint.pkl')
            res = save_torch(self.state_dict(), target_file)
        else:
            res = save_torch(self.state_dict(), checkpoint_file)
        self.log('Saved')
        return res

    def save_log_data(self):
        path = Path('results') / self.experiment_id
        os.makedirs(path, exist_ok=True)
        file = path / 'log.csv'
        df = pd.DataFrame({k : v for k, v in zip(
            ('stage', 'iter', 'loss_reg', 'loss_cls', 'domain_weights'),
            zip(*self._log_data),
        )})
        df.to_csv(file, index=False)
        return df

    def train(self, reference_iterations=4800, proxy_iterations=4800, save_interval=400):
        # training_reference model
        if self.current_status['stage'] == 'train_reference':
            self.log('Training reference model')
            self.rl_model.train_reference = True
            bar = tqdm(initial=self.current_status['iter'], total=reference_iterations)
            for iteration_index in range(self.current_status['iter'], reference_iterations):
                loss = self.rl_model.train(1)
                self.current_status['iter'] = iteration_index + 1
                if (iteration_index + 1) % save_interval == 0:
                    self.save_checkpoint()
                self._log_data.append(
                    ('train_reference', iteration_index, loss['loss']['reg'], loss['loss']['cmp'], self.rl_model.domain_weights.tolist()),
                )
                bar.set_postfix({
                    'reg': loss['loss']['reg'],
                    'cls': loss['loss']['cmp'],
                })
                bar.update(1)
                if (iteration_index + 1) % 100 == 0:
                    self.log(
                        f'Domain weights: {", ".join(map(lambda x: "%.3f" % x, self.rl_model.domain_weights.cpu().tolist()))}')
                    self.save_log_data()
            bar.close()

            self.current_status = {
                'stage': 'train_proxy',
                'iter': 0,
            }
            self.rl_model.set_reference_model()
            self.save_checkpoint()

        # training proxy model
        if self.current_status['stage'] == 'train_proxy':
            self.log('Training proxy model')
            self.rl_model.train_reference = False
            bar = tqdm(initial=self.current_status['iter'], total=proxy_iterations)
            for iteration_index in range(self.current_status['iter'], proxy_iterations):
                loss = self.rl_model.train(1)
                self.current_status['iter'] = iteration_index + 1
                if (iteration_index + 1) % save_interval == 0:
                    self.save_checkpoint()
                self._log_data.append(
                    ('train_proxy', iteration_index, loss['loss']['reg'], loss['loss']['cmp'])
                )
                bar.set_postfix({
                    'reg': loss['loss']['reg'],
                    'cls': loss['loss']['cmp'],
                })
                bar.update(1)
                if (iteration_index + 1) % 100 == 0:
                    self.log(
                        f'Domain weights: {", ".join(map(lambda x: "%.3f" % x, self.rl_model.domain_weights.cpu().tolist()))}')
                    self.save_log_data()
            bar.close()
            self.log('Done')
            self.log(f'Domain weights: {", ".join(map(lambda x: "%.3f" % x, self.rl_model.domain_weights.cpu().tolist()))}')

            self.current_status = {
                'stage': 'done',
                'iter': 0,
            }
            self.save_checkpoint()

def main():
    os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('-d', '--dataset', type=str, nargs='+', default=[],
                        help='Datasets.')
    parser.add_argument('-F', '--id', type=str, default=None,
                        help='File ID.')
    parser.add_argument('--fast-warm-up', action='store_true',
                        help='To warm up the database by traversing all relations.')
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
    parser.add_argument('--experiences', type=str, default=None,
                        help='To add initial experiences from another checkpoint.')
    parser.add_argument('--drop-timeout-cache', action='store_true',
                        help='To drop unsuccessfully executed plans in the cache before training.')
    parser.add_argument('--reference-iterations', type=int, default=500,
                        help='Total training iterations.')
    parser.add_argument('--proxy-iterations', type=int, default=2000,
                        help='Total training iterations.')
    parser.add_argument('--save-interval', type=int, default=2000,
                        help='The interval of saving checkpoints.')
    parser.add_argument('--restart-training-proxy', action='store_true',
                        help='To restart from the beginning of proxy model training.')

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

    if args.id is not None:
        database.config.experiment_id = args.id
    if args.seed is not None:
        database.config.seed = args.seed

    dataset_paths = args.dataset

    datasets = []
    print('Generating datasets', file=sys.stderr)
    for dataset_path in dataset_paths:
        dataset = load_dataset(dataset_path, device=device, verbose=True)
        if dataset:
            datasets.extend(dataset)

    seed(database.config.seed)
    if args.fast_warm_up:
        gen = tqdm(database.schema.tables, 'Warm up')
        for table_obj in gen:
            gen.set_postfix({'name': table_obj.name})
            _sql = f'select * from {table_obj.name}'
            database.execute(_sql)

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

    database.config.feature_size = 128#256
    database.config.embedding_size = 128#256
    database.config.extractor_hidden_size = 128#256
    database.config.transformer_hidden_size = 128#256
    database.config.batch_size = 512
    database.config.lora_settings = (
        {'epoch': 0, 'rank': 8, 'model': {'extractor': False, 'transformer': False}},
    )
    database.config.regularization_info = ()

    try:
        trainer = DoremiTrainer(
            device=device,
            datasets=datasets,
            experience_checkpoint_file=args.experiences,
            restart_training_proxy=args.restart_training_proxy,
        )
        trainer.train(
            args.reference_iterations,
            args.proxy_iterations,
            args.save_interval,
        )
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
