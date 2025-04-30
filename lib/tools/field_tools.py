import typing
from collections import deque, abc


def get_attributes(obj: typing.Any) -> typing.Optional[typing.Dict[str, typing.Any]]:
    if isinstance(obj, (type, abc.Callable)):
        return
    if hasattr(obj, '__slots__'):
        res = {}
        for attr_name in obj.__slots__:
            try:
                res[attr_name] = getattr(obj, attr_name)
            except AttributeError:
                pass
        return res
    if hasattr(obj, '__dict__'):
        return dict(obj.__dict__)
    if isinstance(obj, abc.Mapping):
        return dict(obj)
    if isinstance(obj, abc.Sequence) and not isinstance(obj, (str, bytes, bytearray)):
        return {index: value for index, value in enumerate(obj)}
    return None

def _walk_object_gen(
    obj: typing.Any,
    bfs: bool = False,
):
    attrs = deque((((), obj),))
    while attrs:
        current_path, current_attr = attrs.popleft() if bfs else attrs.pop()
        child_attrs = get_attributes(current_attr)
        if child_attrs is not None:
            for key, value in child_attrs.items():
                child_path = current_path + (key,)
                yield child_path, value
                attrs.append((child_path, value))

def _walk_object_func(
    obj: typing.Any,
    map_func: typing.Callable[[typing.Tuple[str, ...], typing.Any], typing.Any],
    bfs: bool = False,
):
    if not callable(map_func):
        raise TypeError("'{}' object is not callable".format(type(map_func).__name__))
    attrs = deque((((), obj),))
    while attrs:
        current_path, current_attr = attrs.popleft() if bfs else attrs.pop()
        child_attrs = get_attributes(current_attr)
        if child_attrs is not None:
            for key, _value in child_attrs.items():
                child_path = current_path + (key,)
                value = map_func(child_path, _value)
                if _value is not None:
                    if value is not None:
                        if isinstance(current_attr, abc.MutableMapping):
                            current_attr[key] = value
                        elif isinstance(current_attr, abc.MutableSequence) and not isinstance(obj, (str, bytes, bytearray)):
                            current_attr[key] = value
                        else:
                            setattr(current_attr, key, value)
                    else:
                        value = _value
                attrs.append((child_path, value))

def walk_object(
    obj: typing.Any,
    map_func: typing.Optional[typing.Callable[[typing.Tuple[str, ...], typing.Any], typing.Any]] = None,
    bfs: bool = False,
):
    if map_func is None:
        return _walk_object_gen(obj, bfs)
    return _walk_object_func(obj, map_func, bfs)


__all__ = ['get_attributes', 'walk_object']
