from collections.abc import Iterable

import torch
from torch import nn
from torch.nn import functional as F

from lib.torch import Sequence, BatchedSequence, lora
from model.nn import ZScore

from .base.attention import TransformerEncoder
from .base.norm import SqrtZScore
from model.nn._models import TransposeBatchNorm1d, RMSNorm, DeepNorm


class Prediction(nn.Module):
    def __init__(
        self,
        in_feature=69,
        hid_units=256,
        out_dim=1,
        contract=1,
        mid_layers=True,
        res_con=True,
        lora_rank=0,
        lora_alpha=1.,
    ):
        super(Prediction, self).__init__()
        self.mid_layers = mid_layers
        self.res_con = res_con

        self.out_mlp1 = lora.LoRALinear(in_feature, hid_units, r=lora_rank, lora_alpha=lora_alpha)

        self.mid_mlp1 = lora.LoRALinear(hid_units, hid_units // contract, r=lora_rank, lora_alpha=lora_alpha)
        self.mid_mlp2 = lora.LoRALinear(hid_units // contract, hid_units, r=lora_rank, lora_alpha=lora_alpha)

        self.out_mlp2 = lora.LoRALinear(hid_units, out_dim, r=lora_rank, lora_alpha=lora_alpha)

    def forward(self, features):

        hid = F.relu(self.out_mlp1(features))
        if self.mid_layers:
            mid = F.relu(self.mid_mlp1(hid))
            mid = F.relu(self.mid_mlp2(mid))
            if self.res_con:
                hid = hid + mid
            else:
                hid = mid
        out = self.out_mlp2(hid)

        return out


class TransformerEncoderLayers(torch.nn.Module):
    def __init__(self, layers, tail=None, input_size=None, hidden_size=None):
        super().__init__()
        self.layers = torch.nn.ModuleList(layers)
        self.tail = tail
        if input_size is not None and hidden_size is not None:
            self.input_ffn = torch.nn.Sequential(
                torch.nn.Linear(input_size, hidden_size),
            )
            self.output_ffn = torch.nn.Sequential(
                torch.nn.Linear(hidden_size, input_size)
            )
        else:
            self.input_ffn = torch.nn.Identity()
            self.output_ffn = torch.nn.Identity()

    def forward(self, input, attn_bias, dropout=True):
        input = self.input_ffn(input)
        for index, enc_layer in enumerate(self.layers):
            input = enc_layer(input, attn_bias, dropout=dropout)
        if self.tail is not None:
            input = self.tail(input)
        input = self.output_ffn(input)
        return input


class PlanTransformer(nn.Module):
    def __init__(
        self,
        emb_size=128, hidden_size=96, head_size=8,
        dropout=0.1, attention_dropout_rate=0., n_layers=8,
        out_dim=1, norm_pos='pre', use_node_attrs=True,
        node_attr_norm_type='batch', norm_type='layer',
        index_info_size=4, lora_rank=0, lora_alpha=1.,
        moe_num_experts=None, moe_k=None,
        moe_exploration_mode='egreedy',
        moe_softmax_temperature=None,
        moe_weight_thres=None, moe_epsilon=None,
        moe_hidden_size=None,
    ):
        super().__init__()
        self.emb_size = emb_size
        self.hidden_dim = hidden_size
        self.head_size = head_size

        self.use_node_attrs = use_node_attrs

        ffn_dim = hidden_size * head_size

        self.rel_pos_encoder = lora.LoRAEmbedding(64, head_size, padding_idx=0, r=lora_rank, lora_alpha=lora_alpha)

        self.height_encoder = lora.LoRAEmbedding(64, self.hidden_dim, padding_idx=0, r=lora_rank, lora_alpha=lora_alpha)
        self.bushy_level_encoder = lora.LoRAEmbedding(8, self.hidden_dim, padding_idx=0, r=lora_rank, lora_alpha=lora_alpha)

        self.emb_to_hidden = nn.Sequential(
            lora.LoRALinear(self.emb_size, self.hidden_dim, r=lora_rank, lora_alpha=lora_alpha),
        )

        self.input_dropout = nn.Dropout(dropout)
        encoders = [
            TransformerEncoder(
                self.hidden_dim,
                ffn_dim,
                dropout,
                attention_dropout_rate,
                head_size,
                norm_pos=norm_pos,
                norm_type=norm_type,
                lora_rank=lora_rank,
                moe_num_experts=moe_num_experts,
                moe_k=moe_k,
                moe_exploration_mode=moe_exploration_mode,
                moe_softmax_temperature=moe_softmax_temperature,
                moe_epsilon=moe_epsilon,
                moe_weight_thres=moe_weight_thres,
                moe_hidden_size=moe_hidden_size,
            )
        for _ in range(n_layers)]
        #self.layers = nn.ModuleList(encoders)

        #self.final_ln = nn.LayerNorm(self.hidden_dim)

        #lambda_layer_hidden_dim = lambda index: max(128, self.hidden_dim >> (3 * index))
        lambda_layer_hidden_dim = lambda index: max(min(self.hidden_dim, 256), self.hidden_dim >> (2 * index))
        self.encoder_layers = torch.nn.ModuleList(
            ((lambda: TransformerEncoderLayers(
                [
                    TransformerEncoder(
                        lambda_layer_hidden_dim(encoder_layer_index),#self.hidden_dim,
                        ffn_dim,
                        dropout,
                        attention_dropout_rate,
                        head_size,
                        norm_pos=norm_pos,
                        norm_type=norm_type,
                        lora_rank=lora_rank if encoder_layer_index == 0 else 0,
                        moe_num_experts=moe_num_experts,
                        moe_k=moe_k,
                        moe_exploration_mode=moe_exploration_mode,
                        moe_softmax_temperature=moe_softmax_temperature,
                        moe_epsilon=moe_epsilon,
                        moe_weight_thres=moe_weight_thres,
                        moe_hidden_size=moe_hidden_size,
                    )
                    for _ in range(n_layers)
                ],
                torch.nn.LayerNorm(lambda_layer_hidden_dim(encoder_layer_index)),
                input_size=None if encoder_layer_index == 0 else self.hidden_dim,
                hidden_size=None if encoder_layer_index == 0 else lambda_layer_hidden_dim(encoder_layer_index),
            ))() for encoder_layer_index in range(2)),
        )
        self.encoder_weight = 0.1

        self.node_type_embedding = lora.LoRAEmbedding(64, self.hidden_dim, padding_idx=0, r=lora_rank, lora_alpha=lora_alpha)

        self.node_attr_norm_type = node_attr_norm_type
        if node_attr_norm_type == 'layer':
            norm = lambda: torch.nn.LayerNorm(self.hidden_dim)
        elif node_attr_norm_type == 'batch':
            norm = lambda: TransposeBatchNorm1d(self.hidden_dim)
        elif node_attr_norm_type == 'rms':
            norm = lambda: RMSNorm(self.hidden_dim)
        else:
            # node_attr_norm_type == 'none'
            norm = lambda: torch.nn.Sequential()

        self.node_attr_zscore = ZScore(num_features=3)
        self.node_attr_preprocess = torch.nn.Sequential(
            lora.LoRALinear(10, self.hidden_dim, bias=True, r=lora_rank, lora_alpha=lora_alpha),
            norm(),
            torch.nn.LeakyReLU(),
            lora.LoRALinear(self.hidden_dim, self.hidden_dim, r=lora_rank, lora_alpha=lora_alpha),
        )

        self.index_info_preprocess = torch.nn.Sequential(
            lora.LoRALinear(index_info_size, self.hidden_dim, bias=False, r=lora_rank, lora_alpha=lora_alpha),
            norm(),
            torch.nn.LeakyReLU(),
            lora.LoRALinear(self.hidden_dim, self.hidden_dim, r=lora_rank, lora_alpha=lora_alpha),
        )

        self.out_dim = out_dim
        self.tail = Prediction(self.hidden_dim, self.hidden_dim, out_dim, lora_rank=lora_rank, lora_alpha=lora_alpha)
        self.regression_tail = Prediction(self.hidden_dim, self.hidden_dim, 1, lora_rank=lora_rank, lora_alpha=lora_alpha)

    def switch_mode(self, weight):
        self.encoder_weight = weight

    @property
    def node_attr_norm_training(self):
        if self.node_attr_norm_type == 'batch':
            return self.node_attr_preprocess[1].bn_training
        return None

    @node_attr_norm_training.setter
    def node_attr_norm_training(self, value):
        if self.node_attr_norm_type == 'batch':
            self.node_attr_preprocess[1].bn_training = value

    def forward(self, batch_plan : BatchedSequence, dropout=True, use_tail=True, input_detach=False):
        not_batched = isinstance(batch_plan, Sequence)
        if not_batched:
            batch_plan = BatchedSequence([batch_plan])
        elif not isinstance(batch_plan, BatchedSequence):
            if isinstance(batch_plan, Iterable):
                # try to batch the sequences
                batch_plan = BatchedSequence(batch_plan)
            else:
                raise TypeError(f"'{batch_plan.__class__.__name__}' object is not batched plans")

        x = batch_plan['embedding']

        if input_detach:
            x = x.detach()

        node_type_enc = batch_plan['node_type']
        heights = batch_plan['height']
        bushy_level = batch_plan['bushy_level']
        index_infos = batch_plan['index_info'].to(torch.float)

        ###
        #bushy_level = bushy_level.new_zeros(*bushy_level.shape)
        ###

        attn_bias = batch_plan.attention['adjacency_matrix'].transpose(1, 2)
        rel_pos = batch_plan.attention['distance'].transpose(1, 2)

        node_attr = batch_plan['node_attr']
        if self.use_node_attrs:
            zscore_node_attr = self.node_attr_zscore(node_attr[..., :3].transpose(-1, -2)).transpose(-1, -2)
            node_attr = torch.cat([zscore_node_attr, node_attr[..., 3:]], dim=-1)
        else:
            node_attr = torch.zeros_like(node_attr, dtype=node_attr.dtype, device=node_attr.device)
        node_attr_mask = batch_plan['node_attr_mask']
        node_attr = self.node_attr_preprocess(node_attr) * node_attr_mask.unsqueeze(-1)

        index_infos = self.index_info_preprocess(index_infos)

        # num_batches * head_size * sequence_length * sequence_length
        tree_attn_bias = attn_bias.log().unsqueeze(1).repeat(1, self.head_size, 1, 1)

        # num_batches * head_size * sequence_length * sequence_length
        rel_pos_bias = self.rel_pos_encoder(rel_pos).permute(0, 3, 1, 2)
        tree_attn_bias = tree_attn_bias + rel_pos_bias

        node_feature = self.emb_to_hidden(x)
        node_feature = node_feature + node_attr + index_infos + \
                       self.height_encoder(heights) + self.node_type_embedding(node_type_enc) + \
                       self.bushy_level_encoder(bushy_level)

        # transformer encoder
        output = self.input_dropout(node_feature)

        """
        for index, enc_layer in enumerate(self.layers):
            if index == 0:
                output = enc_layer(output, tree_attn_bias, dropout=dropout)
            else:
                output = enc_layer(output, tree_attn_bias, dropout=dropout)
        output = self.final_ln(output)
        """
        if self.encoder_weight == 0.:
            output = self.encoder_layers[0](output, tree_attn_bias, dropout=dropout)
        elif self.encoder_weight == 1.:
            output = self.encoder_layers[1](output, tree_attn_bias, dropout=dropout)
        else:
            output0 = self.encoder_layers[0](output, tree_attn_bias, dropout=dropout)
            output1 = self.encoder_layers[1](output, tree_attn_bias, dropout=dropout)
            output = (1 - self.encoder_weight) * output0 + self.encoder_weight * output1

        res = output[:, 0, :]

        if not_batched:
            res = res.squeeze(0)

        return res, self.tail(res), self.regression_tail(res)

        if use_tail == 'detail':
            return res, self.tail(res)

        if use_tail:
            res = self.tail(res)

        return res

