import typing

import numpy as np
import torch
from torch import nn as nn
from torch.nn.modules.batchnorm import _NormBase
from torch.nn.modules.dropout import _DropoutNd


class Dropout(_DropoutNd):
    r"""During training, randomly zeroes some of the elements of the input
    tensor with probability :attr:`p` using samples from a Bernoulli
    distribution. Each channel will be zeroed out independently on every forward
    call.

    This has proven to be an effective technique for regularization and
    preventing the co-adaptation of neurons as described in the paper
    `Improving neural networks by preventing co-adaptation of feature
    detectors`_ .

    Furthermore, the outputs are scaled by a factor of :math:`\frac{1}{1-p}` during
    training. This means that during evaluation the module simply computes an
    identity function.

    Args:
        p: probability of an element to be zeroed. Default: 0.5
        inplace: If set to ``True``, will do this operation in-place. Default: ``False``

    Shape:
        - Input: :math:`(*)`. Input can be of any shape
        - Output: :math:`(*)`. Output is of the same shape as input

    Examples::

        >>> m = nn.Dropout(p=0.2)
        >>> input = torch.randn(20, 16)
        >>> output = m(input)

    .. _Improving neural networks by preventing co-adaptation of feature
        detectors: https://arxiv.org/abs/1207.0580
    """

    def __init__(self, p: float = 0.5, inplace: bool = False, training: typing.Union[None, bool] = None):
        super().__init__(p, inplace)
        self._training = training

    def forward(self, input: torch.Tensor) -> torch.Tensor:
        if self._training is not None:
            training = self._training
        else:
            training = self.training
        return torch.nn.functional.dropout(input, self.p, training, self.inplace)


class BatchNorm(_NormBase):
    def __init__(
        self,
        num_features: int,
        eps: float = 1e-5,
        momentum: float = 0.1,
        affine: bool = True,
        track_running_stats: bool = True,
        bn_training: typing.Union[None, bool] = None,
        device=None,
        dtype=None,
    ) -> None:
        factory_kwargs = {'device': device, 'dtype': dtype}
        self.bn_training = bn_training
        super().__init__(
            num_features, eps, momentum, affine, track_running_stats, **factory_kwargs
        )

    def _check_input_dim(self, input):
        return

    def forward(self, input: torch.Tensor) -> torch.Tensor:

        # exponential_average_factor is set to self.momentum
        # (when it is available) only so that it gets updated
        # in ONNX graph when this node is exported to ONNX.
        if self.momentum is None:
            exponential_average_factor = 0.0
        else:
            exponential_average_factor = self.momentum

        if self.training and self.track_running_stats:
            # TODO: if statement only here to tell the jit to skip emitting this when it is None
            if self.num_batches_tracked is not None:  # type: ignore[has-type]
                self.num_batches_tracked.add_(1)  # type: ignore[has-type]
                if self.momentum is None:  # use cumulative moving average
                    exponential_average_factor = 1.0 / float(self.num_batches_tracked)
                else:  # use exponential moving average
                    exponential_average_factor = self.momentum

        r"""
        Decide whether the mini-batch stats should be used for normalization rather than the buffers.
        Mini-batch stats are used in training mode, and in eval mode when buffers are None.
        """
        if self.bn_training is not None:
            bn_training = self.bn_training
        elif self.training:
            bn_training = True
        else:
            bn_training = (self.running_mean is None) and (self.running_var is None)

        r"""
        Buffers are only updated if they are to be tracked and we are in training mode. Thus they only need to be
        passed when the update should occur (i.e. in training mode when they are tracked), or when buffer stats are
        used for normalization (i.e. in eval mode when buffers are not None).
        """
        return torch.nn.functional.batch_norm(
            input,
            # If buffers are not to be tracked, ensure that they won't be updated
            self.running_mean
            if not self.training or self.track_running_stats
            else None,
            self.running_var if not self.training or self.track_running_stats else None,
            self.weight,
            self.bias,
            bn_training,
            exponential_average_factor,
            self.eps,
        )


class ZScore(torch.nn.Module):
    def __init__(self, num_features: int, eps=1e-4, requires_grad=False):
        super().__init__()
        self._num_features = num_features
        self.mean = torch.nn.Parameter(torch.zeros(num_features), requires_grad=requires_grad)
        self.std = torch.nn.Parameter(torch.ones(num_features), requires_grad=requires_grad)
        self.eps = eps

    def fit(self, values : torch.Tensor):
        mean = values.mean(dim=0, keepdim=False)
        std = values.std(dim=0, keepdim=False)
        self.set(mean, std)
        return self

    def set(
        self,
        mean : typing.Union[torch.Tensor, float, None] = None,
        std : typing.Union[torch.Tensor, float, None] = None,
    ):
        if mean is None:
            mean = 0.
        if std is None:
            std = 1.
        if not isinstance(mean, torch.Tensor):
            mean = torch.Tensor(mean)
        if not isinstance(std, torch.Tensor):
            std = torch.Tensor(std)
        if mean.numel() == 1:
            mean = mean.view(1).repeat(self._num_features)
        else:
            assert mean.ndim == 1 and mean.shape[0] == self._num_features, \
                f'Shape mismatch for mean [{", ".join(mean.shape)}] (expected [{self._num_features}])'
        if std.numel() == 1:
            std = std.view(1).repeat(self._num_features)
        else:
            assert std.ndim == 1 and std.shape[0] == self._num_features, \
                f'Shape mismatch for std [{", ".join(std.shape)}] (expected [{self._num_features}])'
        self.mean.data = mean.detach().clone().to(self.mean.device)
        self.std.data = std.nan_to_num(1.).clip(self.eps, None).detach().clone().to(self.std.device)
        return self

    def forward(self, input : torch.Tensor) -> torch.Tensor:
        view_args = (1, -1, *(1 for i in range(input.ndim - 2)))
        mean = self.mean.detach().view(*view_args)
        std = self.std.detach().view(*view_args)
        return (input - mean) / std

class MinMaxScaler(torch.nn.Module):
    def __init__(self, num_features: int, eps=1e-4, requires_grad=False):
        super().__init__()
        self._num_features = num_features
        self.min = torch.nn.Parameter(torch.zeros(num_features), requires_grad=requires_grad)
        self.range = torch.nn.Parameter(torch.ones(num_features), requires_grad=requires_grad)
        self.eps = eps

    def fit(self, values : torch.Tensor):
        min = values.min(dim=0, keepdim=False).values
        max = values.max(dim=0, keepdim=False).values
        self.set(min, max)
        return self

    def set(
        self,
        min: typing.Union[torch.Tensor, float, None] = None,
        max: typing.Union[torch.Tensor, float, None] = None,
    ):
        if min is None:
            min = 0.
        if max is None:
            max = 1.
        if not isinstance(min, torch.Tensor):
            min = torch.Tensor(min)
        if not isinstance(max, torch.Tensor):
            max = torch.Tensor(max)
        if min.numel() == 1:
            min = min.view(1).repeat(self._num_features)
        else:
            assert min.ndim == 1 and min.shape[0] == self._num_features, \
                f'Shape mismatch for min [{", ".join(min.shape)}] (expected [{self._num_features}])'
        if max.numel() == 1:
            max = max.view(1).repeat(self._num_features)
        else:
            assert max.ndim == 1 and max.shape[0] == self._num_features, \
                f'Shape mismatch for max [{", ".join(max.shape)}] (expected [{self._num_features}])'
        self.min.data = min.detach().clone().to(self.min.device)
        self.range.data = (max - min).clip(self.eps, None).detach().clone().to(self.range.device)
        return self

    def forward(self, input: torch.Tensor) -> torch.Tensor:
        view_args = (1, -1, *(1 for i in range(input.ndim - 2)))
        min = self.min.detach().view(*view_args)
        _range = self.range.detach().view(*view_args)
        return (input - min) / _range


class TransposeBatchNorm1d(BatchNorm):
    def forward(self, input: torch.Tensor) -> torch.Tensor:
        return super().forward(input.transpose(-1, -2)).transpose(-1, -2)


class Permute(nn.Module):
    def __init__(self, *args):
        super().__init__()
        self.args = args

    def forward(self, input: torch.Tensor):
        return input.permute(*self.args)


class Transpose(nn.Module):
    def __init__(self, *args):
        super().__init__()
        self.args = args

    def forward(self, input: torch.Tensor):
        return input.transpose(*self.args)


class View(torch.nn.Module):
    def __init__(self, ndim=2, *args):
        super().__init__()
        if args:
            ndim = (ndim, *args)
        if isinstance(ndim, int):
            self._ndim = max(ndim, 1)
        else:
            self._ndim = tuple(ndim)

    def forward(self, input : torch.Tensor):
        if isinstance(self._ndim, int):
            if input.ndim < self._ndim:
                input = input.view(*input.shape, *(1 for i in range(self._ndim - input.ndim)))
            elif input.ndim > self._ndim:
                input = input.view(*input.shape[:self._ndim - 1], -1)
        else:
            input = input.view(-1, *self._ndim)
        return input


class ChunkedLinear(torch.nn.Module):
    def __init__(self, in_features, out_features, num_chunks, bias=True):
        super().__init__()
        self._linears = torch.nn.ModuleList(
            torch.nn.Linear(in_features // num_chunks, out_features // num_chunks, bias=bias)
            for i in range(num_chunks)
        )
        self._num_chunks = num_chunks

    def forward(self, input : torch.Tensor):
        res = [l(t) for l, t in zip(self._linears, input.chunk(self._num_chunks, -1))]
        return torch.cat(res, dim=-1)


class RMSNorm(torch.nn.Module):
    def __init__(self, hidden_size, eps=1e-6):
        super().__init__()
        self.weight = torch.nn.Parameter(torch.ones(hidden_size))
        self.variance_epsilon = eps

    def forward(self, hidden_states):
        var = hidden_states.pow(2).mean(-1, keepdim=True)
        hidden_states = hidden_states * torch.rsqrt(var + self.variance_epsilon)
        return self.weight * hidden_states


class DeepNorm(torch.nn.Module):
    def __init__(self, hidden_size, alpha=None, beta=None, *, encoder_layers=None, decoder_layers=None, mode='encoder'):
        super().__init__()
        is_encoder = mode == 'encoder'
        recommended_alpha, recommended_beta = None, None
        if is_encoder and encoder_layers is not None:
            if decoder_layers is None:
                recommended_alpha = (2 * encoder_layers) ** 0.25
                recommended_beta = (8 * encoder_layers) ** 0.25
            else:
                base = encoder_layers ** 0.25 * decoder_layers ** 0.0625
                recommended_alpha = 0.81 * base
                recommended_beta = 0.87 * base
        elif not is_encoder and decoder_layers is not None:
            if encoder_layers is None:
                recommended_alpha = (2 * decoder_layers) ** 0.25
                recommended_beta = (8 * decoder_layers) ** 0.25
            else:
                recommended_alpha = (3 * decoder_layers) ** 0.25
                recommended_beta = (12 * decoder_layers) ** 0.25
        if alpha is None:
            alpha = 1.0 if recommended_alpha is None else recommended_alpha
        if beta is None:
            beta = 1.0 if recommended_beta is None else recommended_beta

        self.norm = torch.nn.LayerNorm(hidden_size)
        self.alpha = alpha
        torch.nn.init.xavier_normal_(self.norm.weight, gain=beta)

    def forward(self, module_input, module_output):
        return self.norm(self.alpha * module_input + module_output)


class MoeModule(torch.nn.Module):
    def __init__(
        self,
        gen : typing.Callable[[int], torch.nn.Module],
        gate_in_features : typing.Union[int, torch.nn.Module, typing.Callable[[], torch.nn.Module]],
        num_experts : int,
        num_selected_experts : int,
        exploration_mode : str = 'egreedy',
        eps : float = 1e-4,
        softmax_temperature : typing.Union[int, float, None] = None,
        weight_thres = 0.1,
        **kwargs,
    ):
        super().__init__()
        self._num_experts = num_experts
        self._num_selected_experts = num_selected_experts
        self.softmax_temperature = 1. if softmax_temperature is None else softmax_temperature
        self.eps = eps
        self.weight_thres = weight_thres

        self.exploration_mode = exploration_mode
        if exploration_mode == 'egreedy':
            self.epsilon = kwargs.get('epsilon', 0.1)

        if isinstance(gate_in_features, torch.nn.Module):
            self.gate = gate_in_features
        elif callable(gate_in_features):
            self.gate = gate_in_features()
        else:
            self.gate = torch.nn.Linear(gate_in_features, num_experts)
        self.models = torch.nn.ModuleList((gen(_) for _ in range(num_experts)))

    def forward(self, input, gate_input=None):
        if gate_input is None:
            gate_input = input
        if input.shape[:-1] != gate_input.shape[:-1]:
            raise RuntimeError(f'shape mismatch between input [{", ".join(map(str, input.shape))}] and gate input [{", ".join(map(str, gate_input.shape))}]')

        gate_scores = (self.gate(gate_input) / self.softmax_temperature).clip(self.eps)
        gate_scores_softmax = gate_scores.softmax(dim=-1)

        topk_values, topk_indices = gate_scores_softmax.topk(k=self._num_selected_experts, dim=-1, largest=True)
        if self.training:
            if self.exploration_mode == 'egreedy':
                topk_mask = torch.zeros_like(gate_scores_softmax, dtype=torch.bool, device=gate_scores_softmax.device)
                topk_mask.scatter_(dim=-1, index=topk_indices,
                                  src=torch.ones_like(topk_indices, dtype=torch.bool, device=topk_mask.device))
                random_score = torch.rand(*gate_scores_softmax.shape, dtype=gate_scores_softmax.dtype, device=gate_scores.device)
                random_score_mask = random_score < self.epsilon
                random_score = random_score - 1
                random_score[topk_mask & random_score_mask] = -2
                random_score[topk_mask & ~random_score_mask] = gate_scores_softmax[topk_mask & ~random_score_mask]
                new_topk_values, topk_indices = random_score.topk(k=self._num_selected_experts, dim=-1, largest=True)
            elif self.exploration_mode == 'prob':
                _scores = gate_scores_softmax.view(-1, self._num_experts)
                _scores_numpy = _scores.cpu().numpy()
                _indices_numpy = np.arange(0, self._num_experts, dtype=int)
                selected_indices = []
                for _score in _scores_numpy:
                    selected_indices.append(np.random.choice(_indices_numpy, self._num_selected_experts, replace=False, p=_score))
                selected_indices = np.stack(selected_indices, axis=0)
                topk_indices = torch.tensor(selected_indices, dtype=topk_indices.dtype, device=topk_indices.device)
        topk_mask = torch.zeros_like(gate_scores_softmax, dtype=torch.bool, device=gate_scores_softmax.device)
        topk_mask.scatter_(dim=-1, index=topk_indices, src=torch.ones_like(topk_indices, dtype=torch.bool, device=topk_mask.device))

        weights = gate_scores_softmax.clip(self.weight_thres)
        weights_gather = weights.gather(dim=-1, index=topk_indices)
        total_weights = weights_gather.sum(dim=-1, keepdim=True).detach()
        weights = weights / total_weights

        res = 0.
        for expert_index in range(self._num_experts):
            expert_mask = topk_mask[..., expert_index]
            expert_mask_sum = expert_mask.sum()
            if expert_mask_sum == 0:
                # this expert is totally not used
                continue
            selected_input = input[expert_mask]
            selected_weights = weights[expert_mask][..., expert_index]
            expert_res = self.models[expert_index](selected_input) * selected_weights.unsqueeze(-1)
            new_expert_res = expert_res.new_zeros(*input.shape[:-1], expert_res.shape[-1])
            new_expert_res[expert_mask] = expert_res
            res = res + new_expert_res

        if not isinstance(res, torch.Tensor):
            raise RuntimeError('no expert is selected')

        res = res / self._num_selected_experts

        return res
