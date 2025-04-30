import typing
import os
import json


class Config:
    def __init__(self, **kwargs):
        self.load_state_dict(kwargs)

    def state_dict(self):
        res = {}
        for attr in dir(self):
            value = getattr(self, attr)
            if not callable(value):
                res[attr] = value
        return res

    def load_state_dict(self, state_dict):
        for k, v in state_dict:
            setattr(self, k, v)

    def to_dict(self):
        return self.state_dict()

    def load_from_file(self, path : typing.Union[str, os.PathLike], encoding='utf8'):
        if not os.path.isfile(path):
            raise FileNotFoundError(f"[Errno 2] No such file or directory: '{path}'")
        with open(path, 'r', encoding=encoding) as f:
            self.load_state_dict(json.load(f))

    def save_to_file(self, path : typing.Union[str, os.PathLike], encoding='utf8'):
        os.makedirs(os.path.dirname(os.path.abspath(path)))
        with open(path, 'w', encoding=encoding) as f:
            json.dump(self.state_dict(), f)


__all__ = ['Config']
