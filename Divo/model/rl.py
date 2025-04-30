import math
import random
import typing
import logging
import asyncio
import copy
from collections.abc import Iterable

import torch
import torch.nn.functional as F
import dgl

from sql import Operators, PlanParser
from model.rl import PriorityMemory, HashPairMemory, PackedMemory
from model.rl import LinearExplorer
from model.rl import BestCache, RecentCache, TopCache
from model.optim import lr_scheduler
from lib.tools.log import Logger
from lib.tools.timer import timer
from lib.tools.interfaces import StateDictInterface
from lib.tools.randomizer import Randomizer
from lib.torch.torch_summary import sum_batch, dict_map
from lib.torch.functional import diagonal_sum, value_to_class_labels, class_labels_to_value, prob_compress
from lib.torch.lora import lora_state_dict

from ..core.sql_featurizer import database, Sql
from ..core.plan_featurizer import Plan
from .extractor import Extractor, TransformerExtractor
from .transformer import PlanTransformer
from .tree_lstm import TreeLSTM
from .train import CacheManager


class ValueBasedRL(StateDictInterface):
    def __init__(
        self,
        device=torch.device('cpu'),
        num_table_layers=1,
        initial_exploration_prob=0.8,
    ):
        self.__device = device
        self.__train_mode = True
        self.__validating = False

        self._operator_types = [
            Operators.default,
        ]

        self.cache : CacheManager = ...
        self.register(
            'cache',
            CacheManager(),
        )

        self.randomizer : random.Random = ...
        self.register(
            'randomizer',
            Randomizer(random.getrandbits(64)),
        )

        self.memory : PriorityMemory = ...
        self.register(
            'memory',
            PriorityMemory(
                size=database.config.memory_size,
                priority_size=4,
                seed=self.randomizer.getrandbits(64),
            )
        )

        self.pair_memory : HashPairMemory = ...
        self.register(
            'pair_memory',
            HashPairMemory(
                seed=self.randomizer.getrandbits(64),
            ),
        )

        self.best_values : BestCache = ...
        self.register(
            'best_values',
            BestCache(),
        )

        self.baseline_values = {}
        self.register('baseline_values')

        self.recent_values : RecentCache = ...
        if database.config.rl_recent_cache_use_best:
            self.register(
                'recent_values',
                TopCache(
                    large_best=False,
                    capacity=database.config.rl_recent_cache_capacity,
                ),
            )
        else:
            self.register(
                'recent_values',
                RecentCache(capacity=database.config.rl_recent_cache_capacity),
            )

        self.explorer : LinearExplorer = ...
        self.register(
            'explorer',
            LinearExplorer(
                start=initial_exploration_prob,
                end=0.2,
                steps=320,
            ),
        )

        self.epoch : int = ...
        self.register('epoch', 0)

        self._regularization_info = None
        self._num_table_layers = num_table_layers
        self.model_init()
        self.optimizer_init()
        if database.config.use_lstm:
            self.initial_parameters: typing.Dict[str, typing.List[torch.nn.Parameter]] = ...
            self.register(
                'initial_parameters',
                {
                    'model_extractor': self.model_extractor.state_dict(),
                    'model_lstm': self.model_lstm.state_dict(),
                }
            )
        else:
            self.initial_parameters : typing.Dict[str, typing.List[torch.nn.Parameter]] = ...
            self.register(
                'initial_parameters',
                {
                    'model_extractor': self.model_extractor.state_dict(),
                    'model_transformer': self.model_transformer.state_dict(),
                }
            )

        self.to(self.__device)
        self.train_mode(self.__train_mode)

    _all_modules = ('model_extractor', 'model_transformer', 'model_lstm')
    _lora_target_modules = ('model_extractor', 'model_transformer', 'model_lstm')
    def load_state_dict(self, dic : dict):
        new_dic = dict(dic)
        for name in self._lora_target_modules:
            if name in new_dic:
                item = new_dic.pop(name)
                target = getattr(self, name)
                target.load_state_dict(item, strict=False)
        return super().load_state_dict(new_dic)

    def lora_state_dict(self, return_all=True):
        if return_all:
            dic = self.state_dict()
            for name in self._lora_target_modules:
                if name in dic:
                    dic[name] = lora_state_dict(dic[name])
        else:
            dic = {}
            for name in self._lora_target_modules:
                target = getattr(self, name, None)
                assert target is not None, f"submodule '{name}' is not found"
                dic[name] = lora_state_dict(target)
        return dic

    def model_init(self):
        self.model_extractor : TransformerExtractor = ...
        self.register(
            'model_extractor',
            Extractor(
                num_table_layers=self._num_table_layers,
            )
            if not database.config.extractor_use_transformer else
            TransformerExtractor()
        )

        if database.config.use_lstm:
            self.model_lstm : TreeLSTM = ...
            self.register(
                'model_lstm',
                TreeLSTM(
                    feature_size=database.config.feature_size,
                    input_size=Plan.LSTM_EXTRA_INPUT_SIZE,
                    output_size=database.config.classification_num_classes,
                    squeeze=False,
                )
            )
        else:
            self.model_transformer : PlanTransformer = ...
            self.register(
                'model_transformer',
                PlanTransformer(
                    emb_size=database.config.feature_size,
                    hidden_size=database.config.transformer_hidden_size,
                    head_size=database.config.transformer_attention_heads,
                    dropout=database.config.transformer_fc_dropout_rate,
                    attention_dropout_rate=database.config.transformer_attention_dropout_rate,
                    n_layers=database.config.transformer_attention_layers,
                    out_dim=database.config.classification_num_classes,
                    use_node_attrs=database.config.plan_use_node_attrs,
                    node_attr_norm_type=database.config.transformer_node_attrs_preprocess_norm_type,
                    norm_type=database.config.transformer_norm_type,
                    index_info_size=database.config.plan_index_info_shape,
                    lora_rank=database.config.lora_rank,
                    moe_num_experts=database.config.transformer_moe_num_experts,
                    moe_k=database.config.transformer_moe_num_selected_experts,
                    moe_exploration_mode=database.config.transformer_moe_exploration_mode,
                    moe_softmax_temperature=database.config.transformer_moe_softmax_temperature,
                    moe_epsilon=database.config.transformer_moe_epsilon,
                    moe_weight_thres=database.config.transformer_moe_weight_thres,
                    moe_hidden_size=database.config.transformer_moe_hidden_size,
                )
            )
            self.model_transformer.encoder_weight = database.config.transformer_encoder_weight

    def optimizer_init(self):
        optimizer = getattr(torch.optim, database.config.optimizer_info['type'])
        if database.config.use_lstm:
            self.optim: torch.optim.Optimizer = ...
            self.register(
                'optim',
                optimizer(
                    [
                        {'params': self.model_extractor.parameters(), 'lr': database.config.learning_rate},
                        {'params': self.model_lstm.parameters(), 'lr': database.config.learning_rate},
                    ],
                    **database.config.optimizer_info['args'],
                )
            )
        else:
            self.optim : torch.optim.Optimizer = ...
            self.register(
                'optim',
                optimizer(
                    [
                        {'params': self.model_extractor.parameters(), 'lr': database.config.learning_rate},
                        {'params': self.model_transformer.parameters(), 'lr': database.config.learning_rate},
                    ],
                    **database.config.optimizer_info['args'],
                )
            )
        self.sched : torch.optim.lr_scheduler.LRScheduler = ...
        scheduler = getattr(lr_scheduler, database.config.scheduler_info['type'])
        self.register(
            'sched',
            scheduler(
                self.optim,
                **database.config.scheduler_info['args'],
            )
        )

    def reset(self):
        self.explorer.reset()
        self.memory.clear()
        self.best_values.clear()
        self.recent_values.clear()
        self.reset_parameters()
        return self

    def reset_parameters(self):
        old_model_extractor = getattr(self, 'model_extractor', None)
        if isinstance(old_model_extractor, Extractor if not database.config.extractor_use_transformer else TransformerExtractor):
            old_model_extractor_zscore = old_model_extractor.table_transform.zscore_table_features.state_dict() if isinstance(old_model_extractor, Extractor) else None
            del old_model_extractor, self.model_extractor
        else:
            old_model_extractor_zscore = None
        if database.config.use_lstm:
            old_model_transformer_zscore = None
            del self.model_lstm
        else:
            old_model_transformer = getattr(self, 'model_transformer', None)
            if isinstance(old_model_transformer, PlanTransformer):
                old_model_transformer_zscore = old_model_transformer.node_attr_zscore.state_dict()
                del old_model_transformer, self.model_transformer
            else:
                old_model_transformer_zscore = None
        old_optimizer = getattr(self, 'optim', None)
        if old_optimizer is not None:
            del old_optimizer, self.optim
        old_scheduler = getattr(self, 'sched', None)
        if old_scheduler is not None:
            del old_scheduler, self.sched

        self.model_init()
        self.optimizer_init()
        if old_model_extractor_zscore:
            self.model_extractor.table_transform.zscore_table_features.load_state_dict(old_model_extractor_zscore)
        if not database.config.use_lstm:
            if old_model_transformer_zscore:
                self.model_transformer.node_attr_zscore.load_state_dict(old_model_transformer_zscore)
        self.to(self.__device)

    def model_state_dict(self, deep=False):
        res = {
            'model_extractor': self.model_extractor.state_dict(),
        }
        if hasattr(self, 'model_lstm'):
            res['model_lstm'] = self.model_lstm.state_dict()
        if hasattr(self, 'model_transformer'):
            res['model_transformer'] = self.model_transformer.state_dict()
        if deep:
            res = copy.deepcopy(res)
        return res

    @property
    def is_train_mode(self):
        return self.__train_mode

    def train_mode(self, mode = True):
        if not isinstance(mode, bool):
            raise ValueError("training mode is expected to be boolean")
        self.__train_mode = mode
        self.model_extractor.train(mode)
        if database.config.use_lstm:
            self.model_lstm.train(mode)
        else:
            self.model_transformer.train(mode)
        return self

    def eval_mode(self):
        return self.train_mode(False)

    def validate(self, mode = True):
        if not isinstance(mode, bool):
            raise ValueError("validating mode is expected to be boolean")
        self.__validating = mode
        return self

    @property
    def validating(self):
        return self.__validating

    @property
    def device(self):
        return self.__device

    def to(self, device):
        self.__device = device
        self.model_extractor.to(device)
        if database.config.use_lstm:
            self.model_lstm.to(device)
        else:
            self.model_transformer.to(device)
        return self

    def schedule(self, epoch=None):
        self.sched.step(epoch)
        if epoch is None:
            self.epoch += 1
        else:
            self.epoch = epoch

    def _map_explain_info_to_plan(self, plan : Plan):
        if not database.config.plan_use_node_attrs:
            return plan
        if database.config.plan_explain_use_partial_plan:
            plan_sql = plan.to_sql_node(plan.total_branch_nodes - 1)
        else:
            plan_sql = str(plan)
        if database.config.plan_explain_use_cache and not self.validating:
            explain_plan_dic = self.cache.get(plan_sql, None)
            if explain_plan_dic is None:
                explain_plan_dic = database.plan(plan_sql)[0][0][0]
                self.cache.put(plan_sql, explain_plan_dic, hash_key=plan_sql)
        else:
            explain_plan_dic = database.plan(plan_sql)[0][0][0]
        plan.set_node_attrs_from_parsed_plan(explain_plan_dic['Plan'])
        return plan

    def plan_init(self, state : typing.Union[Plan, Sql], grad=False):
        if isinstance(state, Sql):
            state = Plan(state, device=self.device)

        if database.config.extractor_use_transformer:
            graph, graph_node_indices = state.sql.homo_graph, state.sql.graph_node_indices
        else:
            graph, graph_node_indices = state.sql.graph, state.sql.graph_node_indices

        grad_prev = torch.is_grad_enabled()
        torch.set_grad_enabled(grad)
        original_mode = self.__train_mode
        self.eval_mode()
        try:
            graph = self.model_extractor(graph)
        finally:
            self.train_mode(original_mode)
            torch.set_grad_enabled(grad_prev)

        if database.config.extractor_use_transformer:
            state.set_leaf_embeddings(graph.ndata['res'][graph.ndata['classes'] == 1], graph_node_indices)
            del graph.ndata['res']
        else:
            state.set_leaf_embeddings(graph.nodes['table'].data['res'], graph_node_indices)
            del graph.nodes['table'].data['res']
        return state

    async def _async_map_explain_info_to_plan(self, plan : Plan):
        if not database.config.plan_use_node_attrs:
            return plan

        async def _get_database_plan(sql):
            res = await database.async_plan(sql)
            return res[0][0][0]

        if database.config.plan_explain_use_partial_plan:
            plan_sql = plan.to_sql_node(plan.total_branch_nodes - 1)
        else:
            plan_sql = str(plan)
        if database.config.plan_explain_use_cache and not self.validating:
            explain_plan_dic = self.cache.get(plan_sql, None)
            if explain_plan_dic is None:
                explain_plan_dic = await _get_database_plan(plan_sql)
                self.cache.put(plan_sql, explain_plan_dic, hash_key=plan_sql)
        else:
            explain_plan_dic = await _get_database_plan(plan_sql)
        plan.set_node_attrs_from_parsed_plan(explain_plan_dic['Plan'])
        return plan

    def _async_get_next_state_seqs(self, state, candidates):
        async def get_seq(state, left_alias, right_alias):
            new_state = state.clone()
            for operator_type in self._operator_types:
                new_state.join(left_alias, right_alias, operator_type)
            await self._async_map_explain_info_to_plan(new_state)
            seq = new_state.to_sequence()
            return seq

        async def get_all_seqs(state, candidates):
            sequences = await asyncio.gather(
                *(get_seq(state, left_alias, right_alias) for left_alias, right_alias in candidates)
            )
            return sequences

        return asyncio.run(get_all_seqs(state, candidates))

    def transformer_switch_mode(self, value):
        if database.config.transformer_use_two_submodels:
            self.model_transformer.switch_mode(value)
        else:
            self.model_transformer.switch_mode(0.)

    def search(
        self,
        states : typing.Iterable[typing.Union[Plan, typing.Tuple[Plan, bool]]],
        bushy : bool = True,
        beam_size : int = 1,
        exploration : bool = False,
        exploration_bias : float = None,
        detail : bool = False,
        baseline_bushy_level = None,
        suppress_bushy = False,
        extra_states : typing.Iterable[Plan] = None,
    ):
        self.transformer_switch_mode(database.config.transformer_encoder_weight)

        if exploration_bias is None:
            exploration_bias = 0.

        all_candidates = []
        all_res = []
        exploration_mask = []
        times = {
            'gpu': 0.,
            'explain': 0.,
            'to_sequence': 0.,
            'join': 0.,
        }

        state_candidates = []
        states = list(states)
        for state_index, state in enumerate(states):
            state : Plan
            if isinstance(state, tuple):
                state, is_exploration_branch = state
            else:
                is_exploration_branch = False

            state_bushy_level = state._bushy
            _bushy = True
            if baseline_bushy_level is not None and database.config.bushy_suppress_ratio > 0:
                if state_bushy_level >= baseline_bushy_level and suppress_bushy:#self.randomizer.random() < database.config.bushy_suppress_ratio:
                    _bushy = False

            _candidates = state.candidates(bushy=bushy, unordered=database.config.plan_table_unordered)
            if not _bushy:
                # remove candidates that join two single tables, which will increase bushy level
                candidates = list(filter(lambda x: not (isinstance(x[0], str) and isinstance(x[1], str)), _candidates))
            else:
                candidates = _candidates

            # to make the results reproducible
            candidates = sorted(candidates, key=str)
            state_candidates.append((state_index, state, candidates, is_exploration_branch))

        if extra_states:
            for state_index, state in enumerate(extra_states):
                state_index = len(states) + state_index
                state_candidates.append((state_index, state, None, False))

        for state_index, state, candidates, is_exploration_branch in state_candidates:
            if candidates is not None:
                all_candidates.extend(map(lambda x: (state_index, state, x), candidates))
            else:
                all_candidates.append((state_index, state, None))

            with torch.no_grad():
                sequences = []
                new_states = []
                if candidates is not None:
                    for left_alias, right_alias in candidates:
                        with timer:
                            new_state = state.clone()
                            new_states.append(new_state)
                            for operator_type in self._operator_types:
                                new_state.join(left_alias, right_alias, operator_type)
                            sequence_state = new_state
                        times['join'] += timer.time

                        with timer:
                            # if attach_before_selection is not activated,
                            #  only attach info when the new state is completed
                            if new_state.completed or database.config.plan_attach_node_attrs_before_selection:
                                self._map_explain_info_to_plan(new_state)
                        times['explain'] += timer.time

                        if database.config.use_lstm:
                            with timer:
                                last_action = sequence_state.get_last_action_embeddings()
                            times['to_sequence'] += timer.time
                            sequences.append(last_action)
                        else:
                            with timer:
                                seq = sequence_state.to_sequence()
                            times['to_sequence'] += timer.time
                            sequences.append(seq)
                else:
                    sequence_state = state
                    if database.config.use_lstm:
                        with timer:
                            last_action = sequence_state.get_last_action_embeddings()
                        times['to_sequence'] += timer.time
                        sequences.append(last_action)
                    else:
                        with timer:
                            seq = sequence_state.to_sequence()
                        times['to_sequence'] += timer.time
                        sequences.append(seq)

                if database.config.use_lstm:
                    with timer:
                        new_embeddings = self.model_lstm(sequences)
                        root_embeddings = []
                        for index, new_state in enumerate(new_states):
                            new_state.set_layer_embeddings(
                                new_embeddings['node_index'],
                                new_embeddings,
                                source_indices=index,
                            )
                            root_embeddings.append(new_state.get_root_embeddings().mean(dim=0))
                        probs, res = self.model_lstm.predict(root_embeddings)
                        if database.config.rl_search_use_classification:
                            res = probs
                        else:
                            res = res.view(-1)
                    times['gpu'] += timer.time
                else:
                    with timer:
                        embs, probs, res = self.model_transformer(sequences, dropout=False)
                        if database.config.rl_search_use_classification:
                            res = probs
                        else:
                            res = res.view(-1)
                    times['gpu'] += timer.time
                #res = res / database.config.classification_softmax_temperature

            all_res.append(res)
            exploration_mask.extend((is_exploration_branch for i in range(res.shape[0])))

        with timer:
            # [batch_size, num_classes]
            _all_res = torch.cat(all_res, dim=0)
            if database.config.rl_search_use_classification:
                if database.config.classification_use_window_max:
                    all_res = self._class_labels_to_values(
                        _all_res,
                        detail=True,
                        window_size=database.config.classification_window_size,
                    )['max_window_mean']
                else:
                    all_res = self._class_labels_to_values(_all_res)
            else:
                all_res = _all_res
            exploration_mask = torch.tensor(exploration_mask, device=self.device)
        times['gpu'] += timer.time

        prob = self.explorer.prob
        prob_coef = database.config.topk_explore_prob_coef
        prob = prob + (1 - prob) * (1 - math.exp(-prob_coef * exploration_bias))

        exploration_branches = 0
        beam_size = min(beam_size, len(all_candidates))
        if exploration:
            if beam_size > 1:
                exploration_branches = 1
            for i in range(beam_size - 2):
                if self.explorer.explore(prob):
                    exploration_branches += 1

        with timer:
            selected_res = torch.topk(all_res, beam_size - exploration_branches, largest=False, sorted=True)
            selected_items, selected_res = selected_res.values.tolist(), selected_res.indices.tolist()
            exploration_mask[selected_res] = False
        times['gpu'] += timer.time

        if exploration_branches > 0:
            exploration_aug_ratio = database.config.topk_explore_lambda
            explore_res = self.randomizer.sample(range(len(all_candidates) * len(self._operator_types)), beam_size)
            explore_res = list(filter(lambda x: x not in selected_res, explore_res))
            explore_res = explore_res[:round(exploration_branches * exploration_aug_ratio)]

            with timer:
                exploration_mask[explore_res] = True
                explore_all_res = all_res - 256 * exploration_mask
                explore_res = torch.topk(explore_all_res, exploration_branches, largest=False, sorted=True).indices.tolist()
            times['gpu'] += timer.time
        else:
            explore_res = []

        for index in explore_res:
            selected_items.append(all_res[index].item())
        selected_res.extend(explore_res)

        selected = []
        for index in selected_res:
            selected_index = index // len(self._operator_types)
            selected_operator = index % len(self._operator_types)
            state_index, state, action = all_candidates[selected_index]
            if action is not None:
                selected.append((state_index, state, (*action, self._operator_types[selected_operator])))
            else:
                selected.append((state_index, state, None))

        if detail:
            return {
                'result': selected,
                'exploration_branches': exploration_branches,
                'exploration_prob': prob,
                'selected_item_logits': selected_items,
                'stats': {
                    'min': all_res.min().item(),
                    'max': all_res.max().item(),
                    'mean': all_res.mean().item(),
                },
                'time': times,
            }

        return selected

    def step(self, state : Plan, action : tuple, join=None):
        if len(action) < 3:
            if join is None:
                join = self._operator_types[0]
            action = (*action, join)
        state.join(*action)
        if database.config.use_lstm:
            last_action = state.get_last_action_embeddings()
            new_embeddings = self.model_lstm([last_action])
            state.set_layer_embeddings(
                new_embeddings['node_index'],
                new_embeddings,
                source_indices=0,
            )
        self._map_explain_info_to_plan(state)
        return state

    def get_plan(self, sql : Sql, bushy=True, beam_size=None, detail=False, multiple=False):
        times = []
        _train_mode = self.__train_mode
        self.eval_mode()
        try:
            with timer:
                if beam_size is None:
                    beam_size = database.config.beam_width
                with timer:
                    plan = self.plan_init(sql)
                times.append({'init': timer.time})
                baseline_plans = None
                if database.config.rl_use_baseline_as_a_path:
                    baseline_plan_dic = database.plan(str(sql))[0][0][0]['Plan']
                    baseline_parser = PlanParser(baseline_plan_dic)
                    baseline_plan = plan
                    baseline_plans = []
                    for action in baseline_parser.join_order:
                        baseline_plans.append(baseline_plan)
                        baseline_plan = baseline_plan.clone()
                        self.step(baseline_plan, action)
                    baseline_plans.append(baseline_plan)
                    for _baseline_plan in baseline_plans:
                        _baseline_plan.set_node_attrs_from_parsed_plan(baseline_plan_dic)
                plans = [plan]
                while not plans[0].completed:
                    step = plans[0].total_branch_nodes
                    if baseline_plans and step > 0:
                        plans.append(baseline_plans[step])
                    selected_result = self.search(plans, beam_size=beam_size, exploration=False, bushy=bushy, detail=True)
                    selected = selected_result['result']
                    times.append(selected_result['time'])
                    plans = []
                    for _, plan, action in selected:
                        plan = plan.clone()
                        self.step(plan, action)
                        plans.append(plan)
                if multiple:
                    plan = plans
                else:
                    plan = plans[0]
            times = sum_batch(times)
            times['total'] = timer.time
            if detail:
                return {
                    'result': plan,
                    'time': times,
                }
            return plan
        finally:
            self.train_mode(_train_mode)

    def _gt_convert(self, gt : typing.Union[int, float, typing.Iterable[float]], reward_weighting=0.1):
        if isinstance(gt, (int, float)):
            gt = (gt, gt)
        gt = tuple(map(self._value_preprocess, gt))
        gt = self._gt_process((gt,), reward_weighting=reward_weighting).item()
        return gt

    def _class_labels_comparison_vector(self, probs : torch.Tensor, base_probs : torch.Tensor, use_softmax=True):
        if use_softmax:
            probs = probs.softmax(-1)
            base_probs = base_probs.softmax(-1)
        # [..., num_classes, num_classes],
        #   where [..., num_classes - 1, 0] represents pred == 0 and base == num_classes - 1
        joint_dist_probs = probs.view(*probs.shape[:-1], 1, -1) * base_probs.view(*base_probs.shape[:-1], -1, 1)
        # [..., 2 * num_classes - 1],
        #   where [..., k] represents preds == k + base - (num_classes - 1)
        diff_probs = diagonal_sum(joint_dist_probs)
        return diff_probs

    def _gt_to_class_labels(
        self,
        gt : typing.Union[float, torch.Tensor],
        std : typing.Union[float, torch.Tensor] = None,
        retain_shape : bool = False,
    ):
        # we assume that the log of gt follows a normal distribution
        if isinstance(gt, (int, float)):
            gt = torch.tensor(gt, dtype=torch.float, device=self.device)
        return value_to_class_labels(
            gt,
            database.config.classification_min_log_value,
            database.config.classification_max_log_value,
            database.config.classification_num_classes,
            std if std is not None else database.config.classification_normal_std,
            retain_shape=retain_shape,
        )

    def _class_labels_to_values(
        self,
        logits : torch.Tensor,
        use_softmax : bool = True,
        detail=False,
        confidence_prob=None,
        window_size=None,
    ):
        return class_labels_to_value(
            logits,
            database.config.classification_min_log_value,
            database.config.classification_max_log_value,
            database.config.classification_num_classes,
            use_softmax=use_softmax,
            detail=detail,
            confidence_prob=confidence_prob,
            window_size=window_size,
        )

    def predict_plan(
        self,
        state : Plan,
        detail=False,
        regression=False,
        *,
        gt : typing.Union[None, int, float, typing.Iterable[float]] = None,
        use_classification=False,
        reward_weighting=0.1,
    ):
        #self.transformer_switch_mode(1 - database.config.transformer_encoder_weight)
        if regression:
            self.transformer_switch_mode(database.config.transformer_encoder_weight)
        else:
            self.transformer_switch_mode(1)
        _train_mode = self.__train_mode
        self.eval_mode()
        try:
            state, *_ = self._batch_embedding_update((state, ))
            if database.config.use_lstm:
                root_embeddings = state.get_root_embeddings().mean(dim=0)
                pred, regression_pred = self.model_lstm.predict(root_embeddings)
            else:
                state_seq = state.to_sequence()
                embs, pred, regression_pred = self.model_transformer([state_seq], dropout=False)#.view(-1)
            pred = pred / database.config.classification_softmax_temperature
            if database.config.predict_use_relative in ('base', 'best'):
                sql_hash = self._get_plan_hash(state.sql)
                if database.config.predict_use_relative == 'base':
                    if sql_hash not in self.baseline_values:
                        raise KeyError(f'cannot find baseline value for {self._get_plan_hash(state, True)}')
                    base_value = self.baseline_values[sql_hash]
                else:
                    base_value = self.best_values[sql_hash]
                _regression_pred = self._gt_process_rev(regression_pred + 3.)
                regression_pred = self._gt_process(_regression_pred * base_value, reward_weighting=None)
            values = self._class_labels_to_values(
                pred,
                detail=True,
                confidence_prob=database.config.classification_confidence_prob,
                window_size=database.config.classification_window_size,
            )
            res = values['mean'].item()
            regression_res = regression_pred.item()
            if detail:
                lb = values['confidence_lower_bound'].item()
                ub = values['confidence_upper_bound'].item()
                max_window_value = values['max_window_mean'].item()
                res = {
                    'value': res if use_classification else regression_res,
                    'pred': self._gt_process_rev(res) if use_classification else self._gt_process_rev(regression_res),
                    'regression_pred': regression_res,
                    'std': values['std'].item(),
                    'skew': values['skewness'].item(),
                    'lb': lb,
                    'ub': ub,
                    'lb_pred': self._gt_process_rev(lb),
                    'ub_pred': self._gt_process_rev(ub),
                    'w_mean': max_window_value,
                    'w_pred': self._gt_process_rev(max_window_value),
                }
                if gt is not None:
                    gt = self._gt_convert(gt, reward_weighting)
                    gt = self._gt_to_class_labels(gt, database.config.classification_normal_std)
                    loss = F.cross_entropy(pred.view(1, -1), gt) + (gt * gt.clamp(1e-8).log()).sum(dim=-1)
                    res['loss'] = loss
            return res if use_classification else regression_res
        finally:
            self.train_mode(_train_mode)

    def prob_advantage(
        self,
        probs : torch.Tensor,
        min=None,
        max=None,
        num_classes=None,
        half_window_size=None,
        mode='integral',
        softmax=False,
    ):
        if min is None:
            min = database.config.classification_min_log_value
        if max is None:
            max = database.config.classification_max_log_value
        if num_classes is None:
            num_classes = database.config.classification_num_classes
        if softmax:
            probs = probs.softmax(dim=-1)
        if half_window_size is not None:
            central_index, is_odd = (num_classes - 1) // 2, (num_classes % 2 == 0)
            if is_odd:
                mask_lower = central_index + 1 - half_window_size
                mask_upper = central_index + 1 + half_window_size
            else:
                mask_lower = central_index - half_window_size
                mask_upper = central_index + 1 + half_window_size
            if mask_lower >= mask_upper:
                raise RuntimeError(f'the window size should be greater than 0')
            mask_lower, mask_upper = max(mask_lower, 0), min(mask_upper, num_classes)
            mask = torch.zeros(num_classes, dtype=torch.float, device=self.device)
            mask[mask_lower: mask_upper] = 1.
            probs = mask * probs
        hist_size = (max - min) / num_classes
        hist_values = torch.arange(min + hist_size / 2, max, hist_size, device=self.device)
        if mode == 'value':
            prob_values = hist_values * probs
            res = prob_values.sum(dim=-1)
        elif mode == 'exp':
            prob_values = (10 ** hist_values) * probs
            res = prob_values.sum(dim=-1).clamp(1e-8).log10()
        elif mode == 'integral':
            hist_integral = (10 ** (hist_values + hist_size / 2) - 10 ** (hist_values - hist_size / 2)) / (math.log(10) * hist_size)
            prob_values = hist_integral * probs
            res = prob_values.sum(dim=-1).clamp(1e-8).log10()
        else:
            raise RuntimeError(f"invalid mode: {mode}")
        return res

    def compare_plan(
        self,
        state1 : Plan,
        state2 : Plan,
        detail=False,
        *,
        gt1 : typing.Union[None, int, float, typing.Iterable[float]] = None,
        gt2 : typing.Union[None, int, float, typing.Iterable[float]] = None,
        reward_weighting=0.1,
    ):
        #self.transformer_switch_mode(1 - database.config.transformer_encoder_weight)
        self.transformer_switch_mode(1)
        _train_mode = self.__train_mode
        self.eval_mode()
        try:
            state1, state2 = self._batch_embedding_update((state1, state2))
            if database.config.use_lstm:
                preds, regression_preds = self.model_lstm.predict([
                    state1.get_root_embeddings().mean(dim=0),
                    state2.get_root_embeddings().mean(dim=0),
                ])#.view(-1)
            else:
                state1_seq, state2_seq = state1.to_sequence(), state2.to_sequence()
                embs, preds, regression_preds = self.model_transformer([state1_seq, state2_seq], dropout=False)#.view(-1)
            preds = preds / database.config.classification_softmax_temperature
            preds_cmp = self._class_labels_comparison_vector(
                preds[0],
                preds[1],
                use_softmax=True,
            )
            preds_cmp_compressed = prob_compress(
                preds_cmp,
                database.config.classification_num_classes - 1,
                database.config.classification_prob_compress_half_size,
            )
            preds_cmp_cumsum = preds_cmp_compressed.cumsum(dim=-1)
            hist_size = (database.config.classification_max_log_value - database.config.classification_min_log_value) \
                            / database.config.classification_num_classes
            """
            preds_cmp_hist_values = torch.arange(
                -hist_size * database.config.classification_prob_compress_half_size,
                hist_size * (database.config.classification_prob_compress_half_size + 0.5),
                hist_size,
                dtype=preds_cmp_compressed.dtype,
                device=preds_cmp_compressed.device,
            )
            # a problem is that the integral from -hist_size / 2 to hist_size / 2 is greater than 0,
            #  so that a normal distribution with mean 0 probably means the base plan is better
            preds_cmp_hist_integral = (10 ** (preds_cmp_hist_values + hist_size / 2) - 10 ** (preds_cmp_hist_values - hist_size / 2)) / (math.log(10) * hist_size)
            preds_cmp_value = (preds_cmp_compressed * preds_cmp_hist_integral).sum().clip(1e-8).log10()
            """
            
            preds_cmp_value = self.prob_advantage(
                preds_cmp_compressed,
                -hist_size * (database.config.classification_prob_compress_half_size + 0.5),
                hist_size * (database.config.classification_prob_compress_half_size + 0.5),
                2 * database.config.classification_prob_compress_half_size + 1,
                mode=database.config.classification_compare_mode,
                softmax=False,
            )

            probs = preds
            values = self._class_labels_to_values(
                probs,
                detail=True,
                confidence_prob=database.config.classification_confidence_prob,
                window_size=database.config.classification_window_size,
            )
            preds = values['mean']
            if detail:
                value1, value2 = preds[0].item(), preds[1].item()
                lb1, lb2 = values['confidence_lower_bound'][0].item(), values['confidence_lower_bound'][1].item()
                ub1, ub2 = values['confidence_upper_bound'][0].item(), values['confidence_upper_bound'][1].item()
                wm1, wm2 = values['max_window_mean'][0].item(), values['max_window_mean'][1].item()
                res = {
                    'value1': value1,
                    'value2': value2,
                    'comparison': preds_cmp_value.item(),
                    'comparison_detail': {
                        'probs': preds_cmp_compressed.tolist(),
                        'cumsum_probs': preds_cmp_cumsum.tolist(),
                    },
                    'detail1': {
                        'value': value1,
                        'pred': self._gt_process_rev(value1),
                        'std': values['std'][0].item(),
                        'skew': values['skewness'][0].item(),
                        'lb': lb1,
                        'ub': ub1,
                        'lb_pred': self._gt_process_rev(lb1),
                        'ub_pred': self._gt_process_rev(ub1),
                        'w_mean': wm1,
                        'w_pred': self._gt_process_rev(wm1),
                    },
                    'detail2': {
                        'value': value2,
                        'pred': self._gt_process_rev(value2),
                        'std': values['std'][1].item(),
                        'skew': values['skewness'][1].item(),
                        'lb': lb2,
                        'ub': ub2,
                        'lb_pred': self._gt_process_rev(lb2),
                        'ub_pred': self._gt_process_rev(ub2),
                        'w_mean': wm2,
                        'w_pred': self._gt_process_rev(wm2),
                    },
                }
                if gt1 is not None:
                    gt1 = self._gt_convert(gt1, reward_weighting)
                    _gt1 = self._gt_to_class_labels(gt1, database.config.classification_normal_std)
                    prob1 = probs[0].view(1, -1)
                    loss = F.cross_entropy(prob1, _gt1) + (_gt1 * _gt1.clamp(1e-8).log()).sum(dim=-1)
                    res['loss1'] = loss.item()
                if gt2 is not None:
                    gt2 = self._gt_convert(gt2, reward_weighting)
                    _gt2 = self._gt_to_class_labels(gt2, database.config.classification_normal_std)
                    prob2 = probs[0].view(1, -1)
                    loss = F.cross_entropy(prob2, _gt2) + (_gt2 * _gt2.clamp(1e-8).log()).sum(dim=-1)
                    res['loss2'] = loss.item()
                if gt1 is not None and gt2 is not None:
                    res['correct'] = (res['comparison'] < 0) ^ (gt1 >= gt2)
                return res
            return preds_cmp_value.item() #(preds[0] - preds[1]).item()
        finally:
            self.train_mode(_train_mode)

    def _get_plan_hash(self, plan, op=True):
        if isinstance(plan, Sql):
            return plan.filename
        return f'{plan.sql.filename} {plan.hints(operators=op)}'

    def _update_best_value(self, state : Plan, value : float):
        state_hash, state_hash_op = self._get_plan_hash(state, False), self._get_plan_hash(state, True)
        if database.config.log_debug:
            previous_value = self.best_values.get(state_hash, None)
            if previous_value is not None and value < previous_value:
                logger = Logger(database.config.log_name)
                logger.log(logging.DEBUG, f'best update: {previous_value: 2.03f} -> {value: 2.03f} | {state_hash}')
        self.best_values[state_hash] = value
        self.best_values[state_hash_op] = value
        self.recent_values[state_hash] = value
        if state_hash_op != state_hash:
            self.recent_values[state_hash_op] = value

    def _get_best_value(self, state : typing.Union[Plan, typing.Iterable[Plan]], throw=False):
        if isinstance(state, Iterable):
            res = []
            for s in state:
                _res = self._get_best_value(s)
                res.append(_res)
            return res

        state_hash, state_hash_op = self._get_plan_hash(state, False), self._get_plan_hash(state, True)
        if throw:
            if state_hash not in self.best_values or state_hash_op not in self.best_values:
                raise KeyError(f'cannot find best value for plan {state_hash_op}')
        return self.best_values.get(state_hash, None), self.best_values.get(state_hash_op, None)

    def _get_recent_values(self, state : typing.Union[Plan, typing.Iterable[Plan]]):
        if isinstance(state, Iterable):
            res = []
            for s in state:
                _res = self._get_recent_values(s)
                res.append(_res)
            return res

        state_hash, state_hash_op = self._get_plan_hash(state, False), self._get_plan_hash(state, True)
        return self.recent_values.get(state_hash_op, None)

    def _value_preprocess(self, value : float):
        return value / 1000

    def _rev_value_preprocess(self, value : float):
        return value * 1000

    def add_memory(self, state : Plan, value : float, update_previous_state: bool = False):
        value = self._value_preprocess(value)

        state = state.clone()
        state.clear_embeddings()
        self._update_best_value(state, value)
        self.memory.push(state)
        if update_previous_state:
            new_state = state.clone()
            new_state.revert()
            self._update_best_value(new_state, value)

    def update_baseline_value(self, sql : Sql, value):
        if isinstance(sql, Plan):
            sql = sql.sql
        value = self._value_preprocess(value)
        self.baseline_values[self._get_plan_hash(sql)] = value

    def update_best_value(self, state : Plan, value):
        value = self._value_preprocess(value)
        self._update_best_value(state, value)

    def add_pair_memory(self, state : Plan, value : float):
        value = self._value_preprocess(value)

        state = state.clone()
        state.clear_embeddings()
        state_hash_op = self._get_plan_hash(state, True)
        sql_hash = self._get_plan_hash(state.sql)
        self.pair_memory.push(state, key=sql_hash, hash=state_hash_op)
        self._update_best_value(state, value)
        self.best_values[sql_hash] = value
        self.recent_values[sql_hash] = value

    def add_priority_memory(self, states : typing.Iterable[Plan], value : float, index=None):
        value = self._value_preprocess(value)

        states = tuple(states)
        if len(states) == 0:
            raise RuntimeError('empty states')
        if index is None:
            index = self._get_plan_hash(states[0].sql)
        states = tuple(map(lambda x: x.clone(), states))
        for state in states:
            state.clear_embeddings()
        self.memory.push_priority_queue(states, value, index)
        for state in states:
            self._update_best_value(state, value)

    def _batch_leaf_embedding_update(self, states : typing.Iterable[Plan], extractor=None):
        if not isinstance(states, tuple):
            states = tuple(states)

        if extractor is None:
            extractor = self.model_extractor

        gs = []
        node_indices_list = []
        if database.config.extractor_use_transformer:
            for state in states:
                gs.append(state.sql.homo_graph)
                node_indices_list.append(state.sql.graph_node_indices)
        else:
            for state in states:
                gs.append(state.sql.graph)
                node_indices_list.append(state.sql.graph_node_indices)

        gs = extractor(dgl.batch(gs).to(self.device))
        gs = dgl.unbatch(gs)
        if database.config.extractor_use_transformer:
            for g, node_indices, state in zip(gs, node_indices_list, states):
                state.clear_embeddings()
                state.set_leaf_embeddings(g.ndata['res'][g.ndata['classes'] == 1], node_indices)
        else:
            for g, node_indices, state in zip(gs, node_indices_list, states):
                state.clear_embeddings()
                state.set_leaf_embeddings(g.nodes['table'].data['res'], node_indices)
        return states

    def _batch_embedding_update(self, states : typing.Iterable[Plan]):
        if not isinstance(states, tuple):
            states = tuple(states)

        self._batch_leaf_embedding_update(states)

        if database.config.use_lstm:
            layer_actions = []
            for state_index, state in enumerate(states):
                state_layer_actions = state.layer_actions()
                for layer_index, layer in enumerate(state_layer_actions):
                    while layer_index >= len(layer_actions):
                        layer_actions.append([() for i in range(state_index)])
                    current_layer_actions = layer_actions[layer_index]
                    current_layer_actions.append(layer)
                for i in range(len(state_layer_actions), len(layer_actions)):
                    current_layer_actions = layer_actions[i]
                    current_layer_actions.append(())
            for depth, layer in enumerate(layer_actions):
                layer_indices = [0]
                layer_seqs = []
                for state, layer_nodes in zip(states, layer):
                    if not layer_nodes:
                        layer_indices.append(layer_indices[-1])
                    else:
                        layer_embedding_seq = state.get_layer_embeddings(layer_nodes)
                        layer_seqs.append(layer_embedding_seq)
                        layer_indices.append(layer_indices[-1] + layer_embedding_seq.sequence_length)
                new_embeddings = self.model_lstm(layer_seqs)
                for index, state in enumerate(states):
                    embedding_slice = slice(layer_indices[index], layer_indices[index + 1])
                    state.set_layer_embeddings(
                        new_embeddings['node_index'],
                        new_embeddings,
                        source_indices=embedding_slice,
                    )

        return states

    def _gt_process(self, gts, reward_weighting: typing.Optional[float] = 0.1):
        if reward_weighting is not None:
            gt, gt_op = zip(*gts)
            gt, gt_op = torch.tensor(gt, device=self.device), torch.tensor(gt_op, device=self.device)
            gt = gt * (1 - reward_weighting) + gt_op * reward_weighting
        elif not isinstance(gts, torch.Tensor):
            gts = torch.tensor(gts, device=self.device)
            gt = gts
        else:
            gt = gts
        gt = (gt.clamp(1e-8).log10() + 3.).clamp(
            database.config.classification_min_log_value,
            database.config.classification_max_log_value,
        )
        #gt = mF.log_transform_with_cap(gt, -1, 1)
        return gt

    def _recent_values_process(self, recent_values, stds=None):
        target_len = database.config.rl_recent_cache_capacity
        num_classes = database.config.classification_num_classes
        if stds is None:
            stds = torch.zeros(len(recent_values), device=self.device) + database.config.classification_normal_std
        res = []
        valid_mask = []
        for recents, std in zip(recent_values, stds):
            if not recents:
                valid_mask.append(False)
                res.append(torch.ones(num_classes, device=self.device) / num_classes)
                continue
            valid_mask.append(True)
            # UCB's formula
            new_std = math.sqrt(target_len / len(recents)) * std
            recents = self._gt_process(recents, reward_weighting=None)
            recent_probs = self._gt_to_class_labels(recents, new_std)
            _res = recent_probs.mean(dim=0)
            res.append(_res)
        return torch.stack(res, dim=0), torch.tensor(valid_mask, device=self.device)

    def _gt_process_rev(self, pred : typing.Union[torch.Tensor, float]):
        #res = mF.log_transform_rev(pred, -1, 1)
        #res = 10 ** res
        res = 10 ** (pred - 3)
        return res

    def _train(
        self,
        batch_size=64,
        preserve=4,
        reward_weighting=0.1,
        use_ranking_loss=False,
        use_complementary_loss=False,
        use_self_imitation=False,
        equal_suppress=8,
        use_other_states=False,
    ):
        with timer:
            if isinstance(self.memory, PackedMemory):
                batch_detail = self.memory.sample(batch_size, preserve=preserve, detail=True)
                batch = batch_detail['samples']
                main_batch_labels = torch.tensor(batch_detail['labels'], dtype=torch.int, device=self.device)
                main_batch_mask = None if 'memory' not in batch_detail['labels_mapping'] else main_batch_labels == batch_detail['labels_mapping']['memory']
            else:
                batch = self.memory.sample(batch_size, preserve=preserve)
                main_batch_mask = None

            if isinstance(self.pair_memory, PackedMemory):
                completed_batch = self.pair_memory.sample(batch_size, preserve=0, detail=False)
            else:
                completed_batch = self.pair_memory.sample(batch_size, preserve=0, tuple_size=0)
            if database.config.transformer_cls_extractor_grad:
                _completed_batch = self._batch_embedding_update(completed_batch)
            else:
                with torch.no_grad():
                    _completed_batch = self._batch_embedding_update(completed_batch)
            if database.config.transformer_reg_extractor_grad:
                _batch = self._batch_embedding_update(batch)
            else:
                with torch.no_grad():
                    _batch = self._batch_embedding_update(batch)
            all_states = [*_batch, *_completed_batch]

            real_batch_size = len(batch)
            real_completed_batch_size = len(completed_batch)

        _time_batch_update = timer.time

        with timer:
            seqs = []
            info = []
            gts_ori = self._get_best_value(all_states)
            base_values = []
            for index, state in enumerate(all_states):
                sql_hash = self._get_plan_hash(state.sql)
                if database.config.predict_use_relative == 'best':
                    base_value = self.best_values[sql_hash]
                    base_values.append(base_value)
                elif database.config.predict_use_relative == 'base':
                    if sql_hash not in self.baseline_values:
                        raise KeyError(f'cannot find baseline value for plan {self._get_plan_hash(state, True)}')
                    base_value = self.baseline_values[sql_hash]
                    base_values.append(base_value)
                if database.config.use_lstm:
                    seq = state.get_root_embeddings().mean(dim=0)
                else:
                    seq = state.to_sequence()
                seqs.append(seq)
                info.append((state.bushy_level, state.sql.baseline.bushy_level))

            bushy_levels, baseline_bushy_levels = zip(*info)
            bushy_levels = torch.tensor(bushy_levels, dtype=torch.float, device=self.device)
            baseline_bushy_levels = torch.tensor(baseline_bushy_levels, dtype=torch.float, device=self.device)
            gt_stds = database.config.classification_normal_std + \
                    (database.config.classification_bushy_std - database.config.classification_normal_std) * \
                    (1 - 0.5 ** (bushy_levels - baseline_bushy_levels).clip(0))
            gts = self._gt_process(gts_ori, reward_weighting=reward_weighting)
            gt_cls_labels = self._gt_to_class_labels(gts, gt_stds)
            gt_op = torch.tensor(tuple(zip(*gts_ori))[1], device=self.device)

            if database.config.predict_use_relative in ('best', 'base'):
                clip_baseline_values = map(lambda x: max(1e-4, x), base_values)
                new_gts_ori = [(gt / base, gt_op / base) for (gt, gt_op), base in zip(gts_ori, clip_baseline_values)]
                gts = self._gt_process(new_gts_ori, reward_weighting=reward_weighting)
                gts = gts - 3.

            #best_values = torch.tensor(best_values, device=self.device)
            #loss_weights = (best_values / gt_op) ** database.config.rl_sample_weighting_exponent \
            #    if database.config.rl_sample_weighting_exponent != 0 else None

        _time_to_sequence = timer.time

        with timer:
            reg_seq, cls_seq = seqs[:real_batch_size], seqs[real_batch_size : real_batch_size + real_completed_batch_size]
            reg_gts = gts[:real_batch_size]
            _reg_cls_gts = gt_cls_labels[:real_batch_size]
            cls_gts = gt_cls_labels[real_batch_size : real_batch_size + real_completed_batch_size]
            _cls_reg_gts = gts[real_batch_size : real_batch_size + real_completed_batch_size]

            self.transformer_switch_mode(database.config.transformer_encoder_weight)
            if database.config.use_lstm:
                reg_embs = reg_seq if database.config.transformer_reg_extractor_grad else torch.stack(reg_seq, dim=0).detach()
                _reg_cls_pred, reg_pred = self.model_lstm.predict(reg_embs)
            else:
                reg_embs, _reg_cls_pred, reg_pred = self.model_transformer(reg_seq, input_detach=not database.config.transformer_reg_extractor_grad)
            reg_pred = reg_pred.squeeze(-1)
            _reg_cls_pred = _reg_cls_pred / database.config.classification_softmax_temperature
            _reg_cls_pred_values = self._class_labels_to_values(_reg_cls_pred)
            _reg_cls_gt_better_than_pred = reg_gts < _reg_cls_pred_values.detach()

            #self.transformer_switch_mode(1 - database.config.transformer_encoder_weight)
            self.transformer_switch_mode(1)
            if real_completed_batch_size > 0:
                if database.config.use_lstm:
                    cls_embs = cls_seq if database.config.transformer_cls_extractor_grad else torch.stack(cls_seq, dim=0).detach()
                    cls_pred, _cls_reg_pred = self.model_lstm.predict(cls_embs)
                else:
                    cls_embs, cls_pred, _cls_reg_pred = self.model_transformer(cls_seq, input_detach=not database.config.transformer_cls_extractor_grad)
                _cls_reg_pred = _cls_reg_pred.squeeze(-1)
                cls_pred = cls_pred / database.config.classification_softmax_temperature
                cls_pred_values = self._class_labels_to_values(cls_pred)
                cls_gt_better_than_pred = _cls_reg_gts < cls_pred_values.detach()

            self.transformer_switch_mode(database.config.transformer_encoder_weight)

            cls_self_imitation_loss = 0.
            if real_completed_batch_size > 0:
                classification_loss_ori = F.cross_entropy(cls_pred, cls_gts, reduction='none') + \
                                          (cls_gts * cls_gts.clamp(1e-8).log()).sum(dim=-1, keepdim=False)
                if use_self_imitation:
                    cls_self_imitation_loss = classification_loss_ori[cls_gt_better_than_pred]
                    if cls_self_imitation_loss.numel() == 0:
                        cls_self_imitation_loss = 0.
                    else:
                        cls_self_imitation_loss = cls_self_imitation_loss.mean()
            regression_loss_ori = F.mse_loss(reg_pred, reg_gts, reduction='none')
            _regression_cls_loss_ori = F.cross_entropy(_reg_cls_pred, _reg_cls_gts, reduction='none') + \
                                       (_reg_cls_gts * _reg_cls_gts.clamp(1e-8).log()).sum(dim=-1, keepdim=False)
            if database.config.rl_no_classification_loss:
                _regression_cls_loss_ori = 0 * _regression_cls_loss_ori
            if use_self_imitation:
                _reg_cls_self_imitation_loss = _regression_cls_loss_ori[_reg_cls_gt_better_than_pred]
                if _reg_cls_self_imitation_loss.numel() == 0:
                    _reg_cls_self_imitation_loss = 0.
                else:
                    _reg_cls_self_imitation_loss = _reg_cls_self_imitation_loss.mean()

        _time_predict = timer.time

        for state in all_states:
            state.clear_embeddings()

        return {
            'loss': {
                'cmp': classification_loss_ori.mean() + _regression_cls_loss_ori.mean() \
                    if real_completed_batch_size > 0 else _regression_cls_loss_ori.mean(),
                'reg': regression_loss_ori.mean(),
                '*self_imitation': _reg_cls_self_imitation_loss + cls_self_imitation_loss,
            },
            'time': {
                'batch_update': _time_batch_update,
                'to_sequence': _time_to_sequence,
                'predict': _time_predict,
            },
        }

    def _legacy_train(
        self,
        batch_size=64,
        preserve=4,
        reward_weighting=0.1,
        use_ranking_loss=False,
        use_complementary_loss=False,
        use_self_imitation=False,
        equal_suppress=8,
        use_other_states=False,
    ):
        with timer:
            if isinstance(self.memory, PackedMemory):
                batch_detail = self.memory.sample(batch_size, preserve=preserve, detail=True)
                batch = batch_detail['samples']
                main_batch_labels = torch.tensor(batch_detail['labels'], dtype=torch.int, device=self.device)
                main_batch_mask = None if 'memory' not in batch_detail['labels_mapping'] else main_batch_labels == batch_detail['labels_mapping']['memory']
            else:
                batch = self.memory.sample(batch_size, preserve=preserve)
                main_batch_mask = None
            real_batch_size = len(batch)
            if real_batch_size == 0:
                raise RuntimeError('empty memory')

            pair_batch_size = 0
            pair_batch = None
            if use_ranking_loss:
                pair_batch = self.pair_memory.sample(batch_size, preserve=0, tuple_size=2)
                pair_batch_size = len(pair_batch)

            if pair_batch_size:
                pair_1, pair_2 = zip(*pair_batch)
                batch = [*batch, *pair_1, *pair_2]
                all_states = self._batch_embedding_update(batch)
                batch, pair_batch = all_states[:real_batch_size], all_states[real_batch_size:]
            else:
                use_ranking_loss = False
                all_states = self._batch_embedding_update(batch)
                pair_batch = None
                batch = all_states[:]

        _time_batch_update = timer.time

        with timer:
            gts = []
            seqs = []
            info = []
            history_gts = []
            history_seqs = []
            history_info = []
            pair_gts = []
            pair_seqs = []
            pair_info = []

            prev_states = []
            prev_state_info = []
            if use_complementary_loss:
                for index, state in enumerate(batch):
                    if state.total_branch_nodes > 0:
                        prev_state = state.clone()
                        prev_state.revert()
                        prev_state_info.append(index)
            prev_state_gts = self._get_best_value(prev_states)
            prev_state_recents = self._get_recent_values(prev_states)
            batch_prev_states = [None for i in range(len(batch))]
            for prev_state, prev_state_gt, prev_recent, index in zip(prev_states, prev_state_gts, prev_state_recents, prev_state_info):
                gt_prev, gt_prev_op = prev_state_gt
                if gt_prev is None or gt_prev_op is None or prev_recent is None:
                    continue
                batch_prev_states[index] = (prev_state, prev_state_gt, prev_recent)

            batch_gts = self._get_best_value(batch)
            recent_values = self._get_recent_values(batch)

            for index, (state, (gt, gt_op), _prev_info, recent) in enumerate(zip(batch, batch_gts, batch_prev_states, recent_values)):
                sql_hash = self._get_plan_hash(state.sql)
                best_value = self.best_values[sql_hash]

                if _prev_info:
                    prev_state, (gt_prev, gt_prev_op, recent_prev) = _prev_info
                    if equal_suppress > 0:
                        if gt <= gt_prev and gt_op <= gt_prev_op and index % equal_suppress != 0:
                            prev_state = None
                            gt_prev, gt_prev_op = None, None
                else:
                    gt_prev, gt_prev_op, recent_prev = None, None, None
                    prev_state = None

                if database.config.use_lstm:
                    seq = state.get_root_embeddings().mean(dim=0)
                else:
                    seq = state.to_sequence()
                if prev_state is None:
                    seqs.append(seq)
                    gts.append((gt, gt_op, best_value, recent))
                    info.append((state.bushy_level, state.sql.baseline.bushy_level))
                else:
                    if database.config.use_lstm:
                        prev_seq = prev_state.get_root_embeddings().mean(dim=0)
                    else:
                        prev_seq = prev_state.to_sequence()
                    history_seqs.append((seq, prev_seq))
                    history_gts.append(((gt, gt_op, best_value, recent), (gt_prev, gt_prev_op, best_value, recent_prev)))
                    history_info.append((
                        (state.bushy_level, state.sql.baseline.bushy_level),
                        (prev_state.bushy_level, prev_state.sql.baseline.bushy_level),
                    ))

            if pair_batch:
                batch_gts = self._get_best_value(pair_batch)
                for state, (gt, gt_op) in zip(pair_batch, batch_gts):
                    sql_hash = self._get_plan_hash(state.sql)
                    best_value = self.best_values[sql_hash]
                    recent = self.recent_values[sql_hash]
                    if database.config.use_lstm:
                        seq = state.get_root_embeddings().mean(dim=0)
                    else:
                        seq = state.to_sequence()
                    pair_gts.append((gt, gt_op, best_value, recent))
                    pair_seqs.append(seq)
                    pair_info.append((state.bushy_level, state.sql.baseline.bushy_level))
        _time_to_sequence = timer.time

        with timer:
            wo_comp_size = len(seqs)
            comp_size = len(history_seqs)

            if comp_size:
                history_seqs_ori, history_seqs_prev = zip(*history_seqs)
                history_gts_ori, history_gts_prev = zip(*history_gts)
                history_info_ori, history_info_prev = zip(*history_info)
            else:
                history_seqs_ori, history_seqs_prev = (), ()
                history_gts_ori, history_gts_prev = (), ()
                history_info_ori, history_info_prev = (), ()

            all_seqs = [*seqs, *history_seqs_ori, *history_seqs_prev, *pair_seqs]
            all_gts = [*gts, *history_gts_ori, *history_gts_prev, *pair_gts]
            all_info = [*info, *history_info_ori, *history_info_prev, *pair_info]
            gt, gt_op, best_values, recent_values = zip(*all_gts)

            state_bushy_levels, state_baseline_bushy_levels = zip(*all_info)
            state_bushy_levels = torch.tensor(state_bushy_levels, dtype=torch.float, device=self.device)
            state_baseline_bushy_levels = torch.tensor(state_baseline_bushy_levels, dtype=torch.float, device=self.device)
            all_gt_stds = database.config.classification_normal_std + \
                    (database.config.classification_bushy_std - database.config.classification_normal_std) * \
                    (1 - 0.5 ** (state_bushy_levels - state_baseline_bushy_levels).clip(0))

            all_gts = self._gt_process(zip(gt, gt_op), reward_weighting=reward_weighting)
            all_recent_values, recent_values_valid_mask = self._recent_values_process(recent_values, all_gt_stds)
            _recent_values = list(map(lambda x: 0. if not x else (sum(x) / len(x)), recent_values))
            all_recent_values_reg = self._gt_process(zip(_recent_values, _recent_values), reward_weighting=reward_weighting)

            if database.config.use_lstm:
                embs = all_seqs
                all_pred, all_regression_pred = self.model_lstm.predict(all_seqs)
            else:
                embs, all_pred, all_regression_pred = self.model_transformer(all_seqs)#.view(-1)
            all_regression_pred = all_regression_pred.squeeze(-1)
            all_pred = all_pred / database.config.classification_softmax_temperature

            _best_values = torch.tensor(best_values, device=self.device)
            _gt_op = torch.tensor(gt_op, device=self.device)
            mse_loss_weights = (_best_values / _gt_op) ** database.config.rl_sample_weighting_exponent \
                if database.config.rl_sample_weighting_exponent != 0 else None

            all_pred_values = self._class_labels_to_values(all_pred)

            if use_other_states:
                main_res = all_pred
                main_regression_res = all_regression_pred
                main_values = all_pred_values
                main_gts = all_gts
                main_recent_gts = all_recent_values_reg
                main_recents = all_recent_values
                main_recents_valid_mask = recent_values_valid_mask
                main_weights = mse_loss_weights if mse_loss_weights is not None else None
                main_gt_stds = all_gt_stds
            else:
                main_res = all_pred[:wo_comp_size + comp_size]
                main_regression_res = all_regression_pred[:wo_comp_size + comp_size]
                main_values = all_pred_values[:wo_comp_size + comp_size]
                main_gts = all_gts[:wo_comp_size + comp_size]
                main_recent_gts = all_recent_values_reg[:wo_comp_size + comp_size]
                main_recents = all_recent_values[:wo_comp_size + comp_size]
                main_recents_valid_mask = recent_values_valid_mask[:wo_comp_size + comp_size]
                main_weights = mse_loss_weights[:wo_comp_size + comp_size] if mse_loss_weights is not None else None
                main_gt_stds = all_gt_stds[:wo_comp_size + comp_size]

            #main_loss_ori = F.mse_loss(main_res, main_gts, reduction='none')
            if database.config.rl_classification_loss_use_recent:
                _main_gts = main_recents
            else:
                _main_gts = self._gt_to_class_labels(main_gts, main_gt_stds)
            # using the KL divergence, which is subtracted by a constant, instead of bare cross entropy,
            #  to show the difference between the two probability distributions
            main_loss_ori = F.cross_entropy(main_res, _main_gts, reduction='none') + (_main_gts * _main_gts.clamp(1e-8).log()).sum(dim=-1, keepdim=False)
            if database.config.rl_classification_loss_use_recent:
                main_loss_ori = main_loss_ori[main_recents_valid_mask]
                if main_loss_ori.numel() == 0:
                    main_loss_ori = 0.
            if database.config.rl_regression_loss_use_recent:
                main_regression_loss_ori = F.mse_loss(main_regression_res, main_recent_gts, reduction='none')
            else:
                main_regression_loss_ori = F.mse_loss(main_regression_res, main_gts, reduction='none')
            if main_batch_mask is not None:
                # suppress outlier values from offline samples
                if self.epoch >= database.config.rl_offline_samples_suppress_start_epoch and \
                        database.config.rl_offline_samples_suppress_outliers_quantile is not None:
                    if isinstance(main_loss_ori, torch.Tensor):
                        if database.config.rl_classification_loss_use_recent:
                            main_batch_mask_cls = main_batch_mask[main_recents_valid_mask]
                        else:
                            main_batch_mask_cls = main_batch_mask
                        main_batch_quantile = main_loss_ori[main_batch_mask_cls].quantile(database.config.rl_offline_samples_suppress_outliers_quantile)
                        _main_loss_ori = main_loss_ori # for debug
                        main_loss_ori = _main_loss_ori * ~((_main_loss_ori > main_batch_quantile) & ~main_batch_mask_cls)
                    main_regression_batch_quantile = main_regression_loss_ori[main_batch_mask].quantile(database.config.rl_offline_samples_suppress_outliers_quantile)
                    _main_regression_loss_ori = main_regression_loss_ori
                    main_regression_loss_ori = _main_regression_loss_ori * ~((_main_regression_loss_ori > main_regression_batch_quantile) & ~main_batch_mask)

            if use_self_imitation and isinstance(main_loss_ori, torch.Tensor):
                gt_better_than_pred = main_gts < main_values.detach()
                if database.config.rl_classification_loss_use_recent:
                    gt_better_than_pred = gt_better_than_pred[main_recents_valid_mask]
                self_imitation_loss_ori = main_loss_ori[gt_better_than_pred]
                if self_imitation_loss_ori.numel() == 0:
                    self_imitation_loss = 0.
                else:
                    self_imitation_loss = self_imitation_loss_ori.mean()
            else:
                self_imitation_loss = 0.

            if main_weights is not None:
                main_weights = main_weights * main_weights.shape[0] / main_weights.sum()
                if database.config.rl_classification_loss_use_recent:
                    main_weights = main_weights[main_recents_valid_mask]
            else:
                main_weights = 1.
            if isinstance(main_loss_ori, torch.Tensor):
                main_loss_ori = main_loss_ori * main_weights
                main_loss = main_loss_ori.mean()
            else:
                main_loss = 0.
            main_regression_loss_ori = main_regression_loss_ori * main_weights
            main_regression_loss = main_regression_loss_ori.mean()

            if database.config.classification_use_kl_ranking_loss:
                if use_ranking_loss and pair_batch_size > 0:
                    # [2N, num_classes]
                    pair_res = all_pred[wo_comp_size + comp_size * 2:]

                    # [2N]
                    pair_gts = all_gts[wo_comp_size + comp_size * 2:]
                    pair_preds = all_pred_values[wo_comp_size + comp_size * 2:]

                    assert pair_res.shape[0] == 2 * pair_batch_size
                    pair_res_1, pair_res_2 = pair_res[:pair_batch_size], pair_res[pair_batch_size:]

                    pair_pred_1, pair_pred_2 = pair_preds[:pair_batch_size].detach(), pair_preds[pair_batch_size:].detach()
                    pair_gts_1, pair_gts_2 = pair_gts[:pair_batch_size], pair_gts[pair_batch_size:]
                    pair_wrong_mask = (pair_gts_1 < pair_gts_2) ^ (pair_pred_1 < pair_pred_2)
                    # [2N]
                    pair_wrong_mask = torch.cat([pair_wrong_mask, pair_wrong_mask], dim=0).to(torch.float)
                    pair_res_rev = torch.cat([pair_res_2, pair_res_1], dim=0).detach()
                    pair_res_rev_softmax = pair_res_rev.softmax(dim=-1)

                    # use probs of the other plan as the ground truth when the prediction is wrong
                    ranking_loss_ori = F.cross_entropy(pair_res, pair_res_rev_softmax, reduction='none') \
                        - F.cross_entropy(pair_res_rev, pair_res_rev_softmax, reduction='none')
                    ranking_loss_ori = ranking_loss_ori * pair_wrong_mask
                    ranking_loss = ranking_loss_ori.mean()
                else:
                    ranking_loss = 0.

                if use_complementary_loss and comp_size > 0:
                    comp_res = all_pred[wo_comp_size: wo_comp_size + comp_size * 2]
                    comp_res_ori, comp_res_prev = comp_res[:comp_size], all_pred[comp_size:]

                    comp_pred_ori, comp_pred_prev = all_pred_values[wo_comp_size: wo_comp_size + comp_size], all_pred_values[wo_comp_size + comp_size: wo_comp_size + comp_size * 2]
                    comp_wrong_mask = comp_pred_ori < comp_pred_prev

                    comp_wrong_mask = torch.cat([comp_wrong_mask, comp_wrong_mask], dim=0).to(torch.float)
                    comp_res_rev = torch.cat([comp_res_prev, comp_res_ori], dim=0).detach()
                    comp_res_rev_softmax = comp_res_rev.softmax(dim=-1)

                    complementary_loss_ori = F.cross_entropy(comp_res, comp_res_rev_softmax, reduction='none') - \
                        F.cross_entropy(comp_res_rev, comp_res_rev_softmax, reduction='none')
                    complementary_loss_ori = complementary_loss_ori * comp_wrong_mask
                    complementary_loss = complementary_loss_ori.mean()
                else:
                    complementary_loss = 0.
            else:
                if use_ranking_loss and pair_batch_size > 0:
                    pair_res = all_regression_pred[wo_comp_size + comp_size * 2:]
                    pair_gts = all_gts[wo_comp_size + comp_size * 2:]

                    assert pair_res.shape[0] == 2 * pair_batch_size
                    pair_res_1, pair_res_2 = pair_res[:pair_batch_size], pair_res[pair_batch_size:]
                    pair_gts_1, pair_gts_2 = pair_gts[:pair_batch_size], pair_gts[pair_batch_size:]

                    pair_cmp_gts = (pair_gts_1 < pair_gts_2).to(torch.float) - (pair_gts_1 > pair_gts_2).to(torch.float)
                    ranking_loss_ori = ((pair_res_1 - pair_res_2) * pair_cmp_gts).clamp(0)
                    ranking_loss = ranking_loss_ori.mean()
                else:
                    ranking_loss = 0.

                if use_complementary_loss and comp_size > 0:
                    comp_res_ori, comp_res_prev = all_regression_pred[wo_comp_size : wo_comp_size + comp_size], all_regression_pred[wo_comp_size + comp_size : wo_comp_size + comp_size * 2]
                    complementary_loss_ori = (comp_res_prev - comp_res_ori).clamp(0)
                    complementary_loss = complementary_loss_ori.mean()
                else:
                    complementary_loss = 0.
        _time_predict = timer.time

        for state in all_states:
            state.clear_embeddings()

        return {
            'loss': {
                'cmp': main_loss,
                'reg': main_regression_loss,
                '*ranking': ranking_loss,
                '*complementary': complementary_loss,
                '*self_imitation': self_imitation_loss,
            },
            'time': {
                'batch_update': _time_batch_update,
                'to_sequence': _time_to_sequence,
                'predict': _time_predict,
            },
        }

    @property
    def loss_weights(self):
        return {
            'cmp': database.config.rl_classification_loss_weight,
            'reg': 0. if database.config.rl_search_use_classification else
                   database.config.rl_regression_loss_weight,
            '*ranking': database.config.rl_ranking_loss_weight,
            '*complementary': database.config.rl_complementary_loss_weight,
            '*self_imitation': database.config.rl_self_imitation_weight,
        }

    def set_regularization(self, info):
        if isinstance(info, dict):
            info = (info, )
        self._regularization_info = info

    def _parameter_regularization(self):
        if not self._regularization_info:
            return
        initial_lr = database.config.learning_rate
        current_lr = self.optim.param_groups[0]['lr']
        lr_weight = current_lr / initial_lr

        def param_regularization(param):
            data = param.data
            delta_data = 0.
            for info in self._regularization_info:
                weight = info['weight'] * lr_weight
                norm_type = info['norm']
                if norm_type == 1:
                    delta_data += weight * data.sgn()
                elif norm_type != 2:
                    delta_data += weight * data.sgn() * data.abs().pow(database.config.regularization_norm_type - 1)
            param.data -= delta_data

        if database.config.regularization_use_on_bias:
            for param_group in self.optim.param_groups:
                for param in param_group['params']:
                    if not param.requires_grad:
                        continue
                    param_regularization(param)
        else:
            for model in self._all_modules:
                model = getattr(self, model, None)
                if model is None:
                    continue
                for name, param in model.named_parameters():
                    if not param.requires_grad:
                        continue
                    if 'bias' in name:
                        continue
                    param_regularization(param)

    def train(self, iterations=1, epoch=None, separate_backward=True, sample_preserve=None):
        if iterations < 1:
            iterations = 1

        batch_size = database.config.batch_size
        if sample_preserve is None:
            if epoch is not None and epoch >= database.config.priority_memory_start_epoch:
                sample_preserve = round(batch_size * database.config.priority_memory_ratio)
            else:
                sample_preserve = 0
        loss_weights = self.loss_weights
        clip_ratio = database.config.rl_grad_clip_ratio

        _time_backward = 0.
        results = []
        for i in range(iterations):
            with timer:
                training_res = self._train(
                    batch_size,
                    sample_preserve,
                    reward_weighting=database.config.rl_reward_weighting,
                    use_ranking_loss=database.config.rl_use_ranking_loss and epoch >= database.config.rl_ranking_loss_start_epoch,
                    use_complementary_loss=database.config.rl_use_complementary_loss,
                    use_self_imitation=database.config.rl_use_self_imitation,
                    use_other_states=database.config.rl_use_other_states,
                    equal_suppress=database.config.rl_complementary_loss_equal_suppress,
                )
                results.append(training_res)

                if separate_backward:
                    self.optim.zero_grad()
                    total_loss = 0.
                    for k, v in training_res['loss'].items():
                        weight = loss_weights.get(k, 0.)
                        total_loss = total_loss + v * weight
                    if isinstance(total_loss, torch.Tensor):
                        total_loss.backward()
                        if database.config.rl_use_grad_clip:
                            for param_group in self.optim.param_groups:
                                lr = param_group['lr']
                                params = param_group['params']
                                torch.nn.utils.clip_grad_norm_(params, max_norm=lr * clip_ratio, norm_type=float('inf'))
                        self.optim.step()
                        self._parameter_regularization()
            _time_backward += timer.time

        results = sum_batch(results)
        if not separate_backward:
            self.optim.zero_grad()
            total_loss = 0.
            for k, v in results['loss'].items():
                weight = loss_weights.get(k, 0.)
                total_loss = total_loss + v * weight
            if isinstance(total_loss, torch.Tensor):
                total_loss.backward()
                for param_group in self.optim.param_groups:
                    lr = param_group['lr']
                    params = param_group['params']
                    torch.nn.utils.clip_grad_norm_(params, max_norm=lr * clip_ratio, norm_type=float('inf'))
                self.optim.step()
                self._parameter_regularization()

        self.explorer.step()

        return dict_map(lambda x: x.item() if isinstance(x, torch.Tensor) and x.numel() == 1 else x, results)
