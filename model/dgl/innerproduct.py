import math
import typing

import torch
import dgl


def u_matmul_v(lhs_field, rhs_field, out):
    def u_matmul_v(edges):
        return {out: torch.einsum('...ij,...jk->...ik', edges.src[lhs_field], edges.dst[rhs_field])}

    return u_matmul_v


class InnerProductConv(torch.nn.Module):
    def __init__(
        self,
        product_size,
        squeeze=True,
        aggr=None,
    ):
        super().__init__()
        if product_size <= 0:
            raise ValueError('product size must be greater than 0')

        self._product_size = product_size
        self._squeeze = squeeze
        if aggr == 'mean':
            aggr = dgl.function.mean
        elif aggr == 'max':
            aggr = dgl.function.max
        elif aggr == 'sum':
            aggr = dgl.function.sum
        else:
            aggr = None
        self.aggr = aggr

    def forward(self, g : dgl.DGLGraph, feat : typing.Union[torch.Tensor, typing.Tuple[torch.Tensor, torch.Tensor]]):
        if isinstance(feat, tuple):
            src, dst = feat
        else:
            src, dst = feat, feat
        src = src.view(*src.shape[:-1], -1, self._product_size)
        dst = dst.view(*dst.shape[:-1], self._product_size, -1)
        g.srcdata.update({'ft_src': src})
        g.dstdata.update({'ft_dst': dst})
        if self.aggr:
            g.update_all(u_matmul_v('ft_src', 'ft_dst', 'ft_e'), self.aggr('ft_e', 'ft_dst'))
            result = g.dstdata['ft_dst'] / math.sqrt(self._product_size)
        else:
            g.apply_edges(u_matmul_v('ft_src', 'ft_dst', 'ft_e'))
            result = g.edata['ft_e'] / math.sqrt(self._product_size)
        if self._squeeze:
            result = result.view(*result.shape[:-2], -1)
        return result


class InnerProductLinearConv(torch.nn.Module):
    def __init__(self, product_size, src_feat, dst_feat=None, aggr=None):
        super().__init__()
        if dst_feat is None:
            dst_feat = src_feat
        if src_feat % product_size != 0:
            raise ValueError(f'source feature size ({src_feat}) does not match product feature size ({product_size})')
        if dst_feat % product_size != 0:
            raise ValueError(f'destination feature size ({dst_feat}) does not match product feature size ({product_size})')

        self._inner_product = InnerProductConv(
            product_size,
            squeeze=True,
            aggr=aggr,
        )
        self._linear = torch.nn.Linear(
            src_feat * dst_feat // product_size ** 2,
            dst_feat,
            bias=False,
        )

    def forward(self, g : dgl.DGLGraph, feat : typing.Union[torch.Tensor, typing.Tuple[torch.Tensor, torch.Tensor]]):
        return self._linear(self._inner_product(g, feat))
