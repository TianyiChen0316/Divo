import math
import typing

import torch
import torch.nn as nn

from third_party import loralib

from lib.syntax import Interface, interfacemethod
from lib.tools.interfaces import StateDictInterface

def lora_state_dict(model : typing.Union[dict, StateDictInterface], bias: str = 'none') -> typing.Dict[str, torch.Tensor]:
    my_state_dict = model if isinstance(model, dict) else model.state_dict()
    if bias == 'none':
        return {k: my_state_dict[k] for k in my_state_dict if 'lora_' in k}
    elif bias == 'all':
        return {k: my_state_dict[k] for k in my_state_dict if 'lora_' in k or 'bias' in k}
    elif bias == 'lora_only':
        to_return = {}
        for k in my_state_dict:
            if 'lora_' in k:
                to_return[k] = my_state_dict[k]
                bias_name = k.split('lora_')[0]+'bias'
                if bias_name in my_state_dict:
                    to_return[bias_name] = my_state_dict[bias_name]
        return to_return
    else:
        raise NotImplementedError


class LoRAInterface(Interface):
    @interfacemethod
    def train_lora(self, mode: bool = True, merge: bool = True):
        raise NotImplementedError

    @interfacemethod
    def set_rank(self, r: int, merge: bool = False):
        raise NotImplementedError

    @interfacemethod
    def clear_weight(self):
        raise NotImplementedError


class LoRAEmbedding(loralib.Embedding):
    def __init__(self, *args, **kwargs):
        kwargs['merge_weights'] = False
        super().__init__(*args, **kwargs)

    def train_lora(self, mode: bool = True, merge: bool = True):
        if not hasattr(self, 'lora_A'):
            return
        if merge:
            self.weight.data += (self.lora_B @ self.lora_A).transpose(0, 1) * self.scaling
            nn.init.zeros_(self.lora_A)
            nn.init.normal_(self.lora_B)
        if mode:
            self.lora_A.requires_grad_(True)
            self.lora_B.requires_grad_(True)
            self.weight.requires_grad_(False)
        else:
            self.lora_A.requires_grad_(False)
            self.lora_B.requires_grad_(False)
            self.weight.requires_grad_(True)

    def load_state_dict(self, state_dict: typing.Mapping[str, typing.Any],
                        strict: bool = True, assign: bool = False):
        if 'lora_A' in state_dict:
            parameter_rank = state_dict['lora_A'].shape[0]
            if not strict and self.r != parameter_rank:
                if 'lora_B' not in state_dict:
                    raise RuntimeError('parameters of lora_B is missing')
                additional_weight = (state_dict['lora_B'] @ state_dict['lora_A']).transpose(0, 1) * self.scaling
                new_state_dict = dict(state_dict)
                if 'weight' in new_state_dict:
                    new_state_dict['weight'] = new_state_dict['weight'] + additional_weight
                else:
                    new_state_dict['weight'] = additional_weight
                new_state_dict.pop('lora_A')
                new_state_dict.pop('lora_B')
                nn.init.zeros_(self.lora_A)
                nn.init.normal_(self.lora_B)
                state_dict = new_state_dict
        return super().load_state_dict(state_dict, strict, assign)


    def set_rank(self, r: int, merge: bool = False):
        if r <= 0:
            raise RuntimeError(f'the LoRA rank should be greater than 0')
        _requires_grad = self.lora_A.requires_grad if hasattr(self, 'lora_A') else not self.weight.requires_grad
        self.r = r
        self.lora_A = nn.Parameter(self.weight.new_zeros((r, self.num_embeddings)))
        self.lora_B = nn.Parameter(self.weight.new_zeros((self.embedding_dim, r)))
        nn.init.zeros_(self.lora_A)
        nn.init.normal_(self.lora_B)
        self.scaling = self.lora_alpha / self.r
        self.lora_A.requires_grad_(_requires_grad)
        self.lora_B.requires_grad_(_requires_grad)

    def clear_weight(self):
        nn.init.zeros_(self.weight)
        nn.init.normal_(self.lora_A)
        nn.init.normal_(self.lora_B)


class LoRALinear(loralib.Linear):
    def __init__(self, *args, **kwargs):
        kwargs['merge_weights'] = False
        super().__init__(*args, **kwargs)

    def train_lora(self, mode: bool = True, merge: bool = True):
        if not hasattr(self, 'lora_A'):
            return
        if merge:
            def T(w):
                return w.transpose(0, 1) if self.fan_in_fan_out else w

            self.weight.data += T(self.lora_B @ self.lora_A) * self.scaling
            nn.init.kaiming_uniform_(self.lora_A, a=math.sqrt(5))
            nn.init.zeros_(self.lora_B)
        if mode:
            self.lora_A.requires_grad_(True)
            self.lora_B.requires_grad_(True)
            self.weight.requires_grad_(False)
        else:
            self.lora_A.requires_grad_(False)
            self.lora_B.requires_grad_(False)
            self.weight.requires_grad_(True)

    def load_state_dict(self, state_dict: typing.Mapping[str, typing.Any],
                        strict: bool = True, assign: bool = False):
        if 'lora_A' in state_dict:
            parameter_rank = state_dict['lora_A'].shape[0]
            if not strict and self.r != parameter_rank:
                if 'lora_B' not in state_dict:
                    raise RuntimeError('parameters of lora_B is missing')
                def T(w):
                    return w.transpose(0, 1) if self.fan_in_fan_out else w
                additional_weight = T(state_dict['lora_B'] @ state_dict['lora_A']) * self.scaling
                new_state_dict = dict(state_dict)
                if 'weight' in new_state_dict:
                    new_state_dict['weight'] = new_state_dict['weight'] + additional_weight
                else:
                    new_state_dict['weight'] = additional_weight
                new_state_dict.pop('lora_A')
                new_state_dict.pop('lora_B')
                nn.init.kaiming_uniform_(self.lora_A, a=math.sqrt(5))
                nn.init.zeros_(self.lora_B)
                state_dict = new_state_dict
        return super().load_state_dict(state_dict, strict, assign)

    def set_rank(self, r: int, merge: bool = False):
        if r <= 0:
            raise RuntimeError(f'the LoRA rank should be greater than 0')
        _requires_grad = self.lora_A.requires_grad if hasattr(self, 'lora_A') else not self.weight.requires_grad
        self.r = r
        self.lora_A = nn.Parameter(self.weight.new_zeros((r, self.in_features)))
        self.lora_B = nn.Parameter(self.weight.new_zeros((self.out_features, r)))
        nn.init.kaiming_uniform_(self.lora_A, a=math.sqrt(5))
        nn.init.zeros_(self.lora_B)
        self.scaling = self.lora_alpha / self.r
        self.lora_A.requires_grad_(_requires_grad)
        self.lora_B.requires_grad_(_requires_grad)

    def clear_weight(self):
        nn.init.zeros_(self.weight)
        nn.init.kaiming_uniform_(self.lora_A, a=math.sqrt(5))
        nn.init.normal_(self.lora_B)


def set_lora_training(model: nn.Module, mode: bool = True, merge: bool = True):
    for m in model.modules():
        if isinstance(m, LoRAInterface):
            m.train_lora(mode, merge)
    return model

def set_lora_alpha(model: nn.Module, lora_alpha: float):
    # the parameters should be merged before setting a new alpha
    for m in model.modules():
        if isinstance(m, LoRAInterface):
            m.lora_alpha = lora_alpha
    return model

def set_lora_rank(model: nn.Module, r: int, merge: bool = False):
    for m in model.modules():
        if isinstance(m, LoRAInterface):
            m.set_rank(r, merge)
    return model

def lora_clear_weight(model: nn.Module):
    for m in model.modules():
        if isinstance(m, LoRAInterface):
            m.clear_weight()


__all__ = [
    'lora_state_dict', 'LoRALinear', 'LoRAEmbedding',
    'set_lora_training', 'set_lora_alpha', 'set_lora_rank', 'lora_clear_weight',
]
