from abc import ABC
from tqdm import tqdm as _tqdm_base
from lib.third_party.tqdm import tqdm as _tqdm


class tqdm(_tqdm, ABC):
    default_args = dict(
        colour_default = '#cccccc',
        colour = '#dddddd',
        colour_desc = 'cyan',
        colour_percentage = 'yellow',
        colour_n = 'yellow',
        colour_total = 'green',
        colour_elapsed = 'yellow',
        colour_remaining = 'green',
        colour_rate = 'cyan',
        colour_postfix_keys = 'magenta',
        colour_postfix_values = 'yellow',
        default_bar_size = 1,
        use_rate = False,
    )

    def __new__(cls, *args, **kwargs):
        for key, value in cls.default_args.items():
            if key not in kwargs:
                kwargs[key] = value
        return _tqdm(*args, **kwargs)

    def __init__(self, *args, **kwargs):
        raise NotImplementedError

    @classmethod
    def __subclasshook__(cls, subclass):
        return issubclass(subclass, _tqdm_base)
