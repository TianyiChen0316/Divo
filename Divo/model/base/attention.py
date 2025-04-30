import torch
import torch.nn as nn

from lib.torch import lora

from model.nn._models import RMSNorm, DeepNorm, MoeModule


class FeedForwardNetwork(nn.Module):
    def __init__(self, hidden_size, ffn_size, dropout_rate=None, lora_rank=0, lora_alpha=1.):
        super().__init__()

        self.layer1 = lora.LoRALinear(hidden_size, ffn_size, r=lora_rank, lora_alpha=lora_alpha)
        self.gelu = nn.GELU()
        self.layer2 = lora.LoRALinear(ffn_size, hidden_size, r=lora_rank, lora_alpha=lora_alpha)

    def forward(self, x):
        x = self.layer1(x)
        x = self.gelu(x)
        x = self.layer2(x)
        return x


class MultiHeadAttention(nn.Module):
    def __init__(self, hidden_size, attention_dropout_rate, head_size, lora_rank=0, lora_alpha=1.):
        super().__init__()

        self.head_size = head_size

        assert hidden_size % head_size == 0

        self.att_size = att_size = hidden_size // head_size
        self.scale = att_size ** -0.5

        self.linear_q = lora.LoRALinear(hidden_size, head_size * att_size, r=lora_rank, lora_alpha=lora_alpha)
        self.linear_k = lora.LoRALinear(hidden_size, head_size * att_size, r=lora_rank, lora_alpha=lora_alpha)
        self.linear_v = lora.LoRALinear(hidden_size, head_size * att_size, r=lora_rank, lora_alpha=lora_alpha)
        self.att_dropout = nn.Dropout(attention_dropout_rate)

        #self.output_layer = lora.LoRALinear(head_size * att_size, hidden_size, r=lora_rank)

    def forward(self, q, k, v, attn_bias=None):
        orig_q_size = q.size()

        d_k = self.att_size
        d_v = self.att_size
        batch_size = q.size(0)

        # head_i = Attention(Q(W^Q)_i, K(W^K)_i, V(W^V)_i)
        q = self.linear_q(q).view(batch_size, -1, self.head_size, d_k)
        k = self.linear_k(k).view(batch_size, -1, self.head_size, d_k)
        v = self.linear_v(v).view(batch_size, -1, self.head_size, d_v)

        q = q.transpose(1, 2)  # [b, h, q_len, d_k]
        v = v.transpose(1, 2)  # [b, h, v_len, d_v]
        k = k.transpose(1, 2).transpose(2, 3)  # [b, h, d_k, k_len]

        # Scaled Dot-Product Attention.
        # Attention(Q, K, V) = softmax((QK^T)/sqrt(d_k))V
        q = q * self.scale
        x = torch.matmul(q, k)  # [b, h, q_len, k_len]
        if attn_bias is not None:
            x = x + attn_bias

        x = torch.softmax(x, dim=3)
        x = self.att_dropout(x)
        x = x.matmul(v)  # [b, h, q_len, attn]

        x = x.transpose(1, 2).contiguous()  # [b, q_len, h, attn]
        x = x.view(batch_size, -1, self.head_size * d_v)

        #x = self.output_layer(x)

        #assert x.size() == orig_q_size
        return x


class TransformerEncoder(nn.Module):
    def __init__(
        self,
        hidden_size,
        ffn_size,
        dropout_rate,
        attention_dropout_rate,
        head_size,
        norm_pos='post',
        norm_type='layer',
        total_layers=None,
        lora_rank=0,
        lora_alpha=1.,
        moe_num_experts=None,
        moe_k=None,
        moe_exploration_mode='egreedy',
        moe_softmax_temperature=None,
        moe_weight_thres=0.1,
        moe_hidden_size=None,
        **kwargs,
    ):
        super().__init__()

        self.norm_type = norm_type
        if norm_type == 'rms':
            norm = lambda: RMSNorm(hidden_size)
        elif norm_type == 'deep' and norm_pos == 'post':
            norm = lambda x: DeepNorm(hidden_size, beta=x, encoder_layers=total_layers)
        else:
            norm = lambda: nn.LayerNorm(hidden_size)

        if norm_type == 'deep':
            self.self_attention_norm = norm(1.)
            self.ffn_norm = norm(None)
        else:
            self.self_attention_norm = norm()
            self.ffn_norm = norm()
        self.self_attention = MultiHeadAttention(hidden_size, attention_dropout_rate, head_size, lora_rank=lora_rank, lora_alpha=lora_alpha)
        self.self_attention_dropout = nn.Dropout(dropout_rate)

        self.norm_pos = norm_pos
        self.ffn_norm = nn.LayerNorm(hidden_size)
        self.ffn_dropout = nn.Dropout(dropout_rate)

        self._use_moe = moe_num_experts is not None and moe_k is not None
        if self._use_moe:
            def ffn_gen(index : int):
                return FeedForwardNetwork(
                    hidden_size,
                    ffn_size // (1 << index) if moe_hidden_size is None else moe_hidden_size[index],
                    dropout_rate,
                    lora_rank=lora_rank,
                    lora_alpha=lora_alpha,
                )
            #ffn_gen = lambda index: FeedForwardNetwork(hidden_size, ffn_size, dropout_rate, lora_rank=lora_rank, lora_alpha=lora_alpha)
            moe_kwargs = {}
            if moe_exploration_mode == 'egreedy':
                moe_kwargs['epsilon'] = kwargs.get('moe_epsilon', None)
            self.ffn_gate = torch.nn.Sequential(
                lora.LoRALinear(hidden_size, hidden_size, r=lora_rank, lora_alpha=lora_alpha),
                torch.nn.ReLU(),
            )
            self.ffn = MoeModule(
                gen=ffn_gen,
                gate_in_features=lambda: lora.LoRALinear(
                    hidden_size, moe_num_experts, r=lora_rank, lora_alpha=lora_alpha
                ),#hidden_size,
                num_experts=moe_num_experts,
                num_selected_experts=moe_k,
                exploration_mode=moe_exploration_mode,
                eps=1e-4,
                softmax_temperature=moe_softmax_temperature,
                weight_thres=moe_weight_thres,
                **moe_kwargs,
            )
        else:
            self.ffn_gate = torch.nn.Identity()
            self.ffn = FeedForwardNetwork(hidden_size, ffn_size, dropout_rate, lora_rank=lora_rank, lora_alpha=lora_alpha)

    def forward(self, x, attn_bias=None, dropout=True):
        y = self.self_attention(x, x, x, attn_bias)
        if dropout:
            y = self.self_attention_dropout(y)
        if self.norm_pos == 'pre':
            y = self.self_attention_norm(y)
            y = x + y
        else:
            if self.norm_type == 'deep':
                y = self.self_attention_norm(x, y)
            else:
                y = self.self_attention_norm(x + y)

        if self._use_moe:
            z = self.ffn(y, self.ffn_gate(y))
        else:
            z = self.ffn(y)

        z = self.ffn_dropout(z)
        if self.norm_pos == 'pre':
            z = self.ffn_norm(z)
            z = y + z
        else:
            if self.norm_type == 'deep':
                z = self.ffn_norm(y, z)
            else:
                z = self.ffn_norm(y + z)
        return z

    def _forward(self, x, attn_bias=None):
        y = self.self_attention_norm(x)
        y = self.self_attention(y, y, y, attn_bias)
        y = self.self_attention_dropout(y)
        x = x + y

        y = self.ffn_norm(x)
        y = self.ffn(y)
        y = self.ffn_dropout(y)
        x = x + y
        return