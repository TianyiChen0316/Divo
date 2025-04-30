import functools
import typing as _typing
from collections.abc import Iterable as _Iterable
import numpy as np
import torch
from collections import deque

def _sum_dict(data : _typing.Tuple[_typing.Dict]):
    res = {}
    for d in data:
        for k in d.keys():
            if k not in res:
                res[k] = []
            res[k].append(d[k])
    for k, v in res.items():
        res[k] = sum_batch(v)
    return res

def _sum_iter(data : _typing.Tuple[_typing.Iterable[_typing.Any]]):
    res = []
    for d in data:
        for index, value in enumerate(d):
            if index >= len(res):
                res.append([])
            res[index].append(value)
    for index in range(len(res)):
        res[index] = sum_batch(res[index])
    return res

def sum_batch(data : _typing.Iterable[_typing.Dict]):
    data = tuple(data)
    if len(data) == 0:
        return None
    if isinstance(data[0], dict):
        return _sum_dict(data)
    typ = 0
    _tensor_ref = None
    for d in data:
        if isinstance(d, _Iterable):
            typ = max(1, typ)
        if isinstance(d, np.ndarray):
            typ = max(2, typ)
        if isinstance(d, torch.Tensor):
            typ = max(3, typ)
            _tensor_ref = d
            break
        if isinstance(d, (str, bytes)):
            typ = max(4, typ)
    if typ == 4:
        return functools.reduce(lambda x, y: x + y, data)
    if typ == 3:
        return torch.stack(
            tuple(map(
                lambda x: x if isinstance(x, torch.Tensor) else _tensor_ref.new_tensor(x),
                data,
            )), dim=0).sum(dim=0)
    if typ == 2:
        return np.stack(
            tuple(map(
                lambda x: x if isinstance(x, np.ndarray) else np.array(x),
                data,
            )), axis=0).sum(axis=0)
    if typ == 1:
        return _sum_iter(data)
    return sum(data)

def torch_convert(data : _typing.Iterable, convert_scalar=False, device=None, inplace=False):
    """
    Convert scalar iterable objects into torch.Tensor.
    """
    if isinstance(data, torch.Tensor):
        if inplace:
            return data.to(device) if device else data
        return data.clone().to(device) if device else data.clone()
    if isinstance(data, np.ndarray):
        return torch.tensor(data).to(device) if device else torch.tensor(data)
    if isinstance(data, dict):
        if inplace:
            res = data
        else:
            res = {}
        for k, v in data.items():
            res[k] = torch_convert(v, convert_scalar=False, device=device, inplace=inplace)
        return res
    if isinstance(data, _Iterable):
        res = []
        typ = None
        same_type = True
        for value in data:
            if isinstance(value, _Iterable):
                value = torch_convert(value, convert_scalar=False, device=device, inplace=False)
            res.append(value)
            if typ is None:
                typ = type(value)
            elif not issubclass(type(value), typ) and not issubclass(typ, type(value)):
                same_type = False
        if not res:
            return torch.tensor((), device=device)
        if same_type:
            if issubclass(typ, torch.Tensor):
                return torch.stack(res, dim=0)
            return torch.tensor(res, device=device)
        return res
    if convert_scalar:
        return torch.tensor((data, ), device=device)
    return data

def torch_flat(data : dict, convert_scalar=False, device=None):
    if not isinstance(data, dict):
        raise ValueError(f"'{data}' is not a dict")
    res = {}
    q = deque(((None, data), ))
    while len(q) > 0:
        current_prefix, current_data = q.popleft()
        for k, v in current_data.items():
            new_prefix = k if current_prefix is None else f'{current_prefix}.{k}'
            if isinstance(v, dict):
                q.append((new_prefix, v))
            elif isinstance(v, torch.Tensor):
                res[new_prefix] = v
            elif convert_scalar or isinstance(v, _Iterable):
                res[new_prefix] = torch.tensor(v, device=device)
            else:
                res[new_prefix] = v
    return res

def torch_batch(data : _typing.Iterable, dim=0, device=None, op="stack"):
    """
    Batch
    """
    data = tuple(data)
    if len(data) == 0:
        raise ValueError('cannot convert an empty list')
    if isinstance(data[0], dict):
        intersection_keys = set(data[0].keys())
        for i in range(1, len(data)):
            intersection_keys.intersection_update(data[i].keys())
        if not intersection_keys:
            raise ValueError(f'no common keys between dictionaries: {data}')
        return {k: torch_batch((dic[k] for dic in data), dim=dim, device=device, op=op) for k in intersection_keys}
    if isinstance(data[0], torch.Tensor):
        if op == "stack":
            return torch.stack(data, dim=dim)
        elif op == "cat":
            return torch.cat(data, dim=dim)
        raise ValueError(f"invalid operator type '{op}'")
    if isinstance(data[0], np.ndarray):
        if op == "stack":
            return torch.tensor(np.stack(data, axis=dim), device=device)
        elif op == "cat":
            return torch.tensor(np.concatenate(data, axis=dim), device=device)
        raise ValueError(f"invalid operator type '{op}'")
    if isinstance(data[0], _Iterable):
        if not isinstance(data, (tuple, list)):
            data = list(data)
        if op == "stack":
            try:
                return torch.stack([torch.tensor(v, device=device) for v in data], dim=dim)
            except RuntimeError as e:
                if 'Could not infer dtype' in str(e):
                    return data
                raise
        elif op == "cat":
            try:
                return torch.cat([torch.tensor(v, device=device) for v in data], dim=dim)
            except RuntimeError as e:
                if 'Could not infer dtype' in str(e):
                    res = []
                    for d in data:
                        res.extend(d)
                    return res
                raise
        raise ValueError(f"invalid operator type '{op}'")
    # scalars
    try:
        return torch.tensor(data, device=device)
    except RuntimeError as e:
        if 'Could not infer dtype' in str(e):
            return data
        raise

def dict_map(func : _typing.Callable, data : dict):
    if isinstance(data, dict):
        return {k : dict_map(func, v) for k, v in data.items()}
    return func(data)
