import typing
from collections.abc import Iterable

import numpy as np
from scipy.stats import norm
import torch
import torch.nn.functional as F


def cap_logit(input: torch.Tensor, eps=1e-4):
    return torch.logit(input, eps=eps) - torch.logit(input.new_tensor(eps))


def diagonal_sum(input: torch.Tensor):
    # input[..., 0 : W, 0 : H] -> output[..., 0 : W + H - 1],
    #  where output[..., 0] = [..., W - 1, 0]
    if input.ndim < 2:
        raise RuntimeError('the input tensor should have at least 2 dimensions')
    w, h = input.shape[-2:]
    padded_input = torch.cat([input.new_zeros(*input.shape[:-2], w, w - 1), input], dim=-1)
    gather_indices = torch.arange(0, w * (w + h), 1, dtype=torch.long, device=input.device)
    gather_indices = gather_indices % (w + h - 1)
    gather_indices = gather_indices.view(*(1 for i in range(input.ndim - 2)), w, w + h)[..., :-1]
    gather_indices = gather_indices.repeat(*input.shape[:-2], 1, 1)
    input_diagonal = padded_input.gather(-1, gather_indices)
    res = input_diagonal.sum(dim=-2, keepdim=False)
    return res


def value_to_class_labels(
    value : torch.Tensor,
    min_value : float,
    max_value : float,
    num_classes : float,
    std: typing.Union[float, torch.Tensor],
    consider_outliers : bool = False,
    retain_shape : bool = False,
):
    interval_length = (max_value - min_value) / num_classes
    hist_points = np.arange(min_value, max_value + interval_length / 2, interval_length)
    value_np = value.cpu().numpy()
    shape = value_np.shape
    if isinstance(std, (int, float)):
        std = np.array(std)
    else:
        std = std.cpu().numpy().reshape(-1, 1)
    cdf_input = (hist_points.reshape(1, -1) - value_np.reshape(-1, 1)) / std
    cdf_output = norm.cdf(cdf_input)
    probs = cdf_output[:, 1:] - cdf_output[:, :-1]
    if consider_outliers:
        probs[:, 0] += cdf_output[:, 0]
        probs[:, -1] += 1 - cdf_output[:, -1]
    if retain_shape:
        probs = probs.reshape(*shape, probs.shape[-1])
    return torch.tensor(probs, device=value.device)


def class_labels_to_value(
    probs : torch.Tensor,
    min_value: float,
    max_value: float,
    num_classes: int,
    use_softmax: bool = True,
    detail: bool = False,
    confidence_prob: float = None,
    window_size: int = None,
):
    if use_softmax:
        probs = probs.softmax(dim=-1)

    interval_length = (max_value - min_value) / num_classes
    hist_avgs = torch.arange(min_value + interval_length / 2, max_value, interval_length, device=probs.device)
    hist_avgs = hist_avgs.view(*(1 for _ in range(probs.ndim - 1)), -1).repeat(*probs.shape[:-1], 1)
    hist_values = hist_avgs * probs
    mean = hist_values.sum(dim=-1, keepdim=True)

    if detail:
        std = (probs * (hist_avgs - mean).pow(2.)).sum(dim=-1, keepdim=True).sqrt()
        skewness = (probs * ((hist_avgs - mean) / std).pow(3.)).sum(dim=-1, keepdim=True)

        res = {
            'mean': mean.squeeze(-1),
            'std': std.squeeze(-1),
            'skewness': skewness.squeeze(-1),
        }

        if confidence_prob is not None:
            # we regard distribution in each histogram interval as uniform
            confidence_prob_half = confidence_prob / 2
            mean_detach = mean.detach()
            hist_index = torch.floor((mean_detach - min_value) / interval_length).to(torch.long)
            prob_cumsum = probs.cumsum(dim=-1)
            central_proportion = (mean_detach - min_value - hist_index * interval_length) / interval_length
            central_higher_prob = probs.gather(dim=-1, index=hist_index) * (1 - central_proportion)
            cumsum_lower_total_prob = prob_cumsum.gather(dim=-1, index=hist_index)
            prob_cumsum_normalized = prob_cumsum - cumsum_lower_total_prob + central_higher_prob

            prob_cumsum_lb = prob_cumsum_normalized + confidence_prob_half
            confidence_lb_indices = (prob_cumsum_lb < 0).to(torch.long).sum(dim=-1, keepdim=True).clip(max=probs.shape[-1] - 1)
            confidence_lb_prob = probs.gather(dim=-1, index=confidence_lb_indices)
            confidence_lb_exceed_prob = prob_cumsum_lb.gather(dim=-1, index=confidence_lb_indices)
            confidence_lb_hist_value = hist_avgs.gather(dim=-1, index=confidence_lb_indices)
            confidence_lb = confidence_lb_hist_value + interval_length / 2 - interval_length * confidence_lb_exceed_prob / confidence_lb_prob.clip(1e-8)
            confidence_lb = confidence_lb.clip(min=min_value, max=max_value)

            prob_cumsum_ub = prob_cumsum_normalized - confidence_prob_half
            confidence_ub_indices = (prob_cumsum_ub < 0).to(torch.long).sum(dim=-1, keepdim=True).clip(max=probs.shape[-1] - 1)
            confidence_ub_prob = probs.gather(dim=-1, index=confidence_ub_indices)
            confidence_ub_exceed_prob = prob_cumsum_ub.gather(dim=-1, index=confidence_ub_indices)
            confidence_ub_hist_value = hist_avgs.gather(dim=-1, index=confidence_ub_indices)
            confidence_ub = confidence_ub_hist_value + interval_length / 2 - interval_length * confidence_ub_exceed_prob / confidence_ub_prob.clip(1e-8)
            confidence_ub = confidence_ub.clip(min=min_value, max=max_value)

            res.update({
                'confidence_lower_bound': confidence_lb.squeeze(-1),
                'confidence_upper_bound': confidence_ub.squeeze(-1),
            })

        if window_size is not None:
            if not isinstance(window_size, int):
                raise RuntimeError('window size must be integer')
            if window_size <= 0:
                raise RuntimeError('window size must be greater than 0')
            if window_size > num_classes:
                raise RuntimeError('window size should be less than or equal to the number of classes')
            if window_size % 2 == 0:
                window_conv = torch.ones(window_size + 1, device=probs.device)
                window_conv[0] = 0.5
                window_conv[-1] = 0.5
            else:
                window_conv = torch.ones(window_size, device=probs.device)
            probs_viewed = probs.view(-1, 1, probs.shape[-1])
            hist_values_viewed = hist_values.view(-1, 1, hist_values.shape[-1])
            window_conv_viewed = window_conv.view(1, 1, -1)
            probs_aggr = F.conv1d(probs_viewed, window_conv_viewed, padding=window_size // 2)
            probs_aggr = probs_aggr.view(*probs.shape)
            hist_values_aggr = F.conv1d(hist_values_viewed, window_conv_viewed, padding=window_size // 2)
            hist_values_aggr = hist_values_aggr.view(*hist_values.shape)
            probs_aggr_max, probs_aggr_argmax = probs_aggr.max(dim=-1, keepdim=True)
            # theoretically probs_aggr_max < window_size / num_classes will not happen
            max_hist_values_aggr = hist_values_aggr.gather(dim=-1, index=probs_aggr_argmax) \
                                / probs_aggr_max.clip(min=window_size / num_classes)
            res.update({
                'max_window_mean': max_hist_values_aggr.squeeze(-1),
            })

        return res

    return mean.squeeze(-1)


def normalized_prob_comparison(
    probs: torch.Tensor,
    baseline_probs: torch.Tensor,
    num_classes: int,
    use_softmax: bool = True,
):
    if use_softmax:
        probs = probs.softmax(dim=-1)
        baseline_probs = baseline_probs.softmax(dim=-1)
    probs_conv, baseline_probs_conv = probs.view(1, -1, probs.shape[-1]), baseline_probs.view(1, -1, baseline_probs.shape[-1])

    average_index : torch.Tensor = class_labels_to_value(baseline_probs, 0, num_classes, num_classes, use_softmax=False).view(-1, 1, 1)
    average_index_floor = average_index.floor()
    ceil_ratio = average_index - average_index_floor
    floor_ratio = 1 - ceil_ratio
    # use num_classes + 1 to prevent out-of-bounds exception
    conv_weight = torch.zeros(probs_conv.shape[1], 1, num_classes + 1, device=probs.device, dtype=floor_ratio.dtype)
    scatter_index = average_index_floor.to(torch.long)
    conv_weight.scatter_(dim=-1, index=scatter_index, src=floor_ratio)
    conv_weight.scatter_(dim=-1, index=scatter_index + 1, src=ceil_ratio)
    conv_weight = conv_weight[..., :-1]

    probs_converted = F.conv1d(probs_conv, conv_weight, padding=num_classes - 1, groups=probs_conv.shape[1]).view(*probs.shape[:-1], 2 * num_classes - 1)
    baseline_probs_converted = F.conv1d(baseline_probs_conv, conv_weight, padding=num_classes - 1, groups=baseline_probs_conv.shape[1]).view(*baseline_probs.shape[:-1], 2 * num_classes - 1)

    res = {
        'probs': probs_converted,
        'base_probs': baseline_probs_converted,
    }
    return res


def prob_compress(probs: torch.Tensor, central_index: int, compressed_half_size: int):
    # result shape: [..., 2 * compressed_half_size + 1]
    if not 0 <= central_index < probs.shape[-1]:
        raise RuntimeError('the central index must be within [0, input.shape(-1)]')
    index_lb, index_ub = central_index - compressed_half_size + 1, central_index + compressed_half_size
    fixed_index_lb, fixed_index_ub = max(index_lb, 0), min(index_ub, probs.shape[-1])
    central_probs = probs[..., fixed_index_lb : fixed_index_ub]
    lower_probs, upper_probs = probs[..., :fixed_index_lb], probs[..., fixed_index_ub:]
    if lower_probs.numel() == 0:
        lower_probs_aggr = probs.new_zeros(*probs.shape[:-1], fixed_index_lb - index_lb + 1)
    else:
        lower_probs_aggr = lower_probs.sum(dim=-1, keepdim=True)
    if upper_probs.numel() == 0:
        upper_probs_aggr = probs.new_zeros(*probs.shape[:-1], index_ub - fixed_index_ub + 1)
    else:
        upper_probs_aggr = upper_probs.sum(dim=-1, keepdim=True)
    res = torch.cat([lower_probs_aggr, central_probs, upper_probs_aggr], dim=-1)

    assert res.shape[-1] == 2 * compressed_half_size + 1

    return res


def parameter_flat(
    model: typing.Union[torch.nn.Module, typing.Iterable[torch.nn.Module]],
    preprocess: typing.Callable[[torch.nn.Parameter], typing.Optional[torch.Tensor]] = None,
):
    if isinstance(model, Iterable):
        model = tuple(model)
    else:
        model = (model, )
    if not callable(preprocess):
        def preprocess(_): return _
    params = []
    for submodule in model:
        for parameter_name, parameter in submodule.named_parameters():
            preprocessed = preprocess(parameter)
            if isinstance(preprocessed, torch.Tensor):
                param = preprocessed.flatten()
                params.append(param)
    if params:
        params = torch.cat(params, dim=0)
    else:
        params = None
    return params


def grad_flat(model: typing.Union[torch.nn.Module, typing.Iterable[torch.nn.Module]]):
    def preprocess(parameter : torch.nn.Parameter):
        if parameter.requires_grad:
            if parameter.grad is None:
                return torch.zeros_like(parameter, device=parameter.device, dtype=parameter.dtype)
            return parameter.grad.detach()
        return None

    return parameter_flat(model, preprocess)


__all__ = [
    'cap_logit', 'diagonal_sum', 'value_to_class_labels', 'class_labels_to_value', 'normalized_prob_comparison',
    'prob_compress', 'parameter_flat', 'grad_flat',
]
