import collections.abc
import typing
from functools import partial

import torch
import dgl
from dgl import DGLGraph
from dgl.nn import GraphormerLayer, SpatialEncoder

from model.nn import View


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


def preprocess_ffn(out_dim, hidden_dim, in_dim, *, activation_fn=torch.nn.GELU()):
    return torch.nn.Sequential(
        View(2),
        torch.nn.Linear(in_dim, hidden_dim),
        activation_fn,
        torch.nn.Linear(hidden_dim, out_dim),
    )

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
    ):
        super().__init__()

        if preprocess_ffn_gen is None:
            preprocess_ffn_gen = partial(preprocess_ffn, activation_fn=activation_fn)

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

        self._emb_layer_norm = torch.nn.LayerNorm(self._hidden_size)
        self._graphormer_layers = torch.nn.ModuleList((
            GraphormerLayer(
                feat_size=self._hidden_size,
                hidden_size=self._ffn_hidden_size,
                num_heads=self._num_heads,
                dropout=self._dropout,
                activation=self._activation,
                norm_first=self._pre_layernorm,
            ) for _ in range(self._num_layers)
        ))
        self._dist_encoder = SpatialEncoder(max_dist=self._max_distance, num_heads=self._num_heads)
        if self._num_node_type is not None:
            self._edge_type_encoder = SpatialEncoder(max_dist=self._num_node_type * self._num_node_type, num_heads=self._num_heads)
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
        for layer in self._graphormer_layers:
            x = layer(x, attn_mask=attn_mask, attn_bias=attn_bias)

        features[self._output_feat_name] = x
        collated['features'] = features
        new_graphs = recover_graphs(collated, concerned_ntypes=self._concerned_output_ntypes)
        return new_graphs
