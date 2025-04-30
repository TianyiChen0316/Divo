import collections.abc
import math
import typing
from functools import partial

import torch
import dgl
from dgl import DGLGraph

from model.nn import View

import torch as th
import torch.nn as nn
import torch.nn.functional as F

from lib.torch import lora

def gaussian(x, mean, std):
    """compute gaussian basis kernel function"""
    a = (2 * math.pi) ** 0.5
    return th.exp(-0.5 * (((x - mean) / std) ** 2)) / (a * std)


class SpatialEncoder(nn.Module):
    def __init__(self, max_dist, num_heads=1, lora_rank=0, lora_alpha=1.):
        super().__init__()
        self.max_dist = max_dist
        self.num_heads = num_heads
        # deactivate node pair between which the distance is -1
        self.embedding_table = lora.LoRAEmbedding(
            max_dist + 2, num_heads, padding_idx=0,
            r=lora_rank,#min(lora_rank, num_heads),
            lora_alpha=lora_alpha,
        )

    def forward(self, dist):
        spatial_encoding = self.embedding_table(
            th.clamp(
                dist,
                min=-1,
                max=self.max_dist,
            )
            + 1
        )
        return spatial_encoding

class SpatialEncoder3d(nn.Module):
    def __init__(self, num_kernels, num_heads=1, max_node_type=100, lora_rank=0, lora_alpha=1.):
        super().__init__()
        self.num_kernels = num_kernels
        self.num_heads = num_heads
        self.max_node_type = max_node_type
        self.means = nn.Parameter(th.empty(num_kernels))
        self.stds = nn.Parameter(th.empty(num_kernels))
        self.linear_layer_1 = lora.LoRALinear(num_kernels, num_kernels, r=min(lora_rank, num_kernels), lora_alpha=lora_alpha)
        self.linear_layer_2 = lora.LoRALinear(num_kernels, num_heads, r=min(lora_rank, num_heads), lora_alpha=lora_alpha)
        # There are 2 * max_node_type + 3 pairs of gamma and beta parameters:
        # 1. Parameters at position 0 are for default gamma/beta when no node
        #    type is given
        # 2. Parameters at position 1 to max_node_type+1 are for src node types.
        #    (position 1 is for padded unexisting nodes)
        # 3. Parameters at position max_node_type+2 to 2*max_node_type+2 are
        #    for tgt node types. (position max_node_type+2 is for padded)
        #    unexisting nodes)
        self.gamma = nn.Embedding(2 * max_node_type + 3, 1, padding_idx=0)
        self.beta = nn.Embedding(2 * max_node_type + 3, 1, padding_idx=0)

        nn.init.uniform_(self.means, 0, 3)
        nn.init.uniform_(self.stds, 0, 3)
        nn.init.constant_(self.gamma.weight, 1)
        nn.init.constant_(self.beta.weight, 0)

    def forward(self, coord, node_type=None):
        bsz, N = coord.shape[:2]
        euc_dist = th.cdist(coord, coord, p=2.0)  # shape: [B, n, n]
        if node_type is None:
            node_type = th.zeros([bsz, N, N, 2], device=coord.device).long()
        else:
            src_node_type = node_type.unsqueeze(-1).repeat(1, 1, N)
            tgt_node_type = node_type.unsqueeze(1).repeat(1, N, 1)
            node_type = th.stack(
                [src_node_type + 2, tgt_node_type + self.max_node_type + 3],
                dim=-1,
            )  # shape: [B, n, n, 2]

        # scaled euclidean distance
        gamma = self.gamma(node_type).sum(dim=-2)  # shape: [B, n, n, 1]
        beta = self.beta(node_type).sum(dim=-2)  # shape: [B, n, n, 1]
        euc_dist = gamma * euc_dist.unsqueeze(-1) + beta  # shape: [B, n, n, 1]
        # gaussian basis kernel
        euc_dist = euc_dist.expand(-1, -1, -1, self.num_kernels)
        gaussian_kernel = gaussian(
            euc_dist, self.means, self.stds.abs() + 1e-2
        )  # shape: [B, n, n, K]
        # linear projection
        encoding = self.linear_layer_1(gaussian_kernel)
        encoding = F.gelu(encoding)
        encoding = self.linear_layer_2(encoding)  # shape: [B, n, n, H]

        return encoding

class BiasedMHA(nn.Module):
    def __init__(
        self,
        feat_size,
        num_heads,
        bias=True,
        attn_bias_type="add",
        attn_drop=0.1,
        lora_rank=0,
        lora_alpha=1.,
    ):
        super().__init__()
        self.feat_size = feat_size
        self.num_heads = num_heads
        self.head_dim = feat_size // num_heads
        assert (
            self.head_dim * num_heads == feat_size
        ), "feat_size must be divisible by num_heads"
        self.scaling = self.head_dim**-0.5
        self.attn_bias_type = attn_bias_type

        self.q_proj = lora.LoRALinear(feat_size, feat_size, bias=bias, r=lora_rank, lora_alpha=lora_alpha)
        self.k_proj = lora.LoRALinear(feat_size, feat_size, bias=bias, r=lora_rank, lora_alpha=lora_alpha)
        self.v_proj = lora.LoRALinear(feat_size, feat_size, bias=bias, r=lora_rank, lora_alpha=lora_alpha)
        self.out_proj = lora.LoRALinear(feat_size, feat_size, bias=bias, r=lora_rank, lora_alpha=lora_alpha)

        self.dropout = nn.Dropout(p=attn_drop)

        self.reset_parameters()

    def reset_parameters(self):
        nn.init.xavier_uniform_(self.q_proj.weight, gain=2**-0.5)
        nn.init.xavier_uniform_(self.k_proj.weight, gain=2**-0.5)
        nn.init.xavier_uniform_(self.v_proj.weight, gain=2**-0.5)

        nn.init.xavier_uniform_(self.out_proj.weight)
        if self.out_proj.bias is not None:
            nn.init.constant_(self.out_proj.bias, 0.0)


    def forward(self, ndata, attn_bias=None, attn_mask=None):
        q_h = self.q_proj(ndata).transpose(0, 1)
        k_h = self.k_proj(ndata).transpose(0, 1)
        v_h = self.v_proj(ndata).transpose(0, 1)
        bsz, N, _ = ndata.shape
        q_h = (
            q_h.reshape(N, bsz * self.num_heads, self.head_dim).transpose(0, 1)
            * self.scaling
        )
        k_h = k_h.reshape(N, bsz * self.num_heads, self.head_dim).permute(
            1, 2, 0
        )
        v_h = v_h.reshape(N, bsz * self.num_heads, self.head_dim).transpose(
            0, 1
        )

        attn_weights = (
            th.bmm(q_h, k_h)
            .transpose(0, 2)
            .reshape(N, N, bsz, self.num_heads)
            .transpose(0, 2)
        )

        if attn_bias is not None:
            if self.attn_bias_type == "add":
                attn_weights += attn_bias
            else:
                attn_weights *= attn_bias
        if attn_mask is not None:
            attn_weights[attn_mask.to(th.bool)] = float("-inf")
        attn_weights = F.softmax(
            attn_weights.transpose(0, 2)
            .reshape(N, N, bsz * self.num_heads)
            .transpose(0, 2),
            dim=2,
        )

        attn_weights = self.dropout(attn_weights)

        attn = th.bmm(attn_weights, v_h).transpose(0, 1)

        attn = self.out_proj(
            attn.reshape(N, bsz, self.feat_size).transpose(0, 1)
        )

        return attn


class LinearWrapper(torch.nn.Module):
    def __init__(self, model, input_size, model_input_size, model_output_size=None, output_size=None):
        super().__init__()
        self.model = model
        self.input_ffn = torch.nn.Linear(input_size, model_input_size)
        if model_output_size is None and output_size is None:
            self.output_ffn = torch.nn.Identity()
        else:
            if model_output_size is None:
                model_output_size = model_input_size
            if output_size is None:
                output_size = input_size
            self.output_ffn = torch.nn.Linear(model_output_size, output_size)

    def forward(self, input, *args, **kwargs):
        input = self.input_ffn(input)
        output = self.model(input, *args, **kwargs)
        output = self.output_ffn(output)
        return output


class GraphormerLayer(nn.Module):
    def __init__(
        self,
        feat_size,
        hidden_size,
        num_heads,
        attn_bias_type="add",
        norm_first=False,
        dropout=0.1,
        attn_dropout=0.1,
        activation : torch.nn.Module = nn.ReLU(),
        lora_rank=0,
        lora_alpha=1.,
    ):
        super().__init__()

        self.norm_first = norm_first

        self.attn = BiasedMHA(
            feat_size=feat_size,
            num_heads=num_heads,
            attn_bias_type=attn_bias_type,
            attn_drop=attn_dropout,
            lora_rank=lora_rank,
            lora_alpha=lora_alpha,
        )
        self.ffn = nn.Sequential(
            lora.LoRALinear(feat_size, hidden_size, r=lora_rank, lora_alpha=lora_alpha),
            activation,
            nn.Dropout(p=dropout),
            lora.LoRALinear(hidden_size, feat_size, r=lora_rank, lora_alpha=lora_alpha),
            nn.Dropout(p=dropout),
        )

        self.dropout = nn.Dropout(p=dropout)
        self.attn_layer_norm = nn.LayerNorm(feat_size)
        self.ffn_layer_norm = nn.LayerNorm(feat_size)

    def forward(self, nfeat, attn_bias=None, attn_mask=None):
        residual = nfeat
        if self.norm_first:
            nfeat = self.attn_layer_norm(nfeat)
        nfeat = self.attn(nfeat, attn_bias, attn_mask)
        nfeat = self.dropout(nfeat)
        nfeat = residual + nfeat
        if not self.norm_first:
            nfeat = self.attn_layer_norm(nfeat)
        residual = nfeat
        if self.norm_first:
            nfeat = self.ffn_layer_norm(nfeat)
        nfeat = self.ffn(nfeat)
        nfeat = residual + nfeat
        if not self.norm_first:
            nfeat = self.ffn_layer_norm(nfeat)
        return nfeat


def collate_batched_graphs(g : DGLGraph, feature_name : typing.Union[str, typing.List[str]], max_dist=1, node_type_feature=None):
    if isinstance(feature_name, str):
        feature_name = [feature_name]

    if g.batch_size == 1:
        ori_graphs = [g]
    else:
        ori_graphs = dgl.unbatch(g)

    edge_type_encoding, node_type_max = None, None
    if not g.is_homogeneous:
        node_types, edge_types = g.ntypes, g.etypes
        _new_graphs = [None for _ in range(len(ori_graphs))]
        ntype_counts, etype_counts = {n : [] for n in node_types}, {n : [] for n in edge_types}
        for index, _g in enumerate(ori_graphs):
            _new_g, ntype_count, etype_count = dgl.to_homogeneous(_g, feature_name, store_type=True, return_count=True)
            _new_graphs[index] = _new_g
            ntype_count = {n : c for n, c in zip(_g.ntypes, ntype_count)}
            for n in node_types:
                ntype_counts[n].append(ntype_count.get(n, 0))
            etype_count = {n : c for n, c in zip(_g.etypes, etype_count)}
            for e in edge_types:
                etype_counts[e].append(etype_count.get(e, 0))
            if node_type_feature is not None:
                node_type_tensor = []
                for i, t in enumerate(node_types):
                    node_type_tensor.extend(i for _ in range(ntype_count[t]))
                node_type_tensor = torch.tensor(node_type_tensor, device=g.device, dtype=torch.int)
                _new_g.ndata[node_type_feature] = node_type_tensor
        graphs = _new_graphs
        if node_type_feature is not None:
            node_type_max = len(node_types)
    else:
        ntype_counts, etype_counts = None, None
        graphs = ori_graphs
        if node_type_feature is not None:
            node_type_max = g.ndata[node_type_feature].max() + 1

    num_graphs = len(graphs)
    num_nodes = [_g.num_nodes() for _g in graphs]
    max_num_nodes = max(num_nodes)

    attn_mask = torch.eye(max_num_nodes, device=g.device, dtype=torch.int).view(1, max_num_nodes, max_num_nodes)
    dist = []
    attn_mask = attn_mask.repeat(num_graphs, 1, 1)
    features = {n : [] for n in feature_name}
    if node_type_feature is not None:
        edge_type_encoding = torch.zeros_like(attn_mask, device=g.device, dtype=torch.int)
    for i in range(num_graphs):
        _g = graphs[i]
        _num_nodes = num_nodes[i]
        if node_type_feature is not None:
            nt = _g.ndata[node_type_feature]
            nt_matrix = 1 + nt.unsqueeze(-1) * node_type_max + nt.unsqueeze(0)
            edge_type_encoding[i, :_num_nodes, :_num_nodes] = nt_matrix

        shortest_dist = dgl.shortest_dist(_g)
        adj = (0 <= shortest_dist) & (shortest_dist <= max_dist)
        attn_mask[i, :_num_nodes, :_num_nodes] = adj
        new_dist = torch.eye(max_num_nodes, device=g.device, dtype=torch.int) - 1
        new_dist[:_num_nodes, :_num_nodes] = shortest_dist
        dist.append(new_dist)
        for name in feature_name:
            feature = graphs[i].ndata[name]
            features[name].append(feature)
    dist = torch.stack(dist, dim=0)
    for name in feature_name:
        features[name] = torch.nn.utils.rnn.pad_sequence(features[name], batch_first=True)
    return {
        'graphs': g,
        'features': features,
        'attn_mask': 1 - attn_mask,
        'dist': dist,
        'num_nodes': num_nodes,
        'ntype_counts': ntype_counts,
        'etype_counts': etype_counts,
        'edge_type_encoding': edge_type_encoding,
    }

def recover_graphs(collated : dict, concerned_ntypes=None):
    g, features, num_nodes = collated['graphs'], collated['features'], collated['num_nodes']
    ntype_counts, etype_counts = collated['ntype_counts'], collated['etype_counts']
    if ntype_counts and etype_counts:
        if concerned_ntypes:
            if isinstance(concerned_ntypes, str):
                concerned_ntypes = (concerned_ntypes, )
            else:
                concerned_ntypes = set(concerned_ntypes)
        else:
            concerned_ntypes = set(ntype_counts.keys())
        node_type_indices = {n : ([], []) for n in concerned_ntypes}
        for index in range(len(num_nodes)):
            total_num_nodes = 0
            for node_type, counts in ntype_counts.items():
                count = counts[index]
                if count > 0 and node_type in concerned_ntypes:
                    batch_seq_indices = node_type_indices[node_type]
                    batch_seq_indices[0].extend((index for _ in range(count)))
                    batch_seq_indices[1].extend(range(total_num_nodes, total_num_nodes + count))
                total_num_nodes += count
        for node_type, (batch_indices, seq_indices) in node_type_indices.items():
            batch_indices = torch.tensor(batch_indices, device=g.device, dtype=torch.long)
            seq_indices = torch.tensor(seq_indices, device=g.device, dtype=torch.long)
            for feature_name, feature_tensors in features.items():
                concerned_features = feature_tensors[batch_indices, seq_indices]
                g.nodes[node_type].data[feature_name] = concerned_features
    else:
        new_features = {k : [] for k in features.keys()}
        for i in range(len(num_nodes)):
            n = num_nodes[i]
            for k in features.keys():
                new_features[k].append(features[k][i, :n])
        for k, tensors in new_features.items():
            g.ndata[k] = torch.cat(tensors, dim=0)
    return g


def preprocess_ffn(out_dim, hidden_dim, in_dim, *, activation_fn=torch.nn.GELU(), lora_rank=0, lora_alpha=1.):
    return torch.nn.Sequential(
        View(2),
        lora.LoRALinear(in_dim, hidden_dim, r=lora_rank, lora_alpha=lora_alpha),
        activation_fn,
        lora.LoRALinear(hidden_dim, out_dim, r=lora_rank, lora_alpha=lora_alpha),
    )


class _GraphormerLayers(torch.nn.Module):
    def __init__(self, layers):
        super().__init__()
        self.layers = torch.nn.ModuleList(layers)

    def forward(self, input, attn_bias=None, attn_mask=None):
        for layer in self.layers:
            input = layer(input, attn_bias=attn_bias, attn_mask=attn_mask)
        return input

class Graphormer(torch.nn.Module):
    def __init__(
        self,
        graph_meta : typing.Dict[str, typing.Dict[str, typing.Any]]=None,
        hetero_graph=True,
        preprocess_embedding_dim=128,
        num_layers=6,
        attn_hidden_size=128,
        ffn_hidden_size=128,
        num_heads=8,
        dropout=0.1,
        pre_layernorm=True,
        activation_fn=torch.nn.GELU(),
        preprocess_ffn_gen=None,
        max_distance=3,
        num_node_type=None,
        node_type_feature=None,
        concerned_output_ntypes=None,
        output_feat_name='out',
        num_parallel_models=None,
        lora_rank=0,
        lora_alpha=1.,
    ):
        super().__init__()

        if preprocess_ffn_gen is None:
            preprocess_ffn_gen = partial(preprocess_ffn, activation_fn=activation_fn, lora_rank=lora_rank, lora_alpha=lora_alpha)

        self._graph_meta = graph_meta
        self._num_layers = num_layers
        self._preprocess_embedding_dim = preprocess_embedding_dim
        self._hidden_size = attn_hidden_size
        self._ffn_hidden_size = ffn_hidden_size
        self._num_heads = num_heads
        self._dropout = dropout
        self._activation = activation_fn
        self._pre_layernorm = pre_layernorm
        self._output_feat_name = output_feat_name
        self._max_distance = max_distance
        self._concerned_output_ntypes = concerned_output_ntypes
        self._hetero_graph = hetero_graph
        self._num_node_type = num_node_type
        self._node_type_feature = node_type_feature
        self._num_parallel_models = num_parallel_models

        self._emb_layer_norm = torch.nn.LayerNorm(self._hidden_size)
        if num_parallel_models is None:
            self._graphormer_layers = _GraphormerLayers((
                GraphormerLayer(
                    feat_size=self._hidden_size,
                    hidden_size=self._ffn_hidden_size,
                    num_heads=self._num_heads,
                    dropout=self._dropout,
                    activation=self._activation,
                    norm_first=self._pre_layernorm,
                    lora_rank=lora_rank,
                    lora_alpha=lora_alpha,
                ) for _ in range(self._num_layers)
            ))
        else:
            min_hidden_size = 64
            self._graphormer_layers = torch.nn.ModuleList((
                LinearWrapper(
                    _GraphormerLayers((
                        GraphormerLayer(
                            feat_size=max(min_hidden_size, self._hidden_size >> model_index),
                            hidden_size=max(min_hidden_size, self._ffn_hidden_size >> model_index),
                            num_heads=self._num_heads,
                            dropout=self._dropout,
                            activation=self._activation,
                            norm_first=self._pre_layernorm,
                            lora_rank=lora_rank,
                            lora_alpha=lora_alpha,
                        )) for _ in range(self._num_layers)
                    ),
                    self._hidden_size,
                    max(min_hidden_size, self._hidden_size >> model_index),
                    max(min_hidden_size, self._hidden_size >> model_index),
                    self._hidden_size,
                ) for model_index in range(num_parallel_models))
            )
        self._dist_encoder = SpatialEncoder(max_dist=self._max_distance, num_heads=self._num_heads, lora_rank=lora_rank, lora_alpha=lora_alpha)
        if self._num_node_type is not None:
            self._edge_type_encoder = SpatialEncoder(max_dist=self._num_node_type * self._num_node_type, num_heads=self._num_heads, lora_rank=lora_rank, lora_alpha=lora_alpha)
        else:
            self._edge_type_encoder = torch.nn.Identity()

        self._node_preprocess_layers = torch.nn.ModuleDict()
        if graph_meta:
            if hetero_graph:
                for node_type, node_meta in graph_meta.items():
                    module_dict = torch.nn.ModuleDict()
                    self._node_preprocess_layers[node_type] = module_dict
                    for feat_name, ffn_args in node_meta.items():
                        if not isinstance(feat_name, str):
                            # iterator
                            feat_name = tuple(sorted(feat_name))
                        if not isinstance(ffn_args, collections.abc.Iterable):
                            ffn_args = (ffn_args, )
                        module_dict[feat_name] = preprocess_ffn_gen(self._hidden_size, self._preprocess_embedding_dim, *ffn_args)
            else:
                for feat_name, ffn_args in graph_meta.items():
                    if not isinstance(feat_name, str):
                        # iterator
                        feat_name = tuple(sorted(feat_name))
                    if not isinstance(ffn_args, collections.abc.Iterable):
                        ffn_args = (ffn_args,)
                    self._node_preprocess_layers[feat_name] = preprocess_ffn_gen(self._hidden_size, self._preprocess_embedding_dim, *ffn_args)

    def forward(self, graphs : dgl.DGLGraph):
        if self._graph_meta:
            if self._hetero_graph:
                if graphs.is_homogeneous:
                    raise ValueError('the input graph is not heterogeneous')

                for node_type, node_processors in self._node_preprocess_layers.items():
                    processed = []
                    for feat_name, ffn in node_processors.items():
                        if isinstance(feat_name, str):
                            res = ffn(graphs.nodes[node_type].data[feat_name])
                        else:
                            feats = [graphs.nodes[node_type].data[_n] for _n in feat_name]
                            # assume these features can be concatenated on the last dimension
                            res = ffn(torch.cat(feats, dim=-1))
                        processed.append(res)
                    # apply mean-pooling instead of sum-pooling to avoid explosion
                    processed = torch.stack(processed, dim=0).mean(dim=0)
                    graphs.nodes[node_type].data[self._output_feat_name] = processed
                for node_type in set(graphs.ntypes).difference(self._node_preprocess_layers.keys()):
                    pad_tensor = torch.zeros(graphs.num_nodes(node_type), self._preprocess_embedding_dim, device=graphs.device)
                    graphs.nodes[node_type].data[self._output_feat_name] = pad_tensor
            else:
                if not graphs.is_homogeneous:
                    raise ValueError('the input graph is not homogeneous')

                processed = []
                for feat_name, ffn in self._node_preprocess_layers.items():
                    if isinstance(feat_name, str):
                        res = ffn(graphs.ndata[feat_name])
                    else:
                        feats = [graphs.ndata[_n] for _n in feat_name]
                        # assume these features can be concatenated on the last dimension
                        res = ffn(torch.cat(feats, dim=-1))
                    processed.append(res)
                processed = torch.stack(processed, dim=0).mean(dim=0)
                graphs.ndata[self._output_feat_name] = processed

        collated = collate_batched_graphs(
            graphs,
            feature_name=self._output_feat_name,
            max_dist=self._max_distance,
            node_type_feature=self._node_type_feature if self._num_node_type else None,
        )
        features, attn_mask, dist = collated['features'], collated['attn_mask'], collated['dist']
        attn_bias = self._dist_encoder(dist)
        if self._num_node_type:
            edge_type_encoding = collated['edge_type_encoding']
            attn_bias = attn_bias + self._edge_type_encoder(edge_type_encoding)

        x = features[self._output_feat_name]
        x = self._emb_layer_norm(x)
        if self._num_parallel_models is not None:
            _x = 0.
            for layer in self._graphormer_layers:
                _x = _x + layer(x, attn_mask=attn_mask, attn_bias=attn_bias)
            x = _x / self._num_parallel_models
        else:
            x = self._graphormer_layers(x, attn_mask=attn_mask, attn_bias=attn_bias)

        features[self._output_feat_name] = x
        collated['features'] = features
        new_graphs = recover_graphs(collated, concerned_ntypes=self._concerned_output_ntypes)
        return new_graphs
