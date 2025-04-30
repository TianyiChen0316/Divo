import typing

import torch
import torch.nn.functional as F


class AdditionalEmbedding(torch.nn.Module):
    def __init__(
        self,
        num_embeddings: int,
        embedding_dim: int,
        rank: int = None,
        padding_idx = None,
        max_norm: typing.Optional[float] = None,
        norm_type: float = 2.,
        scale_grad_by_freq: bool = False,
        sparse: bool = False,
        dropout: typing.Optional[float] = None,
        lora_alpha: float = 1.,
        enable: bool = False,
        device=None, dtype=None,
    ):
        super().__init__()
        #if rank <= 0:
        #    raise ValueError(f'LoRA rank should be greater than 0')

        self.num_embeddings = num_embeddings
        self.embedding_dim = embedding_dim
        if padding_idx is not None:
            if padding_idx > 0:
                assert padding_idx < self.num_embeddings, 'Padding_idx must be within num_embeddings'
            elif padding_idx < 0:
                assert padding_idx >= -self.num_embeddings, 'Padding_idx must be within num_embeddings'
                padding_idx = self.num_embeddings + padding_idx
        self.padding_idx = padding_idx
        self.max_norm = max_norm
        self.norm_type = norm_type
        self.scale_grad_by_freq = scale_grad_by_freq
        self.sparse = sparse
        self.dropout = dropout

        self.lora_alpha = lora_alpha
        self.rank = rank
        if rank is None:
            self.scaling = None
            self.A = torch.nn.Parameter(torch.empty((num_embeddings, embedding_dim), device=device, dtype=dtype))
            self.B = None
        else:
            self.scaling = self.lora_alpha / self.rank
            self.A = torch.nn.Parameter(torch.empty((num_embeddings, rank), device=device, dtype=dtype))
            self.B = torch.nn.Parameter(torch.empty((rank, embedding_dim), device=device, dtype=dtype))

        self._enable = enable

        self.reset_parameters()

    def enable(self, mode: bool = True):
        self._enable = mode

    def disable(self):
        return self.enable(False)

    def reset_parameters(self):
        if self.B is None:
            torch.nn.init.normal_(self.A)
            if self.padding_idx is not None:
                with torch.no_grad():
                    self.A[self.padding_idx].fill_(0)
        else:
            torch.nn.init.zeros_(self.A)
            torch.nn.init.normal_(self.B)

    def forward(self, x: torch.Tensor):
        if not self._enable:
            result = self.A.new_zeros((*x.shape, self.B.shape[-1] if self.B is not None else self.A.shape[-1]))
        else:
            if self.dropout:
                # dropout the whole embedding but not scaling
                mask = F.dropout(torch.zeros_like(x, dtype=torch.float) + 1, p=self.dropout, training=self.training).to(bool)
                x = x * mask
            result = F.embedding(
                x, self.A, self.padding_idx, self.max_norm,
                self.norm_type, self.scale_grad_by_freq, self.sparse
            )
            if self.B is not None:
                result = (result @ self.B) * self.scaling
        return result

    def export_embeddings(
        self,
        other_embeddings: typing.Optional[typing.Union[torch.nn.Embedding, torch.Tensor]] = None,
        num_embeddings: typing.Optional[int] = None,
        mapping: typing.Optional[torch.Tensor] = None,
    ):
        if num_embeddings is None:
            num_embeddings = self.num_embeddings

        if other_embeddings is None:
            if self.B is None:
                additional_embeddings = self.A.detach()
            else:
                additional_embeddings = self.A.detach() @ self.B.detach()
            return additional_embeddings[:num_embeddings]

        if not isinstance(other_embeddings, torch.Tensor):
            if not hasattr(other_embeddings, 'weight'):
                raise TypeError(f"'{other_embeddings.__class__.__name__}' object is not a tensor")
            other_embeddings : torch.Tensor = other_embeddings.weight
            if not isinstance(other_embeddings, torch.Tensor):
                raise TypeError(f"'{other_embeddings.__class__.__name__}' object is not a tensor")
        # other_embeddings: [N, embedding_dim]
        if other_embeddings.ndim != 2:
            raise ValueError(f"invalid embedding shape [{', '.join(map(str, other_embeddings.shape))}]")
        if other_embeddings.shape[1] != self.embedding_dim:
            raise ValueError(f"shape mismatch")

        # additional_embeddings: [self.num_embeddings, self.embedding_dim]
        if self.B is None:
            additional_embeddings = self.A.detach()
        else:
            additional_embeddings = self.A.detach() @ self.B.detach()

        if mapping is not None:
            if mapping.dtype.is_floating_point or mapping.dtype.is_complex:
                raise TypeError(f"the mapping is not integer: {mapping.dtype}")
            if mapping.ndim != 1:
                raise ValueError(f"invalid mapping shape [{', '.join(map(str, mapping.shape))}]")
            if mapping.shape[0] < num_embeddings:
                mapping = torch.cat([
                    mapping,
                    torch.tensor(
                        list(range(num_embeddings - mapping.shape[0], num_embeddings)),
                        dtype=mapping.dtype,
                        device=mapping.device,
                    )
                ], dim=0)
            elif mapping.shape[0] > num_embeddings:
                mapping = mapping[:num_embeddings]
            other_embeddings = other_embeddings[mapping]

        result = other_embeddings + additional_embeddings
        return result

    def export_embeddings_with_criteria(
        self,
        criterion_embeddings: typing.Union[torch.nn.Embedding, torch.Tensor],
        new_embeddings_mask: torch.Tensor,
        classes: torch.Tensor,
        num_embeddings: typing.Optional[int] = None,
        dist_norm_type: typing.Optional[typing.Union[float, str]] = "fro",
        dist_topk: int = 3,
    ):
        if num_embeddings is None:
            num_embeddings = self.num_embeddings

        if not isinstance(criterion_embeddings, torch.Tensor):
            if not hasattr(criterion_embeddings, 'weight'):
                raise TypeError(f"'{criterion_embeddings.__class__.__name__}' object is not a tensor")
            criterion_embeddings : torch.Tensor = criterion_embeddings.weight
            if not isinstance(criterion_embeddings, torch.Tensor):
                raise TypeError(f"'{criterion_embeddings.__class__.__name__}' object is not a tensor")
        # criterion_embeddings: [num_embeddings, X]
        if criterion_embeddings.ndim != 2:
            raise ValueError(f"invalid embedding shape [{', '.join(map(str, criterion_embeddings.shape))}]")
        if criterion_embeddings.shape[0] != num_embeddings:
            raise ValueError(f"shape mismatch")

        if new_embeddings_mask.ndim != 1:
            raise ValueError(f"invalid mask shape [{', '.join(map(str, new_embeddings_mask.shape))}]")
        if new_embeddings_mask.shape[0] < num_embeddings:
            new_embeddings_mask = torch.cat([
                new_embeddings_mask,
                new_embeddings_mask.new_zeros(num_embeddings - new_embeddings_mask.shape[0]),
            ], dim=0)
        elif new_embeddings_mask.shape[0] > num_embeddings:
            new_embeddings_mask = new_embeddings_mask[:num_embeddings]
        old_embeddings_mask = ~new_embeddings_mask

        # additional_embeddings: [self.num_embeddings, self.embedding_dim]
        if self.B is None:
            additional_embeddings = self.A.detach()
        else:
            additional_embeddings = self.A.detach() @ self.B.detach()
        additional_embeddings = additional_embeddings[:num_embeddings]

        if classes.dtype.is_floating_point or classes.dtype.is_complex:
            raise TypeError(f"the mapping is not integer: {classes.dtype}")
        if classes.ndim != 1:
            raise ValueError(f"invalid shape [{', '.join(map(str, classes.shape))}]")

        if classes.shape[0] < num_embeddings:
            classes = torch.cat([
                classes,
                torch.tensor(
                    list(range(num_embeddings - classes.shape[0], num_embeddings)),
                    dtype=classes.dtype,
                    device=classes.device,
                )
            ], dim=0)
        elif classes.shape[0] > num_embeddings:
            classes = classes[:num_embeddings]

        mapping_types, inverse_indices, counts = torch.unique(classes, return_inverse=True, return_counts=True)
        results = additional_embeddings.clone().detach()
        for typ in mapping_types:
            class_mask = classes == typ
            old_embs_mask, new_embs_mask = old_embeddings_mask & class_mask, new_embeddings_mask & class_mask

            if old_embs_mask.sum() == 0:
                # no old embs
                # raise RuntimeError(f"no old embeddings for class {typ}")
                continue
            if new_embs_mask.sum() == 0:
                # no new embs
                continue

            old_criteria, new_criteria = criterion_embeddings[old_embs_mask], criterion_embeddings[new_embs_mask]
            # dist: [num_old, num_new]
            dist = torch.norm(old_criteria.unsqueeze(1) - new_criteria.unsqueeze(0), dist_norm_type, dim=-1)
            topk_indices = torch.topk(dist, min(dist_topk, dist.shape[0]), dim=0, largest=False).indices

            used_embs = additional_embeddings[old_embs_mask][topk_indices]
            # [num_new, self.embedding_dim]
            new_embs = used_embs.mean(dim=0, keepdim=False)
            results[new_embs_mask] = new_embs
        return results
