import sys
import math
import re

from tqdm import tqdm
import torch
import dgl

from lib.torch import torch_summary, safe_save
from sql.database import Postgres, Schema, postgres_type
from sql import sql_parser
from sql.sql_parser import parse_select, PlanParser

from .config import Config

database = Postgres(
    retry_limit=3,
    auto_save_interval=400,
)

class GLOSchema(Schema):
    COLUMN_FEATURE_SIZE = 13
    TABLE_CLUSTERS = 6
    TABLE_DENSE_EMBEDDING_SIZE = 9

    def __init__(self, database : Postgres, cache_file = None):
        if cache_file is None:
            cache_file = f'schema_cache/{database.dbname}.schema.pkl'
        if safe_save.file_exists(cache_file):
            super().__init__(None)
            state_dict = safe_save.load_pickle(cache_file)
            self.load_state_dict(state_dict)
        else:
            super().__init__(database)

            table_cluster_file = f'data_driven/table_autoencoder.pkl'
            if safe_save.file_exists(table_cluster_file):
                state_dict = safe_save.load_torch(table_cluster_file, map_location='cpu')

                self.table_clusters = state_dict['cluster']
                table_dense_embeddings = state_dict['embeddings']
                self.table_dense_embeddings = {k : (v.detach().numpy() if isinstance(v, torch.Tensor) else v)
                                               for k, v in table_dense_embeddings.items()}
            else:
                self.table_clusters = {}
                self.table_dense_embeddings = {}

            print('Calculating column features', file=sys.stderr)

            self._column_features = []
            self.column_features_size = 0

            for index, tup in tqdm(enumerate(self.columns), total=len(self.columns)):
                sname, tname, cname = tup
                table_obj = self.name_to_table[tname]

                column_type = postgres_type(table_obj.column_types[cname])
                column_type_onehot = [0 for i in range(3)]
                column_type_onehot[column_type] = 1

                pg_stats_query = f'select null_frac, n_distinct from pg_stats ' \
                                 f'where schemaname = \'{"public" if sname is None else sname}\' ' \
                                 f'and tablename = \'{tname}\' ' \
                                 f'and attname = \'{cname}\';'
                res = database.execute(pg_stats_query)
                if not res:
                    # not enough data
                    null_frac = 0.0
                    n_distinct = -1.0
                else:
                    null_frac, n_distinct = res[0]
                table_row_count = table_obj.row_count

                is_increasing = n_distinct < 0
                if is_increasing:
                    real_n_distinct = -n_distinct
                else:
                    real_n_distinct = n_distinct / table_row_count

                if real_n_distinct < 0.001:
                    # type-like column
                    row_type = 0
                elif real_n_distinct < 0.999:
                    # common type
                    row_type = 1
                else:
                    row_type = 2

                n_distinct_onehot = [*(0 for i in range(3)), 1 if is_increasing else 0, 0 if is_increasing else 1]
                n_distinct_onehot[row_type] = 1

                column_indexes = self.column_db_indexes[tup]
                column_index_onehot = [1 if column_indexes else 0, 0 if column_indexes else 1]

                null_frac_onehot = [1 if null_frac == 0 else 0, 1 if 0 < null_frac < 0.5 else 0, 1 if null_frac >= 0.5 else 0]

                self._column_features.append([
                    *column_type_onehot, # 3
                    *n_distinct_onehot, # 5
                    *null_frac_onehot, # 3
                    *column_index_onehot, # 2
                ])
            self.column_features_size = self.total_columns + 2

            safe_save.save_pickle(self.state_dict(), cache_file)

    def state_dict(self):
        res = super().state_dict()
        for name in (
            'table_clusters', 'table_dense_embeddings', '_column_features', 'column_features_size',
        ):
            res[name] = getattr(self, name)
        return res

    def load_state_dict(self, state_dict):
        for name in (
            'table_clusters', 'table_dense_embeddings', '_column_features', 'column_features_size',
        ):
            setattr(self, name, state_dict[name])
        return super().load_state_dict(state_dict)

    def column_features(self, table_name, column_name, schema_name='public', *,
                        dtype=torch.float, device=torch.device('cpu')):
        column_index = self.column_index(table_name, column_name, schema_name)
        if dtype is not None:
            return torch.tensor(self._column_features[column_index], dtype=dtype, device=device)
        return list(self._column_features[column_index])

def _database_schema_init(database : Postgres):
    database.schema = GLOSchema(database, cache_file=None)
    database.config = Config()
    database.set_settings('max_parallel_workers', 1)
    database.set_settings('max_parallel_workers_per_gather', 1)

database.add_hook('after_setup', 'GLO_schema_hook', _database_schema_init)


class Sql(sql_parser.SqlBase):
    def __init__(self, statement, filename=None, device=torch.device('cpu')):
        self.statement = statement
        self.filename = filename

        parser_env = sql_parser.ParserEnvironment()
        parser_env.table_columns = database.schema.table_columns
        super().__init__(parse_select(statement, parser_env))

        self.__device = device
        self.parse()
        self.to(device)

    def to(self, device):
        self.__device = device
        self.table_features = torch_summary.dict_map(lambda x: x.to(device) if isinstance(x, torch.Tensor) else x,
                                                     self.table_features)
        self.column_features = torch_summary.dict_map(lambda x: x.to(device) if isinstance(x, torch.Tensor) else x,
                                                      self.column_features)
        self.edge_features = torch_summary.dict_map(lambda x: x.to(device) if isinstance(x, torch.Tensor) else x,
                                                    self.edge_features)
        self.graph = self.graph.to(device) if self.graph else self.graph
        self.homo_graph = self.homo_graph.to(device) if self.homo_graph else self.homo_graph
        return self

    @property
    def device(self):
        return self.__device

    def parse(self):
        self.table_features = {}
        self.column_features = {}
        self.edge_features = {}

        self.parse_features()
        self.graph, self.graph_node_indices = self._to_graph()
        self.homo_graph, self.homo_graph_node_indices = self._to_homo_graph()

        self.baseline = PlanParser(database.plan(self.statement, geqo=False)[0][0][0]['Plan'])

    def get_table(self, alias):
        table_name = self.alias_to_table[alias].fullname
        table_index, table = database.schema.table(table_name)
        return table_index, table_name, table

    def table_selectivity_features(self, alias, explain=True):
        if not hasattr(self, '_table_selectivity_features'):
            self._table_selectivity_features = {}
        if (alias, explain) in self._table_selectivity_features:
            return self._table_selectivity_features[alias, explain]

        table_filters = self.table_filter_predicates.get(alias, {})
        table_filters_list = []
        for column, filters in table_filters.items():
            table_filters_list.extend(filters)

        _, _, table = self.get_table(alias)

        total_rows = table.row_count

        if table_filters_list:
            str_conditions = ' and '.join(map(str, table_filters_list))

            sql = f'explain select * from {table.name} {alias} ' \
                  f'where {str_conditions}'
            res = tuple(database.execute(sql, True))
            res = res[0][0]
            select_rows = int(re.search(r'rows=([0-9]+)', res).group(1))
            cost = float(re.search(r'cost=[0-9]+(?:\.[0-9]+)?\.\.([0-9]+(?:\.[0-9]+)?)', res).group(1))
            width = int(re.search(r'width=([0-9]+)', res).group(1))
            if not explain:
                sql = f'select count(*) from {table.name} {alias} ' \
                      f'where {str_conditions}'
                res = tuple(database.execute(sql))
                select_rows = res[0][0]
        else:
            select_rows = total_rows
            sql = f'explain select * from {table.name} {alias} '
            res = tuple(database.execute(sql, True))
            res = res[0][0]
            cost = float(re.search(r'cost=[0-9]+(?:\.[0-9]+)?\.\.([0-9]+(?:\.[0-9]+)?)', res).group(1))
            width = int(re.search(r'width=([0-9]+)', res).group(1))

        sel = select_rows / total_rows

        res = {
            'selectivity': sel,
            'selected_rows': select_rows,
            'total_rows': total_rows,
            'cost': cost,
            'width': width,
        }
        self._table_selectivity_features[alias, explain] = res
        return res

    def table_join_selectivity_features(self, left_alias, right_alias, explain=True):
        if not hasattr(self, '_table_join_selectivity_features'):
            self._table_join_selectivity_features = {}
        if (left_alias, right_alias, explain) in self._table_join_selectivity_features:
            return self._table_join_selectivity_features[left_alias, right_alias, explain]

        left_filters = self.table_filter_predicates.get(left_alias, {})
        right_filters = self.table_filter_predicates.get(right_alias, {})
        table_predicates_list = []
        for column, filters in left_filters.items():
            table_predicates_list.extend(filters)
        for column, filters in right_filters.items():
            table_predicates_list.extend(filters)

        for p_right_alias, join_predicate in self.table_eqjoin_predicates.get(left_alias, []) + \
                                             self.table_neqjoin_predicates.get(left_alias, []):
            if p_right_alias == right_alias:
                table_predicates_list.append(join_predicate)

        _, _, left_table = self.get_table(left_alias)
        _, _, right_table = self.get_table(right_alias)

        left_total_rows = left_table.row_count
        right_total_rows = right_table.row_count

        if table_predicates_list:
            str_conditions = ' and '.join(map(str, table_predicates_list))

            sql = f'explain select * from {left_table.name} {left_alias}, {right_table.name} {right_alias} ' \
                  f'where {str_conditions}'
            res = tuple(database.execute(sql, True))
            res = res[0][0]
            select_rows = int(re.search(r'rows=([0-9]+)', res).group(1))
            cost = float(re.search(r'cost=[0-9]+(?:\.[0-9]+)?\.\.([0-9]+(?:\.[0-9]+)?)', res).group(1))
            width = int(re.search(r'width=([0-9]+)', res).group(1))
            if not explain:
                sql = f'select count(*) from {left_table.name} {left_alias}, {right_table.name} {right_alias} ' \
                      f'where {str_conditions}'
                res = tuple(database.execute(sql))
                select_rows = res[0][0]
        else:
            select_rows = left_total_rows * right_total_rows
            sql = f'explain select * from {left_table.name} {left_alias}, {right_table.name} {right_alias} '
            res = tuple(database.execute(sql, True))
            res = res[0][0]
            cost = float(re.search(r'cost=[0-9]+(?:\.[0-9]+)?\.\.([0-9]+(?:\.[0-9]+)?)', res).group(1))
            width = int(re.search(r'width=([0-9]+)', res).group(1))

        left_filter_sel = self.table_selectivity_features(left_alias, explain)
        right_filter_sel = self.table_selectivity_features(right_alias, explain)
        cartesian_rows = left_filter_sel['selected_rows'] * right_filter_sel['selected_rows']
        join_sel = select_rows / cartesian_rows

        res = {
            'selectivity': join_sel,
            'selected_rows': select_rows,
            'total_rows': cartesian_rows,
            'cost': cost,
            'width': width,
        }
        self._table_join_selectivity_features[left_alias, right_alias, explain] = res
        return res

    def check_match_indexes(self, single_alias : str, group_aliases, target_size=4):
        """
        Check the indexes' match columns of a join between a single table and a group of tables.
        Returns a one-hot tuple that represents the best match order of indexes.
        """
        group_aliases = sorted(group_aliases)
        if not hasattr(self, '_check_match_indexes'):
            self._check_match_indexes = {}
        cache_key = (single_alias, tuple(group_aliases), target_size)
        cache = self._check_match_indexes.get(cache_key, None)
        if cache is not None:
            return cache

        predicates = self.table_eqjoin_predicates.get(single_alias, ())
        target_columns = set()
        for other_alias, predicate in predicates:
            if other_alias not in group_aliases:
                pass
            left_column, right_column = predicate.lexpr, predicate.rexpr
            assert isinstance(left_column, sql_parser.ColumnRef) and isinstance(right_column, sql_parser.ColumnRef)
            if left_column.alias != single_alias:
                left_column, right_column = right_column, left_column
            this_column = left_column.column_name
            target_columns.add(this_column)
        _, table_name, single_table = self.get_table(single_alias)
        table_indexes = database.schema.table_db_indexes[table_name]

        column_match_onehots = [tuple(0 for i in range(target_size))]
        for index_name, columns in table_indexes.items():
            _column_match_onehots = [0 for i in range(target_size)]
            for index, column in enumerate(columns[:target_size]):
                if column in target_columns:
                    _column_match_onehots[index] = 1
            _column_match_onehots = tuple(_column_match_onehots)
            column_match_onehots.append(_column_match_onehots)
        res = sorted(column_match_onehots, reverse=True)[0]

        self._check_match_indexes[cache_key] = res
        return res

    def parse_features(self):
        table_global_extra_features = {}
        total_sel_rows = 0
        for alias in self.aliases:
            dic = self.table_selectivity_features(alias, explain=True)
            total_sel_rows += dic['selected_rows']
            table_global_extra_features[alias] = dic

        # this feature is used in plan featurization
        self.table_costs = {}

        for alias in self.aliases:
            dic = table_global_extra_features[alias]
            sel = dic['selectivity']
            rows = dic['selected_rows']
            cost = dic['cost']
            width = dic['width']
            self.table_costs[alias] = (cost, rows, width)
            log_sel = -math.log(max(sel, 1e-9))
            log_relative_rows = -math.log(max(rows / total_sel_rows, 1e-9))
            table_global_extra_features[alias] = (log_sel, log_relative_rows)

        self.table_features = {}
        self.column_features = {}
        for alias in self.aliases:
            table_index, table_name, table = self.get_table(alias)

            table_out_degree = len(database.schema.foreign_keys.get(table.name, ()))
            table_in_degree = len(database.schema.foreign_keys_from.get(table.name, ()))
            table_row_count = math.log10(table.row_count + 1)
            table_column_count = len(table.columns)

            _table_costs = self.table_costs[alias]
            _table_global_extra_features = table_global_extra_features[alias]

            cluster_id = database.schema.table_clusters.get(table.name, -1)
            cluster_onehot = [0 for i in range(GLOSchema.TABLE_CLUSTERS + 1)]
            cluster_onehot[cluster_id] = 1
            table_id = database.schema.name_to_indexes[table.name]

            dense_embedding = database.schema.table_dense_embeddings.get(table.name, None)
            if dense_embedding is None:
                dense_embedding = torch.zeros(GLOSchema.TABLE_DENSE_EMBEDDING_SIZE, device=self.device)
            else:
                dense_embedding = torch.tensor(dense_embedding, device=self.device)

            for index, column_name in table.columns.items():
                features = database.schema.column_features(table.name, column_name, dtype=None)

                table_column = f'{alias}.{column_name}'
                # is_joined, sel, 1-sel
                #column_features = [0., 0., 0.]
                column_feature = {
                    'statistic': features,
                    'predicate_join': {
                        'value': 0.,
                        'mask': 0.,
                    },
                    'predicate_filter': {
                        'value': 0.,
                        'mask': 0.,
                    },
                    'related': False,
                }
                self.column_features[table_column] = column_feature

            table_cost = math.log10(max(_table_costs[0], 1))
            table_selected_rows = math.log10(max(_table_costs[1], 1))
            table_feature = {
                'features': {
                    'table_out_degree': table_out_degree,
                    'table_in_degree': table_in_degree,
                    'table_row_count': table_row_count,
                    'table_column_count': table_column_count,
                    'table_cost': table_cost,
                    'table_selected_rows': table_selected_rows,
                    'table_sqrt_selected_rows': math.sqrt(table_selected_rows),
                    'table_square_selected_rows': math.pow(table_selected_rows, 2),
                    'table_width': math.log10(max(_table_costs[2], 1)),
                    'table_log_selectivity': _table_global_extra_features[0],
                    'table_log_relative_rows': _table_global_extra_features[1],
                },
                'onehot': cluster_onehot,
                'embedding': dense_embedding,
                'cluster_id': cluster_id,
                'table_id': table_id,
            }
            self.table_features[alias] = table_feature

        # join predicates
        self.join_candidates = set()
        for join_predicate in self.eqjoin_predicates + self.neqjoin_predicates:
            left_concerned, right_concerned = list(sql_parser.concerned_columns(join_predicate.lexpr))[0], list(sql_parser.concerned_columns(join_predicate.rexpr))[0]
            left_alias, left_column = left_concerned
            right_alias, right_column = right_concerned

            self.join_candidates.add(tuple(sorted((left_alias, right_alias))))

            left_is_table = isinstance(self.alias_to_table[left_alias], sql_parser.FromTable)
            right_is_table = isinstance(self.alias_to_table[right_alias], sql_parser.FromTable)

            if left_is_table and right_is_table:
                left_table_column = f'{left_alias}.{left_column}'
                right_table_column = f'{right_alias}.{right_column}'

                column_features = self.column_features[left_table_column]
                column_features['predicate_join']['value'] = 1.
                column_features['predicate_join']['mask'] = 1.
                column_features['related'] = True

                column_features = self.column_features[right_table_column]
                column_features['predicate_join']['value'] = 1.
                column_features['predicate_join']['mask'] = 1.
                column_features['related'] = True

        # filters
        for alias, filters in self.table_filter_predicates.items():
            is_table = isinstance(self.alias_to_table[alias], sql_parser.FromTable)
            if is_table:
                table_index, table_name, table = self.get_table(alias)
                for column, column_filters in filters.items():
                    table_column = f'{alias}.{column}'
                    column_features = self.column_features[table_column]
                    all_filters_str = ' and '.join(map(lambda x: '(' + str(x) + ')', column_filters))
                    selectivity, row_count, total_row_count = database.selectivity(f'{table_name} {alias}', all_filters_str, explain=True, detail=True)
                    _log_selectivity = -math.log(max(selectivity, 1e-9))
                    column_features['predicate_filter']['value'] = max(column_features['predicate_filter']['value'], _log_selectivity)
                    column_features['predicate_filter']['mask'] = 1.
                    column_features['related'] = True

        self.edge_features = {}
        for _left_alias, _right_alias in self.join_candidates:
            for left_alias, right_alias in ((_left_alias, _right_alias), (_right_alias, _left_alias)):
                join_selectivity = self.table_join_selectivity_features(left_alias, right_alias)
                selected_rows = math.log10(max(join_selectivity['selected_rows'], 1))
                edge_features = {
                    'selected_rows': selected_rows,
                    'sqrt_selected_rows': math.sqrt(selected_rows),
                    'square_selected_rows': math.pow(selected_rows, 2),
                    'selectivity': -math.log10(max(join_selectivity['selectivity'], 1e-9)),
                    'cost': math.log10(max(join_selectivity['cost'], 1)),
                    'width': math.log10(max(join_selectivity['width'], 1)),
                }
                self.edge_features[left_alias, right_alias] = edge_features

        self.table_features = torch_summary.torch_convert(self.table_features, convert_scalar=False, device=self.device)
        self.column_features = torch_summary.torch_convert(self.column_features, convert_scalar=False, device=self.device)
        self.edge_features = torch_summary.torch_convert(self.edge_features, convert_scalar=False, device=self.device)

    def _to_graph(self):
        node_indices = {}
        table_nodes_temp = set()
        table_to_table_temp = []

        for left_alias, right_alias in self.join_candidates:
            table_nodes_temp.add(left_alias)
            table_nodes_temp.add(right_alias)
            table_to_table_temp.append((left_alias, right_alias))
            table_to_table_temp.append((right_alias, left_alias))

        table_features = {}
        column_features = {}
        column_index = 0

        filter_features = []
        join_features = []

        edge_dict = {
            ('table', 'to', 'table'): [],
            ('column', 'column_to_table', 'table'): [],
            ('table', 'table_to_column', 'column'): [],
            ('filter', 'filter_to_column', 'column'): [],
            ('column', 'column_to_filter', 'filter'): [],
            ('join', 'join_to_column', 'column'): [],
            ('column', 'column_to_join', 'join'): [],
        }

        for index, alias in enumerate(table_nodes_temp):
            node_indices['~' + alias] = index
            table_index, table_name, table = self.get_table(alias)
            for column in table.columns.values():
                table_column = f'{alias}.{column}'
                _column_features = self.column_features[table_column]
                related = _column_features['related']
                # ignore non-related columns
                if not related:
                    continue
                node_indices[table_column] = column_index

                edge_dict['column', 'column_to_table', 'table'].append((column_index, index))
                edge_dict['table', 'table_to_column', 'column'].append((index, column_index))

                _column_features : dict = _column_features.copy()
                _column_features.pop('related')
                if _column_features['predicate_filter']['mask'] != 0:
                    filter_index = len(filter_features)
                    edge_dict['filter', 'filter_to_column', 'column'].append((filter_index, column_index))
                    edge_dict['column', 'column_to_filter', 'filter'].append((column_index, filter_index))
                    filter_features.append(_column_features['predicate_filter']['value'])

                if _column_features['predicate_join']['mask'] != 0:
                    join_index = len(join_features)
                    edge_dict['join', 'join_to_column', 'column'].append((join_index, column_index))
                    edge_dict['column', 'column_to_join', 'join'].append((column_index, join_index))
                    join_features.append(_column_features['predicate_join']['value'])

                _column_features = torch_summary.torch_flat(_column_features, convert_scalar=True, device=self.device)

                for k, v in _column_features.items():
                    if not isinstance(v, torch.Tensor):
                        print(f'Warning: \'{k}\' is not a tensor: \'{v}\'', file=sys.stderr)
                        continue
                    _column_feature_item = column_features.setdefault(k, [])
                    _column_feature_item.append(v)
                column_index += 1

            _table_features = self.table_features[alias]
            _table_features = torch_summary.torch_flat(_table_features, convert_scalar=True, device=self.device)
            for k, v in _table_features.items():
                if not isinstance(v, torch.Tensor):
                    print(f'Warning: \'{k}\' is not a tensor: \'{v}\'', file=sys.stderr)
                    continue
                _table_feature_item = table_features.setdefault(k, [])
                _table_feature_item.append(v)

        edge_features = {}
        for left_alias, right_alias in table_to_table_temp:
            edge_dict['table', 'to', 'table'].append([node_indices['~' + left_alias], node_indices['~' + right_alias]])
            _edge_features = self.edge_features[left_alias, right_alias]
            _edge_features = torch_summary.torch_flat(_edge_features, convert_scalar=True, device=self.device)
            for k, v in _edge_features.items():
                if not isinstance(v, torch.Tensor):
                    print(f'Warning: \'{k}\' is not a tensor: \'{v}\'', file=sys.stderr)
                    continue
                _edge_feature_item = edge_features.setdefault(k, [])
                _edge_feature_item.append(v)

        for edge_name, edge_list in edge_dict.items():
            if len(edge_list) == 0:
                tensor_edge = torch.zeros(0, 2, device=self.device, dtype=torch.long)
            else:
                tensor_edge = torch.tensor(edge_list, device=self.device, dtype=torch.long)
            edge_dict[edge_name] = tuple(tensor_edge.t())

        g = dgl.heterograph(edge_dict, device=self.device)
        for feature_type, feature_list in table_features.items():
            feature_list = torch.stack(feature_list, dim=0).to(self.device, dtype=torch.float32)
            g.nodes['table'].data[feature_type] = feature_list
        for feature_type, feature_list in column_features.items():
            feature_list = torch.stack(feature_list, dim=0).to(self.device, dtype=torch.float32)
            g.nodes['column'].data[feature_type] = feature_list
        for feature_type, feature_list in edge_features.items():
            feature_list = torch.stack(feature_list, dim=0).to(self.device, dtype=torch.float32)
            g.edges['to'].data[feature_type] = feature_list
        g.nodes['filter'].data['features'] = torch.tensor(filter_features, device=self.device)
        g.nodes['join'].data['features'] = torch.tensor(join_features, device=self.device)

        return g, node_indices

    def _to_homo_graph(self):
        _table_features = (
            'table_row_count',
            'table_selected_rows',
            'table_sqrt_selected_rows',
            'table_square_selected_rows',
            'table_log_selectivity',
            #'table_log_relative_rows',
            'table_out_degree', 'table_in_degree',
            'table_column_count',
            # 'table_cost', 'table_selected_rows', 'table_width',
        )
        _table_other_features = (
            'onehot', 'embedding', 'cluster_id', 'table_id',
        )
        _predicate_features = (
            'predicate_filter', 'predicate_join',
        )
        _edge_features = (
            'selected_rows',
            'sqrt_selected_rows',
            'square_selected_rows',
            'selectivity',
            'cost',
            # 'width',
        )

        if not hasattr(self, 'graph') or not hasattr(self, 'graph_node_indices'):
            hetero_graph, node_indices = self._to_graph()
        else:
            hetero_graph, node_indices = self.graph, self.graph_node_indices
        if database.config.sql_homo_graph_debug:
            # TODO: debug
            hetero_graph = dgl.node_type_subgraph(hetero_graph, ['column', 'table'])
        table_features = []
        for feature_name in _table_features:
            _table_feature = hetero_graph.nodes['table'].data[f'features.{feature_name}']
            if _table_feature.ndim == 1:
                _table_feature = _table_feature.unsqueeze(-1)
            table_features.append(_table_feature)
        table_features = torch.cat(table_features, dim=-1)

        column_features = {'statistic': hetero_graph.nodes['column'].data['statistic']}
        for feature_name in _predicate_features:
            _predicate_feature = hetero_graph.nodes['column'].data[f'{feature_name}.value'].unsqueeze(-1)
            _predicate_mask = hetero_graph.nodes['column'].data[f'{feature_name}.mask'].unsqueeze(-1)
            column_features[feature_name] = torch.cat([_predicate_feature, _predicate_mask], dim=-1)

        edge_features = []
        for feature_name in _edge_features:
            _edge_feature = hetero_graph.edges['to'].data[feature_name]
            if _edge_feature.ndim == 1:
                _edge_feature = _edge_feature.unsqueeze(-1)
            edge_features.append(_edge_feature)
        edge_features = torch.cat(edge_features, dim=-1)

        ori_ntypes = hetero_graph.ntypes
        ori_etypes = hetero_graph.etypes
        new_g, ntype_count, etype_count = dgl.to_homogeneous(hetero_graph, store_type=True, return_count=True)
        new_g : dgl.DGLGraph
        ntype_count = {k : ntype_count[i] for i, k in enumerate(ori_ntypes)}
        etype_count = {k : etype_count[i] for i, k in enumerate(ori_etypes)}

        ntype_slice = {}
        total_nodes = 0
        for t in ori_ntypes:
            count = ntype_count[t]
            ntype_slice[t] = slice(total_nodes, total_nodes + count)
            total_nodes += count

        etype_slice = {}
        total_edges = 0
        for edge_type in ori_etypes:
            edge_count = etype_count[edge_type]
            etype_slice[edge_type] = slice(total_edges, total_edges + edge_count)
            total_edges += edge_count

        # consider only table to table edges
        for edge_type in (
            'to',
        ): #ori_etypes:
            count = etype_count[edge_type]
            ntype_slice[edge_type] = slice(total_nodes, total_nodes + count)
            total_nodes += count
        new_g.add_nodes(total_nodes - new_g.num_nodes())

        edge_from, edge_to = hetero_graph.edges(form='uv', etype='to', order='eid')
        table_start_index = ntype_slice['table'].start
        edge_start_index = ntype_slice['to'].start
        new_g_edges = []
        for edge_index, (node_from, node_to) in enumerate(zip(edge_from.tolist(), edge_to.tolist())):
            node_from, node_to = node_from + table_start_index, node_to + table_start_index
            edge_index = edge_index + edge_start_index
            new_g_edges.append((node_from, edge_index))
            new_g_edges.append((edge_index, node_to))
        new_g_edges_from, new_g_edges_to = zip(*new_g_edges)
        new_g_edges_from = torch.tensor(new_g_edges_from, dtype=torch.long, device=hetero_graph.device)
        new_g_edges_to = torch.tensor(new_g_edges_to, dtype=torch.long, device=hetero_graph.device)
        new_g.add_edges(new_g_edges_from, new_g_edges_to)

        if database.config.extractor_remove_table_to_table_edges:
            edge_slice = etype_slice['to']
            edge_indices = list(range(edge_slice.start, edge_slice.stop))
            new_g.remove_edges(edge_indices)

        table_node_mask = torch.zeros(total_nodes, dtype=torch.int, device=hetero_graph.device)
        table_node_mask[ntype_slice['column']] = 0
        table_node_mask[ntype_slice['table']] = 1
        table_node_mask[ntype_slice['to']] = 2

        new_table_features = torch.zeros(total_nodes, *table_features.shape[1:], device=hetero_graph.device)
        new_table_features[ntype_slice['table']] = table_features

        new_g.ndata['table.features'] = new_table_features
        for table_feature_name in _table_other_features:
            table_feature = hetero_graph.nodes['table'].data[table_feature_name]
            new_table_feature = torch.zeros(total_nodes, *table_feature.shape[1:], device=hetero_graph.device)
            new_table_feature[ntype_slice['table']] = table_feature
            new_g.ndata[f'table.{table_feature_name}'] = new_table_feature
        for column_feature_name, column_feature in column_features.items():
            new_column_feature = torch.zeros(total_nodes, *column_feature.shape[1:], device=hetero_graph.device)
            new_column_feature[ntype_slice['column']] = column_feature
            new_g.ndata[f'column.{column_feature_name}'] = new_column_feature

        new_edge_features = torch.zeros(total_nodes, *edge_features.shape[1:], device=hetero_graph.device)
        new_edge_features[ntype_slice['to']] = edge_features
        new_g.ndata[f'edge.features'] = new_edge_features

        new_node_indices = {}
        for key, value in node_indices.items():
            if key.startswith('~'):
                # table
                new_node_indices[key] = value + ntype_slice['table'].start
            else:
                # column
                new_node_indices[key] = value + ntype_slice['column'].start

        new_g.ndata['classes'] = table_node_mask

        return new_g, new_node_indices
