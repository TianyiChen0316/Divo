import math
import bisect
import random
import operator
import inspect
from collections.abc import Sequence as _Sequence
from itertools import accumulate as _accumulate, repeat as _repeat

import numpy as np


class Randomizer:
    """A randomizer class that provide functions of saving and loading state dicts."""

    def __init__(self, seed):
        self._seed = seed
        self._randomizer = random.Random(seed)

    @property
    def seed(self):
        return self._seed

    @seed.setter
    def seed(self, value):
        self._seed = value
        self.reset()

    def reset(self):
        self._randomizer.seed(self._seed)

    def getrandbits(self, k):
        return self._randomizer.getrandbits(k)

    def random(self):
        return self._randomizer.random()

    def randrange(self, start, stop=None, step=1):
        return self._randomizer.randrange(start, stop, step)

    def randint(self, a, b):
        return self._randomizer.randint(a, b)

    def randbytes(self, n):
        if hasattr(self._randomizer, 'randbytes'):
            return self._randomizer.randbytes(n)
        return self.getrandbits(n * 8).to_bytes(n, 'little')

    def choice(self, seq):
        return self._randomizer.choice(seq)

    def shuffle(self, x):
        return self._randomizer.shuffle(x)

    def sample(self, population, k, *, counts=None):
        if counts is None:
            return self._randomizer.sample(population, k)
        spec = inspect.getfullargspec(self._randomizer.sample)
        if 'counts' in spec.args + spec.kwonlyargs:
            return self._randomizer.sample(population, k, counts=counts)
        if not isinstance(population, _Sequence):
            raise TypeError("Population must be a sequence.  "
                            "For dicts or sets, use sorted(d).")
        n = len(population)
        cum_counts = list(_accumulate(counts))
        if len(cum_counts) != n:
            raise ValueError('The number of counts does not match the population')
        total = cum_counts.pop() if cum_counts else 0
        if not isinstance(total, int):
            raise TypeError('Counts must be integers')
        if total < 0:
            raise ValueError('Counts must be non-negative')
        selections = self.sample(range(total), k=k)
        return [population[bisect.bisect(cum_counts, s)] for s in selections]

    def choices(self, population, weights=None, *, cum_weights=None, k=1):
        if hasattr(self._randomizer, 'choices'):
            return self._randomizer.choices(population, weights, cum_weights=cum_weights, k=k)
        n = len(population)
        if cum_weights is None:
            if weights is None:
                n += 0.0  # convert to float for a small speed improvement
                return [population[math.floor(self.random() * n)] for i in _repeat(None, k)]
            try:
                cum_weights = list(_accumulate(weights))
            except TypeError:
                if not isinstance(weights, int):
                    raise
                k = weights
                raise TypeError(
                    f'The number of choices must be a keyword argument: {k=}'
                ) from None
        elif weights is not None:
            raise TypeError('Cannot specify both weights and cumulative weights')
        if len(cum_weights) != n:
            raise ValueError('The number of weights does not match the population')
        total = cum_weights[-1] + 0.0  # convert to float
        if total <= 0.0:
            raise ValueError('Total of weights must be greater than zero')
        if not math.isfinite(total):
            raise ValueError('Total of weights must be finite')
        hi = n - 1
        return [population[bisect.bisect(cum_weights, self.random() * total, 0, hi)]
                for i in _repeat(None, k)]

    def uniform(self, a, b):
        return self._randomizer.uniform(a, b)

    def triangular(self, low=0.0, high=1.0, mode=None):
        return self._randomizer.triangular(low, high, mode)

    def normalvariate(self, mu=0.0, sigma=1.0):
        return self._randomizer.normalvariate(mu, sigma)

    def gauss(self, mu=0.0, sigma=1.0):
        return self._randomizer.gauss(mu, sigma)

    def lognormvariate(self, mu=0.0, sigma=1.0):
        return self._randomizer.lognormvariate(mu, sigma)

    def expovariate(self, lambd=1.0):
        return self._randomizer.expovariate(lambd)

    def vonmisesvariate(self, mu, kappa):
        return self._randomizer.vonmisesvariate(mu, kappa)

    def gammavariate(self, alpha, beta):
        return self._randomizer.gammavariate(alpha, beta)

    def betavariate(self, alpha, beta):
        return self._randomizer.betavariate(alpha, beta)

    def paretovariate(self, alpha):
        return self._randomizer.paretovariate(alpha)

    def weibullvariate(self, alpha, beta):
        return self._randomizer.weibullvariate(alpha, beta)

    def binomialvariate(self, n=1, p=0.5):
        if hasattr(self._randomizer, 'binomialvariate'):
            return self._randomizer.binomialvariate(n, p)
        if n < 0:
            raise ValueError("n must be non-negative")
        if p <= 0.0 or p >= 1.0:
            if p == 0.0:
                return 0
            if p == 1.0:
                return n
            raise ValueError("p must be in the range 0.0 <= p <= 1.0")

        random = self.random

        # Fast path for a common case
        if n == 1:
            return operator.index(random() < p)

        # Exploit symmetry to establish:  p <= 0.5
        if p > 0.5:
            return n - self.binomialvariate(n, 1.0 - p)

        if n * p < 10.0:
            # BG: Geometric method by Devroye with running time of O(np).
            # https://dl.acm.org/doi/pdf/10.1145/42372.42381
            x = y = 0
            c = math.log2(1.0 - p)
            if not c:
                return x
            while True:
                y += math.floor(math.log2(random()) / c) + 1
                if y > n:
                    return x
                x += 1

        # BTRS: Transformed rejection with squeeze method by Wolfgang Hörmann
        # https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.47.8407&rep=rep1&type=pdf
        assert n * p >= 10.0 and p <= 0.5
        setup_complete = False

        spq = math.sqrt(n * p * (1.0 - p))  # Standard deviation of the distribution
        b = 1.15 + 2.53 * spq
        a = -0.0873 + 0.0248 * b + 0.01 * p
        c = n * p + 0.5
        vr = 0.92 - 4.2 / b

        while True:

            u = random()
            u -= 0.5
            us = 0.5 - math.fabs(u)
            k = math.floor((2.0 * a / us + b) * u + c)
            if k < 0 or k > n:
                continue

            # The early-out "squeeze" test substantially reduces
            # the number of acceptance condition evaluations.
            v = random()
            if us >= 0.07 and v <= vr:
                return k

            # Acceptance-rejection test.
            # Note, the original paper erroneously omits the call to log(v)
            # when comparing to the log of the rescaled binomial distribution.
            if not setup_complete:
                alpha = (2.83 + 5.1 / b) * spq
                lpq = math.log(p / (1.0 - p))
                m = math.floor((n + 1) * p)  # Mode of the distribution
                h = math.lgamma(m + 1) + math.lgamma(n - m + 1)
                setup_complete = True  # Only needs to be done once
            v *= alpha / (a / (us * us) + b)
            if math.log(v) <= h - math.lgamma(k + 1) - math.lgamma(n - k + 1) + (k - m) * lpq:
                return k

    def choice_counts(self, k, weights=None, *, cum_weights=None):
        if cum_weights is None:
            if weights is None:
                raise TypeError('Either weights or cumulative weights should be specified')
            cum_weights = list(_accumulate(weights))
        elif weights is not None:
            raise TypeError('Cannot specify both weights and cumulative weights')
        total = cum_weights[-1] + 0.0  # convert to float
        if total <= 0.0:
            raise ValueError('Total of weights must be greater than zero')
        if not math.isfinite(total):
            raise ValueError('Total of weights must be finite')
        cum_weights = [x / total for x in [0., *cum_weights]]
        total_samples = k
        res = []
        for cum_prob, prev_cum_prob in zip(cum_weights[1:], cum_weights[:-1]):
            if total_samples <= 0:
                res.append(0)
                continue
            prob = cum_prob - prev_cum_prob
            if prob <= 0.:
                res.append(0)
            else:
                current_prob = prob / (1 - prev_cum_prob)
                sampled = self.binomialvariate(total_samples, current_prob)
                total_samples = total_samples - sampled
                res.append(sampled)
        return res

    def state_dict(self):
        return {
            'seed': self._seed,
            'random_state': self._randomizer.getstate(),
        }

    def load_state_dict(self, state_dict):
        if 'seed' in state_dict:
            self._seed = state_dict['seed']
        if 'random_state' in state_dict:
            self._randomizer.setstate(state_dict['random_state'])


def choice_counts(k, weights=None, *, cum_weights=None):
    if cum_weights is None:
        if weights is None:
            raise TypeError('Either weights or cumulative weights should be specified')
        cum_weights = list(_accumulate(weights))
    elif weights is not None:
        raise TypeError('Cannot specify both weights and cumulative weights')
    total = cum_weights[-1] + 0.0   # convert to float
    if total <= 0.0:
        raise ValueError('Total of weights must be greater than zero')
    if not math.isfinite(total):
        raise ValueError('Total of weights must be finite')
    cum_weights = np.array([0., *cum_weights])
    cum_weights = cum_weights / total
    total_samples = k
    res = []
    for cum_prob, prev_cum_prob in zip(cum_weights[1:], cum_weights[:-1]):
        if total_samples <= 0:
            res.append(0)
            continue
        prob = cum_prob - prev_cum_prob
        if prob <= 0.:
            res.append(0)
        else:
            current_prob = prob / (1 - prev_cum_prob)
            sampled = np.random.binomial(total_samples, current_prob)
            total_samples = total_samples - sampled
            res.append(sampled)
    return res


__all__ = ['Randomizer', 'choice_counts']
