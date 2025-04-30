from collections import abc

import torch
import tqdm

from .torch_summary import torch_batch


def adaptive_batch_process(
    process,
    batched_args=(),
    batched_kwargs=None,
    initial_batch_size=64,
    batch_size_step=2.,
    explore_thres=3,
    verbose=False,
):
    if batched_kwargs is None:
        batched_kwargs = {}
    if not isinstance(batched_args, abc.Sequence):
        raise TypeError("invalid positional arguments")
    if not isinstance(batched_kwargs, abc.Mapping):
        raise TypeError("invalid keyword arguments")

    def get_batched_args(pos, batch_size, batched_args, batched_kwargs):
        new_args, new_kwargs = [], {}
        for arg in batched_args:
            if isinstance(arg, abc.Sequence):
                new_args.append(arg[pos: min(len(arg), pos + batch_size)])
            else:
                new_args.append(arg)
        for key, arg in batched_kwargs.items():
            if isinstance(arg, abc.Sequence):
                new_kwargs[key] = arg[pos: min(len(arg), pos + batch_size)]
            else:
                new_kwargs[key] = arg
        return new_args, new_kwargs

    pos, min_batch_size, batch_size, max_batch_size = 0, 1, initial_batch_size, None
    explore = 0
    total = min(map(len, filter(lambda x: isinstance(x, abc.Sequence), (*batched_args, *batched_kwargs.values()))))
    results = []
    if verbose:
        gen = tqdm.tqdm(total=total)
    while pos < total:
        try:
            args, kwargs = get_batched_args(pos, batch_size, batched_args, batched_kwargs)
            res = process(*args, **kwargs)
        except (torch.cuda.OutOfMemoryError, RuntimeError) as e:
            if isinstance(e, RuntimeError) and "out of memory" not in str(e):
                raise
            torch.cuda.empty_cache()
            if batch_size == 1:
                raise
            if batch_size == min_batch_size:
                min_batch_size = int(min_batch_size // batch_size_step)
            max_batch_size = max(min_batch_size, batch_size - 1)
            explore = 0
            batch_size = int((min_batch_size + batch_size) // 2)
        else:
            if res is not None:
                results.append(res)
            pos += batch_size
            if verbose:
                gen.update(batch_size)
            min_batch_size = batch_size
            if max_batch_size is None:
                batch_size = round(batch_size * batch_size_step)
            elif explore < explore_thres:
                batch_size = round((batch_size + max_batch_size) / 2)
                explore += 1
    if verbose:
        gen.close()
    results = torch_batch(results, dim=0, op="cat")
    return results


__all__ = ["adaptive_batch_process"]
