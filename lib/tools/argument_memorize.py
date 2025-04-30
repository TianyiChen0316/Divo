import typing

class _cache:
    def __init__(self):
        self.__args__ = None
        self.__kwargs__ = None

    def set_args(self, args, kwargs):
        self.__args__ = args
        self.__kwargs__ = kwargs

    def get_args(self):
        return self.__args__

    def get_kwargs(self):
        return self.__kwargs__


def argument_memorize(func: typing.Callable[..., typing.Any]):
    if not callable(func):
        raise TypeError(f"'{func.__class__.__name__}' object is not callable")

    cache = _cache()

    def wrapper(*args, **kwargs):
        cache.set_args(args, kwargs)
        res = func(*args, **kwargs)
        return res
    wrapper.__name__ = func.__name__
    wrapper.__qualname__ = func.__qualname__
    wrapper.get_args = cache.get_args
    wrapper.get_kwargs = cache.get_kwargs

    return wrapper

def class_argument_memorize(func: typing.Callable[[object, ...], typing.Any]):
    if not callable(func):
        raise TypeError(f"'{func.__class__.__name__}' object is not callable")

    def wrapper(self, *args, **kwargs):
        if not hasattr(self, '__method_args__'):
            __method_args__ = {}
            setattr(self, '__method_args__', __method_args__)
        else:
            __method_args__ = getattr(self, '__method_args__')
        __method_args__[func.__name__] = (args, kwargs)
        res = func(self, *args, **kwargs)
        return res
    wrapper.__name__ = func.__name__
    wrapper.__qualname__ = func.__qualname__

    return wrapper


__all__ = ['argument_memorize', 'class_argument_memorize']