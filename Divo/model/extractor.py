import math
import typing

import torch
import dgl
import torch.nn.functional as F

from lib.torch import lora
from model.dgl import AggrGATConv
from model.nn import View
from .base.norm import SqrtZScore, SqrtMinMaxScaler

from ..core.sql_featurizer import database
from .graphormer_lora import Graphormer
from .additional_emb import AdditionalEmbedding

def u_matmul_v(lhs_field, rhs_field, out):
    def u_matmul_v(edges):
        return {out: torch.einsum('...ij,...jk->...ik', edges.src[lhs_field], edges.dst[rhs_field])}

    return u_matmul_v


class TableTransform(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self._hidden_size = database.config.feature_size
        _table_to_column_hidden_size = 32
        self._table_to_column_aggr_heads = 64
        self._predicate_num_heads = 16
        _table_cluster_onehot_size = database.schema.TABLE_CLUSTERS + 1
        _table_cluster_dense_embedding_size = database.schema.TABLE_DENSE_EMBEDDING_SIZE
        _column_statistics_size = database.schema.COLUMN_FEATURE_SIZE
        self._column_predicate_size = len(self._predicate_features)
        _table_feature_size = len(self._table_features)

        table_num_embeddings = 128

        self.zscore_table_features = SqrtZScore(_table_feature_size)
        self.minmax_predicate_features = SqrtMinMaxScaler(self._column_predicate_size)
        self.fc_table_features = torch.nn.Sequential(
            # lora.LoRALinear(_table_feature_size, self._hidden_size, bias=False, r=database.config.lora_rank),
            # torch.nn.LeakyReLU(),
            # lora.LoRALinear(self._hidden_size, self._hidden_size, r=database.config.lora_rank),
        )
        self.fc_table_cluster_onehot = torch.nn.Sequential(
            # lora.LoRALinear(_table_cluster_onehot_size, self._hidden_size, bias=False, r=database.config.lora_rank),
        )
        self.fc_table_cluster_dense_embedding = torch.nn.Sequential(
            # lora.LoRALinear(_table_cluster_dense_embedding_size, self._hidden_size, bias=False, r=database.config.lora_rank)
        )

        self.embedding_cluster_id = lora.LoRAEmbedding(_table_cluster_onehot_size, self._hidden_size, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha)
        self.embedding_table_id = AdditionalEmbedding(
            table_num_embeddings,
            self._hidden_size,
            rank=self._hidden_size // 8,
            enable=False,
            # the chance of completely erasing a table embedding
            dropout=database.config.extractor_table_emb_dropout,
        )
        self.embedding_table_id_frozen = torch.nn.Embedding(
            table_num_embeddings,
            self._hidden_size,
        )
        self.embedding_table_id_frozen.weight.requires_grad_(False)
        torch.nn.init.zeros_(self.embedding_table_id_frozen.weight)

        self.fc_table_all = torch.nn.Sequential(
            # torch.nn.LeakyReLU(),
            # lora.LoRALinear(3 * self._hidden_size, self._hidden_size, bias=False, r=database.config.lora_rank),
            #lora.LoRALinear(_table_feature_size + _table_cluster_onehot_size + _table_cluster_dense_embedding_size,
            #                self._hidden_size, bias=False, r=database.config.lora_rank),
            lora.LoRALinear(_table_feature_size + self._hidden_size + _table_cluster_dense_embedding_size,
                           self._hidden_size, bias=False, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha),
        )
        a = math.sqrt(3) * 2 / math.sqrt(10 + 7)
        torch.nn.init.uniform_(self.fc_table_all[0].weight, -a, a)

        self.fc_column_statistics = torch.nn.Sequential(
            lora.LoRALinear(_column_statistics_size, _table_to_column_hidden_size, bias=False, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha),
            torch.nn.Dropout(0.4),
        )
        self.fc_table_to_column_heads = torch.nn.Sequential(
            lora.LoRALinear(self._hidden_size, _table_to_column_hidden_size * self._table_to_column_aggr_heads, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha)
        )
        self.fc_predicate_heads = torch.nn.Sequential(
            torch.nn.LeakyReLU(),
            lora.LoRALinear(self._table_to_column_aggr_heads, self._predicate_num_heads * self._column_predicate_size,
                            bias=True, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha)
        )
        self.group_fc_predicate_embedding = torch.nn.ModuleList((
            lora.LoRALinear(self._predicate_num_heads, self._hidden_size, bias=False, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha)
            for _ in range(self._column_predicate_size)
        ))
        self.fc_table_final_embedding = torch.nn.Sequential(
            lora.LoRALinear(self._hidden_size * self._column_predicate_size + _table_feature_size, self._hidden_size,
                            bias=False, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha),
        )

        self.gnn_column_to_table = AggrGATConv(
            (_column_statistics_size, self._hidden_size),
            self._hidden_size,
            num_heads=8,
            residual=True,
            aggr='mean',
        )

    _table_features = (
        'table_row_count',
        'table_log_selectivity', 'table_log_relative_rows',
        # 'table_out_degree', 'table_in_degree',
        # 'table_column_count',
        # 'table_cost', 'table_selected_rows', 'table_width',
    )
    _table_features = (
        'table_row_count',
        'table_selected_rows',
        'table_sqrt_selected_rows',
        'table_square_selected_rows',
        'table_log_selectivity',
        # 'table_log_relative_rows',
        'table_out_degree', 'table_in_degree',
        'table_column_count',
        # 'table_cost', 'table_selected_rows', 'table_width',
    )

    @classmethod
    def _get_table_features(cls, g: dgl.DGLGraph):
        table_features = []
        for feature_name in cls._table_features:
            _table_feature = g.nodes['table'].data[f'features.{feature_name}']
            if _table_feature.ndim == 1:
                _table_feature = _table_feature.unsqueeze(-1)
            table_features.append(_table_feature)
        table_features = torch.cat(table_features, dim=-1)
        return table_features

    _predicate_features = (
        'predicate_filter', 'predicate_join',
    )

    @classmethod
    def _get_predicate_features(cls, g: dgl.DGLGraph):
        predicate_features = []
        predicate_masks = []
        for feature_name in cls._predicate_features:
            _predicate_feature = g.nodes['column'].data[f'{feature_name}.value']
            _predicate_mask = g.nodes['column'].data[f'{feature_name}.mask']
            if _predicate_feature.ndim == 1:
                _predicate_feature = _predicate_feature.unsqueeze(-1)
            if _predicate_mask.ndim == 1:
                _predicate_mask = _predicate_mask.unsqueeze(-1)
            predicate_features.append(_predicate_feature)
            predicate_masks.append(_predicate_mask)
        predicate_features = torch.cat(predicate_features, dim=-1)
        predicate_masks = torch.cat(predicate_masks, dim=-1)
        return predicate_features, predicate_masks

    def fit_norm(self, g: dgl.DGLGraph):
        table_features = self._get_table_features(g)
        #mean = table_features.mean(dim=0, keepdim=False)
        #std = table_features.std(dim=0, keepdim=False)
        #self.zscore_table_features.set(mean, std)
        predicate_features, predicate_masks = self._get_predicate_features(g)
        self.zscore_table_features.fit(table_features)
        self.minmax_predicate_features.fit(predicate_features)

    def enable_table_emb(self, mode = True):
        self.embedding_table_id.enable(mode)

    def load_table_frozen_embeddings(self, frozen_embeddings: torch.Tensor, unseen_table_mask: torch.Tensor):
        if not isinstance(frozen_embeddings, torch.Tensor):
            raise TypeError(f"'{frozen_embeddings.__class__.__name__}' object is not a tensor")
        if not isinstance(unseen_table_mask, torch.Tensor):
            raise TypeError(f"'{unseen_table_mask.__class__.__name__}' object is not a tensor")

        if self.embedding_table_id_frozen.weight.data.shape != frozen_embeddings.data.shape:
            raise RuntimeError(f"shape mismatch: "
                               f"old [{', '.join(map(str, self.embedding_table_id_frozen.weight.data.shape))}], "
                               f"new [{', '.join(map(str, frozen_embeddings.data.shape))}]")
        self.embedding_table_id_frozen.weight.data = frozen_embeddings.data.to(self.embedding_table_id_frozen.weight.device)

        if not isinstance(unseen_table_mask, torch.BoolTensor):
            unseen_table_mask = unseen_table_mask != 0
        if unseen_table_mask.ndim != 1 or unseen_table_mask.shape[0] != self._table_embedding_size:
            raise RuntimeError(f"incorrect mask shape [{', '.join(map(str, unseen_table_mask.shape))}] (should be [{self._table_embedding_size}])")
        unseen_table_mask = unseen_table_mask.to(self.embedding_table_id.A.device)
        self.embedding_table_id.A.data *= (~unseen_table_mask).view(-1, 1)
        self.embedding_table_id_frozen.weight.data *= unseen_table_mask.view(-1, 1)

    def freeze_token_embeddings_with_mask(self, mask: torch.Tensor):
        exported = self.embedding_table_id.export_embeddings()
        mask = mask.view(-1, *(1 for i in range(exported.ndim - 1)))
        self.embedding_table_id_frozen.weight.data *= ~mask
        self.embedding_table_id_frozen.weight.data += exported * mask

    def forward(self, g: dgl.DGLGraph):
        origin_table_features = self._get_table_features(g)
        if database.config.extractor_use_normalization:
            origin_table_features = self.zscore_table_features(origin_table_features)
        #origin_table_cluster_onehot = g.nodes['table'].data['onehot'].to(torch.float)
        origin_table_cluster_dense_embedding = g.nodes['table'].data['embedding']

        origin_table_cluster_id = g.nodes['table'].data['cluster_id'].to(torch.long)
        origin_table_cluster_emb = self.embedding_cluster_id(origin_table_cluster_id)
        origin_table_id = g.nodes['table'].data['table_id'].to(torch.long)
        _origin_table_emb = self.embedding_table_id(origin_table_id)
        origin_table_emb_frozen = self.embedding_table_id_frozen(origin_table_id)
        origin_table_emb = _origin_table_emb + origin_table_emb_frozen

        column_statistics = g.nodes['column'].data['statistic'].to(torch.float)
        column_to_table_subgraph = g['column', 'column_to_table', 'table']

        table_features = self.fc_table_features(origin_table_features)
        #table_cluster_onehot = self.fc_table_cluster_onehot(origin_table_cluster_onehot)
        table_cluster_onehot = origin_table_cluster_emb + origin_table_emb
        table_cluster_dense_embedding = self.fc_table_cluster_dense_embedding(origin_table_cluster_dense_embedding)
        table_embedding = self.fc_table_all(
            torch.cat([table_features, table_cluster_onehot, table_cluster_dense_embedding], dim=-1))
        if database.config.extractor_use_no_gat:
            column_to_table_embedding = table_embedding
        else:
            column_to_table_embedding = self.gnn_column_to_table(
                column_to_table_subgraph,
                (column_statistics, table_embedding),
            )
        table_new_embedding = F.dropout(column_to_table_embedding, 0.4, training=self.training)

        column_statistics_embedding = self.fc_column_statistics(column_statistics)
        column_statistics_embedding = column_statistics_embedding.view(*column_statistics_embedding.shape[:-1], 1,
                                                                       column_statistics_embedding.shape[-1])
        table_to_column_embedding = self.fc_table_to_column_heads(table_new_embedding)
        table_to_column_embedding = table_to_column_embedding.view(*table_to_column_embedding.shape[:-1], -1,
                                                                   self._table_to_column_aggr_heads)

        column_to_table_subgraph.srcdata['cs'] = column_statistics_embedding
        column_to_table_subgraph.dstdata['tc'] = table_to_column_embedding
        column_to_table_subgraph.apply_edges(u_matmul_v('cs', 'tc', 'out'))
        predicate_heads = self.fc_predicate_heads(column_to_table_subgraph.edata['out'])
        predicate_heads = predicate_heads.view(*predicate_heads.shape[:-2], -1, self._predicate_num_heads)
        column_to_table_subgraph.edata['ph'] = predicate_heads

        predicate_features, predicate_masks = self._get_predicate_features(g)
        if database.config.extractor_use_normalization:
            predicate_features = self.minmax_predicate_features(predicate_features)
        g.nodes['column'].data['pf'] = predicate_features
        g.nodes['column'].data['pm'] = predicate_masks

        def _predicate_func(edges):
            p = edges.src['pf'].unsqueeze(-1)
            p_mask = edges.src['pm'].unsqueeze(-1)
            res = p * edges.data['ph']
            #res = res + p_mask.log()
            res = res - (1 - p_mask) * 65536.
            return {'out_ct': res}

        g.multi_update_all({
            'column_to_table': (
                _predicate_func,
                dgl.function.max('out_ct', 'pe'),
            ),
        }, 'sum')
        predicate_embeddings = g.nodes['table'].data['pe']
        predicate_embeddings = predicate_embeddings * (predicate_embeddings > -32768.)
        #predicate_embeddings = torch.nan_to_num(predicate_embeddings, 0., 0., 0.)
        new_predicate_embeddings = []
        for i in range(self._column_predicate_size):
            new_predicate_embeddings.append(self.group_fc_predicate_embedding[i](predicate_embeddings[..., i, :]))
        predicate_embeddings = torch.cat(new_predicate_embeddings, dim=-1)

        # table_final_representation = torch.cat([predicate_embeddings, table_embedding], dim=-1)
        table_final_representation = torch.cat([predicate_embeddings, origin_table_features], dim=-1)
        table_final_representation = self.fc_table_final_embedding(table_final_representation)
        g.nodes['table'].data['_emb'] = table_final_representation
        return g


class Extractor(torch.nn.Module):
    def __init__(self, num_table_layers=3):
        super().__init__()

        self._feature_size = database.config.feature_size
        self._table_feature_size = database.schema.max_columns * database.config.feature_length + database.config.feature_extra_length

        self.table_transform = TableTransform()

        self.num_table_layers = num_table_layers
        self.table_to_table = torch.nn.ModuleList((
            AggrGATConv(
                self._feature_size,
                self._feature_size,
                num_heads=8,
                feat_drop=0.1,
                residual=True,
                # bias=False,
                aggr='fc',
            ) for i in range(self.num_table_layers)
        ))

    def fit_norm(self, g):
        if not isinstance(g, dgl.DGLGraph):
            g = dgl.batch(g)
        return self.table_transform.fit_norm(g)

    def enable_table_emb(self, mode: bool = True):
        pass

    def forward(self, g):
        g = self.table_transform(g)
        table_x = g.nodes['table'].data['_emb']

        table_res = table_x
        if not database.config.extractor_use_no_gat:
            for i in range(self.num_table_layers):
                table_res = self.table_to_table[i](
                    (dgl.edge_type_subgraph(g, [('table', 'to', 'table')])),
                    table_res,
                )

        g.nodes['table'].data['res'] = table_res

        return g

class _TableTransform(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self._table_hidden_size = 64
        self._column_hidden_size = 32
        self._predicate_hidden_size = 16
        self._inner_product_size = 32

        _table_cluster_onehot_size = database.schema.TABLE_CLUSTERS + 1
        _table_cluster_dense_embedding_size = database.schema.TABLE_DENSE_EMBEDDING_SIZE
        _table_feature_size = len(self._table_features)
        self.fc_table = torch.nn.Sequential(
            lora.LoRALinear(_table_feature_size + _table_cluster_onehot_size + _table_cluster_dense_embedding_size,
                            self._table_hidden_size, bias=False, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha)
        )
        a = math.sqrt(3) * 2 / math.sqrt(17)
        torch.nn.init.uniform_(self.fc_table[0].weight, -a, a)

        _column_statistics_size = database.schema.COLUMN_FEATURE_SIZE
        self.fc_column = torch.nn.Sequential(
            lora.LoRALinear(_column_statistics_size, self._column_hidden_size, bias=False, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha),
            torch.nn.Dropout(0.4),
        )

        _predicate_filter_size = 1
        self.view2 = View(2)
        self.fc_filter = torch.nn.Sequential(
            self.view2,
            lora.LoRALinear(_predicate_filter_size, self._predicate_hidden_size, bias=False, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha),
        )
        _predicate_join_size = 1
        self.fc_join = torch.nn.Sequential(
            self.view2,
            lora.LoRALinear(_predicate_join_size, self._predicate_hidden_size, bias=False, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha),
        )

        self.zscore_table_features = SqrtZScore(_table_feature_size)
        self.minmax_predicate_features = SqrtMinMaxScaler(_predicate_filter_size)

        self.conv_c2t_1 = AggrGATConv(
            (self._column_hidden_size, self._table_hidden_size),
            self._table_hidden_size,
            num_heads=8,
            residual=True,
            aggr='mean',
            allow_zero_in_degree=True,
        )
        self.conv_t2c_1 = AggrGATConv(
            (self._table_hidden_size, self._column_hidden_size),
            self._column_hidden_size,
            num_heads=8,
            residual=True,
            aggr='mean',
            allow_zero_in_degree=True,
        )
        self.conv_c2f_1 = AggrGATConv(
            (self._column_hidden_size, self._predicate_hidden_size),
            self._predicate_hidden_size,
            num_heads=8,
            residual=True,
            aggr='mean',
            allow_zero_in_degree=True,
        )
        self.conv_c2j_1 = AggrGATConv(
            (self._column_hidden_size, self._predicate_hidden_size),
            self._predicate_hidden_size,
            num_heads=8,
            residual=True,
            aggr='mean',
            allow_zero_in_degree=True,
        )
        self.conv_f2c_1 = AggrGATConv(
            (self._predicate_hidden_size, self._column_hidden_size),
            self._column_hidden_size,
            num_heads=8,
            residual=True,
            aggr='mean',
            allow_zero_in_degree=True,
        )
        self.conv_j2c_1 = AggrGATConv(
            (self._predicate_hidden_size, self._column_hidden_size),
            self._column_hidden_size,
            num_heads=8,
            residual=True,
            aggr='mean',
            allow_zero_in_degree=True,
        )
        self.conv_c2t_2 = AggrGATConv(
            (self._column_hidden_size, self._table_hidden_size),
            self._table_hidden_size,
            num_heads=8,
            residual=True,
            aggr='mean',
            allow_zero_in_degree=True,
        )

        self.fc_table_embedding = torch.nn.Sequential(
            lora.LoRALinear(self._table_hidden_size + _table_feature_size, database.config.feature_size, bias=False, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha),
        )

    _table_features = (
        'table_row_count',
        'table_log_selectivity', 'table_log_relative_rows',
        # 'table_out_degree', 'table_in_degree',
        # 'table_column_count',
        # 'table_cost', 'table_selected_rows', 'table_width',
    )

    @classmethod
    def _get_table_features(cls, g: dgl.DGLGraph):
        table_features = []
        for feature_name in cls._table_features:
            _table_feature = g.nodes['table'].data[f'features.{feature_name}']
            if _table_feature.ndim == 1:
                _table_feature = _table_feature.unsqueeze(-1)
            table_features.append(_table_feature)
        table_features = torch.cat(table_features, dim=-1)
        return table_features

    def fit_norm(self, g: dgl.DGLGraph):
        table_features = self._get_table_features(g)
        predicate_features = g.nodes['filter'].data['features']
        self.zscore_table_features.fit(table_features)
        self.minmax_predicate_features.fit(self.view2(predicate_features))

    def forward(self, g : dgl.DGLGraph):
        table_features = self._get_table_features(g)
        if database.config.extractor_use_normalization:
            table_features = self.zscore_table_features(table_features)
        table_cluster_onehot = g.nodes['table'].data['onehot'].to(torch.float)
        table_cluster_dense_embedding = g.nodes['table'].data['embedding']

        column_statistics = g.nodes['column'].data['statistic'].to(torch.float)

        filter_features = g.nodes['filter'].data['features']
        if database.config.extractor_use_normalization:
            filter_features = self.minmax_predicate_features(self.view2(filter_features))
        join_features = g.nodes['join'].data['features']

        table_embedding = self.fc_table(
            torch.cat([table_features, table_cluster_onehot, table_cluster_dense_embedding], dim=-1))
        column_embedding = self.fc_column(column_statistics)
        filter_embedding = self.fc_filter(filter_features)
        join_embedding = self.fc_join(join_features)

        g_c2t = g['column', 'column_to_table', 'table']
        g_t2c = g['table', 'table_to_column', 'column']
        g_c2f = g['column', 'column_to_filter', 'filter']
        g_c2j = g['column', 'column_to_join', 'join']
        g_f2c = g['filter', 'filter_to_column', 'column']
        g_j2c = g['join', 'join_to_column', 'column']

        t1 = self.conv_c2t_1(g_c2t, (column_embedding, table_embedding))
        c1 = self.conv_t2c_1(g_t2c, (t1, column_embedding))
        f1 = self.conv_c2f_1(g_c2f, (c1, filter_embedding))
        j1 = self.conv_c2j_1(g_c2j, (c1, join_embedding))
        c2_f = self.conv_f2c_1(g_f2c, (f1, c1))
        c2_j = self.conv_j2c_1(g_j2c, (j1, c1))
        t2 = self.conv_c2t_2(g_c2t, ((c2_f + c2_j) / 2, t1))

        res = self.fc_table_embedding(torch.cat([t2, table_features], dim=-1))
        g.nodes['table'].data['_emb'] = res
        return g

class TransformerExtractor(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self._feature_size = database.config.feature_size
        self._embedding_size = database.config.embedding_size

        _table_cluster_onehot_size = database.schema.TABLE_CLUSTERS + 1
        _table_cluster_dense_embedding_size = database.schema.TABLE_DENSE_EMBEDDING_SIZE
        _column_statistics_size = database.schema.COLUMN_FEATURE_SIZE
        self._table_embedding_size = len(database.schema.tables)

        self._graph_meta = {
            'table.features': 8,
            #'table.onehot': _table_cluster_onehot_size,
            'table.cluster_emb': self._embedding_size,
            'table.table_emb': self._embedding_size,
            'table.embedding': _table_cluster_dense_embedding_size,
            'column.statistic': _column_statistics_size,
            'column.predicate_filter': 2,
            'column.predicate_join': 2,
            'edge.features': 5,
        }

        preprocess_embedding_dim = database.config.feature_size
        num_layers = database.config.extractor_num_table_layers
        self.attn_hidden_size = database.config.extractor_hidden_size
        ffn_hidden_size = database.config.extractor_hidden_size
        max_distance = 2
        self._embedding_rank = database.config.extractor_embedding_rank \
            if database.config.extractor_embedding_rank is None or database.config.extractor_embedding_rank > 0 \
            else self._embedding_size // 8

        self.embedding_cluster_id = lora.LoRAEmbedding(_table_cluster_onehot_size, self._embedding_size, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha)
        self.embedding_table_id = AdditionalEmbedding(
            self._table_embedding_size,
            self._embedding_size,
            rank=self._embedding_rank,
            enable=False,
            # the chance of completely erasing a table embedding
            dropout=database.config.extractor_table_emb_dropout,
        )
        self.embedding_table_id_frozen = torch.nn.Embedding(
            self._table_embedding_size,
            self._embedding_size,
        )
        self.embedding_table_id_frozen.weight.requires_grad_(False)
        torch.nn.init.zeros_(self.embedding_table_id_frozen.weight)

        self.table_fc = torch.nn.Sequential(
            lora.LoRALinear(
                self._graph_meta['table.features'] +
                self._graph_meta['table.cluster_emb'] +
                self._graph_meta['table.table_emb'] +
                self._graph_meta['table.embedding'],
                preprocess_embedding_dim,
                r=database.config.lora_rank,
                lora_alpha=database.config.lora_alpha,
            ),
            torch.nn.GELU(),
            lora.LoRALinear(
                preprocess_embedding_dim,
                self.attn_hidden_size,
                r=database.config.lora_rank,
                lora_alpha=database.config.lora_alpha,
            )
        )

        self.predicate_fc = lora.LoRALinear(
            self._graph_meta['column.predicate_filter'] +
            self._graph_meta['column.predicate_join'],
            8,
            r=database.config.lora_rank,
            lora_alpha=database.config.lora_alpha,
            bias=False,
        )
        self.column_fc = torch.nn.Sequential(
            lora.LoRALinear(
                #self._graph_meta['column.statistic'] +
                #self._graph_meta['column.predicate_filter'] +
                #self._graph_meta['column.predicate_join'],
                self._graph_meta['column.statistic'] + 8,
                preprocess_embedding_dim,
                r=database.config.lora_rank,
                lora_alpha=database.config.lora_alpha,
            ),
            torch.nn.GELU(),
            lora.LoRALinear(
                preprocess_embedding_dim,
                self.attn_hidden_size,
                r=database.config.lora_rank,
                lora_alpha=database.config.lora_alpha,
            )
        )

        self.edge_fc = torch.nn.Sequential(
            lora.LoRALinear(
                self._graph_meta['edge.features'],
                preprocess_embedding_dim,
                r=database.config.lora_rank,
                lora_alpha=database.config.lora_alpha,
            ),
            torch.nn.GELU(),
            lora.LoRALinear(
                preprocess_embedding_dim,
                self.attn_hidden_size,
                r=database.config.lora_rank,
                lora_alpha=database.config.lora_alpha,
            )
        )

        self._graphormer = Graphormer(
            graph_meta=None,#self._graph_meta,
            hetero_graph=False,
            preprocess_embedding_dim=preprocess_embedding_dim,
            num_layers=num_layers,
            attn_hidden_size=self.attn_hidden_size,
            ffn_hidden_size=ffn_hidden_size,
            num_heads=database.config.transformer_attention_heads,
            dropout=database.config.transformer_fc_dropout_rate,
            pre_layernorm=True,
            activation_fn=torch.nn.GELU(),
            max_distance=max_distance,
            num_node_type=2,
            node_type_feature='classes',
            concerned_output_ntypes='table',
            output_feat_name='res',
            lora_rank=database.config.lora_rank,
            lora_alpha=database.config.lora_alpha,
        )

        self._readout = torch.nn.Sequential(
            lora.LoRALinear(self.attn_hidden_size, database.config.feature_size, r=database.config.lora_rank, lora_alpha=database.config.lora_alpha),
        )

    def fit_norm(self, g: dgl.DGLGraph):
        pass

    def enable_table_emb(self, mode = True):
        self.embedding_table_id.enable(mode)

    def load_table_frozen_embeddings(self, frozen_embeddings: torch.Tensor, unseen_table_mask: torch.Tensor):
        if not isinstance(frozen_embeddings, torch.Tensor):
            raise TypeError(f"'{frozen_embeddings.__class__.__name__}' object is not a tensor")
        if not isinstance(unseen_table_mask, torch.Tensor):
            raise TypeError(f"'{unseen_table_mask.__class__.__name__}' object is not a tensor")

        if self.embedding_table_id_frozen.weight.data.shape != frozen_embeddings.data.shape:
            raise RuntimeError(f"shape mismatch: "
                               f"old [{', '.join(map(str, self.embedding_table_id_frozen.weight.data.shape))}], "
                               f"new [{', '.join(map(str, frozen_embeddings.data.shape))}]")
        self.embedding_table_id_frozen.weight.data = frozen_embeddings.data.to(self.embedding_table_id_frozen.weight.device)

        if not isinstance(unseen_table_mask, torch.BoolTensor):
            unseen_table_mask = unseen_table_mask != 0
        if unseen_table_mask.ndim != 1 or unseen_table_mask.shape[0] != self._table_embedding_size:
            raise RuntimeError(f"incorrect mask shape [{', '.join(map(str, unseen_table_mask.shape))}] (should be [{self._table_embedding_size}])")
        unseen_table_mask = unseen_table_mask.to(self.embedding_table_id.A.device)
        self.embedding_table_id.A.data *= (~unseen_table_mask).view(-1, 1)
        self.embedding_table_id_frozen.weight.data *= unseen_table_mask.view(-1, 1)

    def freeze_token_embeddings_with_mask(self, mask: torch.Tensor):
        exported = self.embedding_table_id.export_embeddings()
        mask = mask.view(-1, *(1 for i in range(exported.ndim - 1)))
        self.embedding_table_id_frozen.weight.data *= ~mask
        self.embedding_table_id_frozen.weight.data += exported * mask

    def forward(self, g : dgl.DGLGraph):
        table_mask = g.ndata['classes']

        column_features = []
        is_column = table_mask == 0
        for n in ('column.statistic',):
            column_features.append(g.ndata[n][is_column])
        predicate_features = []
        for n in ('column.predicate_filter', 'column.predicate_join'):
            feature = g.ndata[n][is_column]
            value, mask = feature[..., 0], feature[..., 1]
            predicate_features.extend((value, 1 - mask))
        predicate_features = torch.stack(predicate_features, dim=-1)
        predicate_features = self.predicate_fc(predicate_features)
        column_features = torch.cat([*column_features, predicate_features], dim=-1)
        column_features = self.column_fc(column_features)

        """
        column_features = []
        is_column = table_mask == 0
        for n in ('column.statistic', 'column.predicate_filter', 'column.predicate_join'):
            column_features.append(g.ndata[n][is_column])
        column_features = torch.cat(column_features, dim=-1)
        column_features = self.column_fc(column_features)
        """

        table_features = []
        is_table = table_mask == 1
        for n in ('table.features', 'table.embedding'):
            table_features.append(g.ndata[n][is_table])
        table_cluster_emb = self.embedding_cluster_id(g.ndata['table.cluster_id'][is_table].to(torch.int))
        table_id = g.ndata['table.table_id'][is_table].to(torch.int)
        table_emb = self.embedding_table_id(table_id)
        table_frozen_emb = self.embedding_table_id_frozen(table_id)
        table_features.extend((table_cluster_emb, table_emb + table_frozen_emb))
        table_features = torch.cat(table_features, dim=-1)
        table_features = self.table_fc(table_features)

        edge_features = []
        is_edge = table_mask == 2
        for n in ('edge.features', ):
            edge_features.append(g.ndata[n][is_edge])
        edge_features = torch.cat(edge_features, dim=-1)
        edge_features = self.edge_fc(edge_features)

        input_embeddings = torch.zeros(table_mask.shape[0], self.attn_hidden_size, device=g.device)
        input_embeddings[is_column] = column_features
        input_embeddings[is_table] = table_features
        input_embeddings[is_edge] = edge_features
        g.ndata['res'] = input_embeddings

        g = self._graphormer(g)
        x = g.ndata['res']
        g.ndata['res'] = self._readout(x)
        return g
