import sys
import importlib, importlib.util
from collections.abc import Iterable, Mapping
import typing

from ..syntax import view


class Module:
    def __init__(self, module_name, entry_name='main', package=None):
        self._module_name = module_name
        self._entry_name = entry_name
        self._package = package
        self._module = None

    def _load(self, reload=False):
        if self._module is None:
            self._module = importlib.import_module(self._module_name, self._package)
        elif reload:
            self._module = importlib.reload(self._module)
        return self._module

    @property
    def entry(self):
        self._load(reload=False)
        if not hasattr(self._module, self._entry_name):
            raise AttributeError(f"module '{self._module.__name__}' has no attribute '{self._entry_name}'")
        func = getattr(self._module, self._entry_name)
        if not callable(func):
            raise TypeError(f"'{func.__class__.__name__}' object is not callable")
        return func

    @property
    def __name__(self):
        return self.entry.__name__

    def __call__(self, *args, **kwargs):
        return self.entry(*args, **kwargs)

class ModulePacker:
    def __init__(
        self,
        modules : typing.Mapping[typing.Any, typing.Union[typing.Callable, str]] = None,
        entry_name='main',
    ):
        self._entry_name = entry_name
        self._modules = {}
        self.add_modules(modules)

    def add_modules(self, modules : typing.Optional[typing.Mapping[str, typing.Union[typing.Callable, str]]] = None, **_kw):
        if not isinstance(modules, Mapping):
            _kw['modules'] = modules
        else:
            modules = dict(modules)
            for k, v in tuple(modules.items()):
                if isinstance(v, str):
                    modules[k] = Module(v, entry_name=self._entry_name)
                elif isinstance(v, tuple):
                    if len(v) not in (2, 3):
                        raise ValueError("module identifier should be (module_name, entry_name) or (module_name, entry_name, package)")
                    modules[k] = Module(*v)
                elif not callable(v):
                    raise TypeError(f"'{v.__class__.__name__}' object is not callable")
            self._modules.update(modules)
        if _kw:
            for k, v in tuple(_kw.items()):
                if isinstance(v, str):
                    modules[k] = Module(v, entry_name=self._entry_name)
                elif isinstance(v, tuple):
                    if len(v) not in (2, 3):
                        raise ValueError(
                            "module identifier should be (module_name, entry_name) or (module_name, entry_name, package)")
                    modules[k] = Module(*v)
                elif not callable(v):
                    raise TypeError(f"'{v.__class__.__name__}' object is not callable")
            self._modules.update(_kw)
        return self

    def remove_modules(self, modules : typing.Union[str, typing.Iterable[str]]):
        if isinstance(modules, str):
            ori = self._modules.get(modules)
            if ori:
                self._modules.pop(modules)
            return ori
        if not isinstance(modules, Iterable):
            raise TypeError(f"'{modules.__class__.__name__}' object is not iterable")
        return {k : self.remove_modules(k) for k in modules}

    @view.getter_view
    def modules(self, item):
        if item not in self._modules:
            raise KeyError(item)
        return self._modules[item]

    @modules.setitem
    def modules(self, key, value):
        if not callable(value):
            raise TypeError(f"'{value.__class__.__name__}' object is not callable")
        self._modules[key] = value

    @modules.delitem
    def modules(self, item):
        if item not in self._modules:
            raise KeyError(item)
        del self._modules[item]

    @modules.method('keys')
    def modules(self):
        return self._modules.keys()

    @modules.method('values')
    def modules(self):
        return self._modules.values()

    @modules.method('items')
    def modules(self):
        return self._modules.items()

    @modules.method('__len__')
    def modules(self):
        return len(self._modules)

    def _module_wrapper(self, module_name, sys_argv):
        module = self._modules[module_name]
        def wrapper(*args, **kwargs):
            old_sys_argv = sys.argv
            sys.argv = [old_sys_argv[0], *sys_argv]
            try:
                res = module(*args, **kwargs)
            finally:
                sys.argv = old_sys_argv
            return res
        wrapper.__name__ = module.__name__
        wrapper.__qualname__ = getattr(module, '__qualname__', module.__name__)
        wrapper.module = module
        return wrapper

    def get_module(self, args=None):
        if args is None:
            args = sys.argv[1:]
        else:
            args = list(args)
        error_info = 'cannot find a default module'
        if len(args) == 0:
            module_name, new_args = None, args
        else:
            module_name, new_args = args[0], args[1:]
            if module_name not in self._modules:
                error_info = f"module '{module_name}' is not registered"
                module_name, new_args = None, args
        if None not in self._modules:
            raise ValueError(error_info)
        return self._module_wrapper(module_name, new_args)

    def __call__(self, args=None, *, module_args=None):
        module_wrapper = self.get_module(args)
        if module_args is None:
            a, kw = (), {}
        else:
            a, kw = module_args
        return module_wrapper(*a, **kw)

__all__ = ['ModulePacker']
