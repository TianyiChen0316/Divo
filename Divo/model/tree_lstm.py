import typing
from collections.abc import Iterable

import torch

from lib.torch import lora
from lib.torch.sequential_data import Sequence
from .base.lstm import MultiInputLSTM


class TreeLSTM(torch.nn.Module):
    def __init__(self, feature_size, input_size, output_size=1, squeeze=True):
        super().__init__()
        self.preprocess = torch.nn.Sequential(
            lora.LoRALinear(input_size, feature_size, bias=True),
            torch.nn.LayerNorm(feature_size),
            torch.nn.LeakyReLU(),
            lora.LoRALinear(feature_size, feature_size),
        )
        self.lstm = MultiInputLSTM(
            feature_size,
            feature_size,
            input_branches=2,
            output_branches=1,
        )
        self.tail = torch.nn.Sequential(
            lora.LoRALinear(feature_size, feature_size),
            torch.nn.LeakyReLU(),
            lora.LoRALinear(feature_size, output_size),
        )
        self.regression_tail = torch.nn.Sequential(
            lora.LoRALinear(feature_size, feature_size),
            torch.nn.LeakyReLU(),
            lora.LoRALinear(feature_size, output_size),
        )
        self._squeeze = squeeze

    def forward(self, seq : typing.Union[Sequence, typing.Iterable[Sequence]]):
        if not isinstance(seq, Sequence):
            if isinstance(seq, Iterable):
                seq = Sequence.concat(seq)
            else:
                raise TypeError(f"'{seq.__class__.__name__}' object is not a sequence")

        branches = [(seq['left_hidden'], seq['left_cell']), (seq['right_hidden'], seq['right_cell'])]
        input = seq['extra_input']
        normalized_input = self.preprocess(input)
        res_hidden, res_cell = self.lstm(branches, normalized_input)
        seq['node_hidden'], seq['node_cell'] = res_hidden, res_cell
        return seq

    def predict(self, embeddings):
        if not isinstance(embeddings, torch.Tensor):
            if isinstance(embeddings, Iterable):
                embeddings = torch.stack(tuple(embeddings), dim=0)
        res = self.tail(embeddings)
        if self._squeeze:
            res = res.squeeze(-1)
        return res, self.regression_tail(embeddings)
