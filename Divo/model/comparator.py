import torch


class Comparator(torch.nn.Module):
    def __init__(
        self,
        num_classes,
        out_features=None,
        hidden_size=256,
        contract=1,
    ):
        super().__init__()
        self._num_classes = num_classes
        input_features = 2 * num_classes - 1
        if out_features is None:
            out_features = 2 * num_classes - 1

        self.head_mlps = torch.nn.ModuleList([
            *(torch.nn.Sequential(
                torch.nn.Linear(input_features, hidden_size),
                torch.nn.ReLU(),
                torch.nn.Linear(hidden_size, hidden_size),
                torch.nn.ReLU(),
            ) for i in range(3)),
        ])
        self.hidden_mlp = torch.nn.Sequential(
            torch.nn.Linear(hidden_size, hidden_size // contract),
            torch.nn.ReLU(),
            torch.nn.Linear(hidden_size // contract, hidden_size),
            torch.nn.ReLU(),
        )
        self.tail_mlp = torch.nn.Sequential(
            torch.nn.Linear(hidden_size, out_features),
        )

    def forward(self, input_left, input_right, input_extra):
        # input: [..., (2 * num_classes - 1) * 3]
        head = (self.head_mlps[0](input_left) + self.head_mlps[1](input_right) + self.head_mlps[2](input_extra)) / 3
        hidden = self.hidden_mlp(head)
        out = self.tail_mlp(head + hidden)
        return out
