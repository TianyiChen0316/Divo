import bisect
import time
from queue import PriorityQueue, Full
from collections.abc import Sequence
from collections import Counter
from functools import total_ordering

import math
import numpy as np

from lib.syntax import Interface, abstractmethod
from lib.tools import Randomizer
from lib.tools.randomizer import Randomizer, choice_counts


class RoundRobinQueue(Sequence):
    def __init__(self, capacity=None):
        self._capacity = capacity
        self.clear()

    def state_dict(self):
        return {
            'data': self._data,
            'capacity': self._capacity,
            'pointer': self._p,
        }

    def load_state_dict(self, state_dict, load_config=False):
        if 'data' in state_dict:
            self._data = state_dict['data']
        if load_config:
            if 'pointer' in state_dict:
                self._p = state_dict['pointer']
            if 'capacity' in state_dict:
                self._capacity = state_dict['capacity']
        else:
            if 'capacity' in state_dict:
                if self._capacity is not None:
                    if state_dict['capacity'] is None:
                        self._data = self._data[:self._capacity]
                        self._p = 0
                    else:
                        diff = self._capacity - state_dict['capacity']
                        if diff > 0:
                            self._p = 0
                        else:
                            if diff < 0:
                                self._data = self._data[:diff]
                            if 'pointer' in state_dict:
                                self._p = state_dict['pointer']
            elif 'pointer' in state_dict:
                self._p = state_dict['pointer']
        return self

    def remove_duplicates(self, key=None):
        data = {}
        old_data = self._data[self._p:] + self._data[:self._p]
        if callable(key):
            for value in old_data:
                data[key(value)] = value
        else:
            for value in old_data:
                data[value] = value
        self._data = list(data.values())
        self._p = 0
        return self

    def clear(self):
        self._data = []
        self._p = 0
        return self

    def push(self, value):
        prev_value = None
        if self._capacity is None or len(self._data) < self._capacity:
            self._data.append(value)
        else:
            if self._p >= len(self._data):
                self._p = 0
            prev_value = self._data[self._p]
            self._data[self._p] = value
            self._p += 1
        return prev_value

    def append(self, value):
        return self.push(value)

    def __getitem__(self, item):
        return self._data[item]

    def __contains__(self, item):
        return item in self._data

    def __iter__(self):
        return iter(self._data)

    def __len__(self):
        return len(self._data)

    def __bool__(self):
        return bool(self._data)


class Memory(Interface):
    @abstractmethod
    def load_state_dict(self, state_dict, load_config=False):
        raise NotImplementedError

    @abstractmethod
    def state_dict(self):
        raise NotImplementedError

    @abstractmethod
    def clear(self):
        raise NotImplementedError

    @abstractmethod
    def sample(self, size, *args, **kwargs):
        raise NotImplementedError

    @abstractmethod
    def push(self, *args, **kwargs):
        raise NotImplementedError

    @abstractmethod
    def empty(self):
        raise NotImplementedError


class ReplayMemory(Memory):
    def __init__(self, size, seed=None):
        self.memory = RoundRobinQueue(size)
        self.randomizer = Randomizer(seed)

    def load_state_dict(self, state_dict, load_config=False):
        if isinstance(state_dict, ReplayMemory):
            return self.load_state_dict(state_dict.state_dict(), load_config)
        if 'memory' in state_dict:
            self.memory.load_state_dict(state_dict['memory'], load_config)
        if 'randomizer' in state_dict:
            self.randomizer.load_state_dict(state_dict['randomizer'])

    def state_dict(self):
        return {
            'memory': self.memory.state_dict(),
            'randomizer': self.randomizer.state_dict(),
        }

    def push(self, value):
        self.memory.push(value)

    def sample(self, size, preserve=0):
        if preserve <= 0:
            return self.randomizer.sample(self.memory, k=min(size, len(self.memory)))
        if size <= preserve:
            return self.memory[-preserve:]
        res = self.randomizer.sample(self.memory[:-preserve], k=min(size - preserve, len(self.memory)))
        res.extend(self.memory[-preserve:])
        return res

    def clear(self):
        self.memory.clear()
        self.randomizer.reset()

    def empty(self):
        return len(self.memory) == 0


class PriorityMemory(ReplayMemory):
    def __init__(self, size, priority_size, seed=None):
        super().__init__(size, seed)
        self._pqs = {}
        self._priority_size = priority_size
        self._counter = 0

    def load_state_dict(self, state_dict, load_config=False):
        if 'memory' in state_dict:
            self.memory.load_state_dict(state_dict['memory'], load_config)
        if 'randomizer' in state_dict:
            self.randomizer.load_state_dict(state_dict['randomizer'])
        if 'pqs' in state_dict:
            _pqs = state_dict['pqs']
            self._pqs = {}
            for k, v in _pqs.items():
                pq = PriorityQueue()
                pq.queue = v
                self._pqs[k] = pq
        if 'counter' in state_dict:
            self._counter = state_dict['counter']
        if 'priority_size' in state_dict:
            self._priority_size = state_dict['priority_size']

    def state_dict(self):
        return {
            'memory': self.memory.state_dict(),
            'randomizer': self.randomizer.state_dict(),
            'pqs': {k : v.queue for k, v in self._pqs.items()},
            'priority_size': self._priority_size,
            'counter': self._counter,
        }

    def push_priority_queue(self, sample_set, value, index):
        pq = self._pqs.setdefault(index, PriorityQueue())
        value_tuple = (-value, self._counter, sample_set) #(-value, time.time(), sample_set)
        pq.put_nowait(value_tuple) # the heap top represents the largest value
        self._counter += 1
        if pq.qsize() > self._priority_size:
            pq.get_nowait()

    def clear(self):
        super().clear()
        # state_dict() returns a shallow copy of _pqs, so directly calling _pqs.clear() will also clear
        #  _pqs in the state dict, which is unexpected
        self._pqs = {}
        self._counter = 0

    def sample(self, size, preserve=0):
        if preserve <= 0:
            return self.randomizer.sample(self.memory, k=min(size, len(self.memory)))
        if size <= preserve:
            size = preserve
        preserve_pool = []
        for pq in self._pqs.values():
            for _, _, s in pq.queue:
                preserve_pool.extend(s)
        preserve = min(preserve, len(preserve_pool))
        psv = self.randomizer.sample(preserve_pool, k=preserve)
        size = size - preserve
        if size > 0:
            psv.extend(self.randomizer.sample(self.memory, k=min(size, len(self.memory))))
        return psv


class DictPairMemory(Memory):
    def __init__(self, size=128, seed=None):
        self._memories = {}
        self._size = size
        self.randomizer = Randomizer(seed)

    def load_state_dict(self, state_dict, load_config=False):
        if 'memories' in state_dict:
            _memories = state_dict['memories']
            self._memories = {}
            for k, v in _memories.items():
                self._memories[k] = v
        if 'randomizer' in state_dict:
            self.randomizer.load_state_dict(state_dict['randomizer'])
        if 'size' in state_dict:
            self._size = state_dict['size']

    def state_dict(self):
        return {
            'memories': self._memories,
            'randomizer': self.randomizer.state_dict(),
            'size': self._size,
        }

    def push(self, value, key=None):
        memory = self._memories.get(key, None)
        if memory is None:
            memory = ReplayMemory(size=self._size)
            self._memories[key] = memory
        memory.push(value)

    def clear(self):
        self._memories = {}
        self.randomizer.reset()

    def sample(self, size, preserve=0, tuple_size=2):
        # return *size* pairs of samples
        keys = tuple(self._memories.keys())
        keys = Counter(self.randomizer.choices(keys, k=size))
        res = []
        for k, num_pairs in keys.items():
            memory = self._memories[k]
            _res = memory.sample(num_pairs * tuple_size)
            num_pairs = len(_res) // tuple_size # can be less than the original num_pairs
            _new_res = (_res[i : i + tuple_size] for i in range(0, num_pairs * tuple_size, tuple_size))#zip(_res[:num_pairs], _res[num_pairs:])
            res.extend(_new_res)
        return res

    def empty(self):
        return len(self._memories) == 0


_hash = hash
class HashPairMemory(Memory):
    def __init__(self, seed=None):
        self._memories = {}
        self.randomizer = Randomizer(seed)

    def load_state_dict(self, state_dict, load_config=False):
        if 'memories' in state_dict:
            _memories = state_dict['memories']
            self._memories = {}
            for k, v in _memories.items():
                self._memories[k] = v
        if 'randomizer' in state_dict:
            self.randomizer.load_state_dict(state_dict['randomizer'])

    def state_dict(self):
        return {
            'memories': self._memories,
            'randomizer': self.randomizer.state_dict(),
        }

    def push(self, value, key=None, hash=None):
        memory = self._memories.get(key, None)
        if memory is None:
            memory = {}
            self._memories[key] = memory
        if hash is None:
            hash = _hash(value)
        memory[hash] = value

    def clear(self):
        self._memories = {}
        self.randomizer.reset()

    def sample(self, size, preserve=0, tuple_size=0):
        # return *size* pairs of samples
        keys = tuple(self._memories.keys())
        keys = Counter(self.randomizer.choices(keys, k=size))
        res = []
        for k, num_pairs in keys.items():
            memory = self._memories[k]
            sample_num = num_pairs * tuple_size if tuple_size > 0 else num_pairs
            if sample_num > len(memory):
                _res = tuple(memory.values())
            else:
                _res = self.randomizer.sample(tuple(memory.values()), k=sample_num)#memory.sample(num_pairs * tuple_size)
            if tuple_size > 0:
                num_pairs = len(_res) // tuple_size # can be less than the original num_pairs
                _new_res = (_res[i : i + tuple_size] for i in range(0, num_pairs * tuple_size, tuple_size))#zip(_res[:num_pairs], _res[num_pairs:])
            else:
                _new_res = _res
            res.extend(_new_res)
        return res

    def get_values(self, key):
        if key in self._memories:
            memory = self._memories[key]
            return tuple(memory.values())
        return None

    def empty(self):
        return len(self._memories) == 0


class PackedMemory(Memory):
    def __init__(
        self,
        seed=None,
        default_sample_mode='fixed',
        default_key=None,
        final_shuffle=False,
    ):
        self._memories = {}
        self._randomizer = Randomizer(seed)
        self._default_sample_mode = default_sample_mode
        self._default_key = default_key
        self._final_shuffle = final_shuffle

    def add(self, key, memory, weight=1.):
        if not isinstance(memory, Memory):
            raise TypeError(f"'{memory.__class__.__name__}' object is not a memory object")
        if not isinstance(weight, (int, float)):
            raise TypeError(f"the weight should be a number")
        res = self._memories.get(key, None)
        self._memories[key] = (memory, weight)
        return res

    def remove(self, key, throw=False):
        res = self._memories.pop(key, None)
        if throw and res is None:
            raise KeyError(key)
        return res

    def set_weight(self, key, weight):
        if key not in self._memories:
            raise ValueError(f"memory '{key}' does not exist")
        self._memories[key] = (self._memories[key][0], weight)

    def get_weight(self, key):
        if key not in self._memories:
            raise ValueError(f"memory '{key}' does not exist")
        return self._memories[key][1]

    def __getitem__(self, item):
        return self._memories[item][0]

    def __setitem__(self, key, value):
        self.add(key, value)

    def __delitem__(self, key):
        self.remove(key, True)

    def state_dict(self):
        res = {}
        for key, (memory, weight) in self._memories.items():
            res[key] = {
                'memory': memory.state_dict(),
                'weight': weight,
            }
        res = {
            'memories': res,
            'randomizer': self._randomizer.state_dict(),
        }
        return res

    def load_state_dict(self, state_dict, load_config=False):
        if 'randomizer' in state_dict:
            self._randomizer.load_state_dict(state_dict['randomizer'])
        if 'memories' in state_dict:
            for key, value in state_dict['memories'].items():
                memory = self._memories.get(key, None)
                if memory is not None:
                    memory, weight = memory
                    memory.load_state_dict(value['memory'], load_config=load_config)
                    if load_config:
                        self._memories[key] = (memory, value['weight'])

    def clear(self):
        for key, (memory, weight) in self._memories.items():
            memory.clear()

    def push(self, *args, key=None, **kwargs):
        if key is None:
            key = self._default_key
        memory = self._memories.get(key, None)
        if memory is None:
            raise KeyError(key)
        memory, weight = memory
        return memory.push(*args, **kwargs)

    def sample(self, size, *args, mode=None, detail=False, **kwargs):
        """
        modes:
          - fixed: the sample size of each memory is determined by weight / total
          - random: the sample size is determined by random choices with replacement
        """
        memories, weights = zip(*self._memories.values())
        weights = list(map(lambda x: 0 if x[0].empty() else x[1], zip(memories, weights)))
        if mode is None:
            mode = self._default_sample_mode
        if mode == 'fixed':
            weights = np.array(weights)
            weights_cumsum = size * np.cumsum(weights) / weights.sum()
            weights_cumsum = np.round(weights_cumsum)
            weights_cumsum[-1] = size
            sample_sizes = weights.copy()
            sample_sizes[1:] = weights_cumsum[1:] - weights_cumsum[:1]
            sample_sizes = sample_sizes.astype(int).tolist()
        elif mode == 'random':
            sample_sizes = choice_counts(size, weights)
        else:
            raise RuntimeError(f"invalid mode: '{mode}'")
        res = []
        memories_mapping = {k : i for i, k in enumerate(self._memories.keys())}
        detail_labels = []
        if detail:
            for memory, memory_name, sample_size in zip(memories, self._memories.keys(), sample_sizes):
                res.extend(memory.sample(sample_size, *args, **kwargs))
                label = memories_mapping[memory_name]
                detail_labels.extend((label for i in range(sample_size)))
        else:
            for memory, sample_size in zip(memories, sample_sizes):
                res.extend(memory.sample(sample_size, *args, **kwargs))
        if self._final_shuffle:
            self._randomizer.shuffle(res)
        if detail:
            res = {
                'samples': res,
                'samples_count': sample_sizes,
                'labels': detail_labels,
                'labels_mapping': memories_mapping,
            }
        return res

    def empty(self):
        for memory, weight in self._memories.values():
            if not memory.empty():
                return False
        return True


class BestCache:
    def __init__(self, large_best=False):
        self._large_best = large_best
        self._cache = {}

    def __setitem__(self, key, value):
        if value is None:
            raise RuntimeError('the value cannot be None')
        prev_value = self._cache.get(key, None)
        if prev_value is not None:
            if self._large_best:
                if value > prev_value:
                    self._cache[key] = value
            else:
                if value < prev_value:
                    self._cache[key] = value
        else:
            self._cache[key] = value

    def __getitem__(self, key):
        return self._cache[key]

    def __contains__(self, item):
        return item in self._cache

    def get(self, key, default=None):
        return self._cache.get(key, default)

    def clear(self):
        self._cache = {}

    def state_dict(self):
        return {
            'cache': self._cache,
            'large_best': self._large_best,
        }

    def load_state_dict(self, state_dict):
        if 'cache' in state_dict:
            self._cache = state_dict['cache']
        if 'large_best' in state_dict:
            self._large_best = state_dict['large_best']


@total_ordering
class _max_wrapper:
    def __init__(self, value):
        self.value = value

    def __lt__(self, other):
        if not isinstance(other, self.__class__):
            raise NotImplementedError
        return self.value > other.value

    def __eq__(self, other):
        if not isinstance(other, self.__class__):
            raise NotImplementedError
        return self.value == other.value


@total_ordering
class _min_wrapper:
    def __init__(self, value):
        self.value = value

    def __lt__(self, other):
        if not isinstance(other, self.__class__):
            raise NotImplementedError
        return self.value < other.value

    def __eq__(self, other):
        if not isinstance(other, self.__class__):
            raise NotImplementedError
        return self.value == other.value


def _q_to_list(q : PriorityQueue):
    return [v.value for v in q.queue]


class TopCache:

    def __init__(self, large_best=False, capacity=50):
        self._large_best = large_best
        self._capacity = capacity
        self._cache = {}

    def __setitem__(self, key, value):
        if value is None:
            raise RuntimeError('the value cannot be None')
        wrapped_value = _min_wrapper(value) if self._large_best else _max_wrapper(value)
        q = self._cache.get(key, None)
        if q is None:
            q = PriorityQueue(maxsize=self._capacity)
            self._cache[key] = q
        if q.full() and not q.empty():
            # compare the largest element in the heap and the new one,
            #  and remove the largest element if it is larger
            if q.queue[0] < wrapped_value:
                q.get_nowait()
            else:
                return
        q.put_nowait(wrapped_value)

    def __getitem__(self, item):
        q = self._cache.get(item, None)
        if q is None:
            raise KeyError(item)
        return _q_to_list(q)

    def __contains__(self, item):
        return item in self._cache

    def get(self, key, default=None):
        q = self._cache.get(key, None)
        if q is None:
            return default
        return _q_to_list(q)

    def clear(self):
        self._cache = {}

    def state_dict(self):
        return {
            'cache': {k : _q_to_list(v) for k, v in self._cache.items()},
            'capacity': self._capacity,
            'large_best': self._large_best,
        }

    def load_state_dict(self, state_dict, load_config=False):
        if load_config:
            if 'capacity' in state_dict:
                self._capacity = state_dict['capacity']
            if 'large_best' in state_dict:
                self._large_best = state_dict['large_best']
        if 'cache' in state_dict:
            for k, v in state_dict['cache'].items():
                q = PriorityQueue(self._capacity)
                for value in v:
                    wrapped = _min_wrapper(value) if self._large_best else _max_wrapper(value)
                    q.put_nowait(wrapped)
                self._cache[k] = q


class RecentCache:
    def __init__(self, capacity=50):
        self._capacity = capacity
        self._cache = {}

    def __setitem__(self, key, value):
        q = self._cache.get(key, None)
        if q is None:
            q = RoundRobinQueue(self._capacity)
            self._cache[key] = q
        q.push(value)

    def __getitem__(self, item):
        q = self._cache.get(item, None)
        if q is None:
            raise KeyError(item)
        return q._data

    def __delitem__(self, key):
        if key not in self._cache:
            raise KeyError(key)
        del self._cache[key]

    def __contains__(self, item):
        return item in self._cache

    def get(self, key, default=None):
        q = self._cache.get(key, None)
        if q is None:
            return default
        return q._data

    def clear(self):
        self._cache = {}

    def state_dict(self):
        return {
            'cache': {k : v.state_dict() for k, v in self._cache.items()},
            'capacity': self._capacity,
        }

    def load_state_dict(self, state_dict, load_config=False):
        if load_config:
            if 'capacity' in state_dict:
                self._capacity = state_dict['capacity']
        if 'cache' in state_dict:
            for k, v in state_dict['cache'].items():
                q = RoundRobinQueue(self._capacity)
                q.load_state_dict(v)
                self._cache[k] = q


class BucketMemory(Memory):
    def __init__(self, num_buckets, bucket_size=None, seed=None):
        self.weights = [1. for _ in range(num_buckets)]
        self.randomizer = Randomizer(seed)
        self._bucket_size = bucket_size
        self._buckets = [RoundRobinQueue(self._bucket_size) for _ in range(num_buckets)]

    def load_buckets(self, buckets):
        buckets = tuple(buckets)
        self._buckets = [RoundRobinQueue(self._bucket_size) for _ in range(len(buckets))]
        for bucket, b in zip(self._buckets, buckets):
            b = list(b)
            if self._bucket_size is not None:
                b = b[-self._bucket_size:]
            bucket._data = b

    def load_state_dict(self, state_dict, load_config=False):
        if 'buckets' in state_dict:
            _buckets = state_dict['buckets']
            self._buckets = [RoundRobinQueue(self._bucket_size) for _ in range(len(_buckets))]
            for bucket, bucket_state_dict in zip(self._buckets, _buckets):
                bucket.load_state_dict(bucket_state_dict)
        if 'weights' in state_dict:
            self.weights = state_dict['weights']
        if 'randomizer' in state_dict:
            self.randomizer.load_state_dict(state_dict['randomizer'])

    def state_dict(self):
        return {
            'buckets': [b.state_dict() for b in self._buckets],
            'weights': self.weights,
            'randomizer': self.randomizer.state_dict(),
        }

    def push(self, value, bucket_index):
        return self._buckets[bucket_index].push(value)

    def clear(self):
        self._buckets = [RoundRobinQueue(self._bucket_size) for _ in range(len(self._buckets))]
        self.randomizer.reset()

    def sample(self, size, preserve=0, with_label=False, as_buckets=False):
        bucket_counts = choice_counts(size, self.weights)
        res = []
        for index, bucket in enumerate(self._buckets):
            samples = self.randomizer.sample(bucket, min(len(bucket), bucket_counts[index]))
            if with_label:
                samples = map(lambda x: (index, x), samples)
            if as_buckets:
                res.append(list(samples))
            else:
                res.extend(samples)
        return res

    def empty(self):
        return all(map(lambda x: len(x) == 0, self._buckets))


class _legacyBucketUniqueMemory(BucketMemory):
    def __init__(self, num_buckets, bucket_size=None, value_key=None, seed=None):
        super().__init__(num_buckets, bucket_size=bucket_size, seed=seed)
        self._bucket_sets = [set() for _ in range(num_buckets)]
        self._value_key = value_key if value_key is not None else lambda _: _

    def push(self, value, bucket_index):
        key = self._value_key(value)
        if key in self._bucket_sets[bucket_index]:
            return None
        self._bucket_sets[bucket_index].add(key)
        res = self._buckets[bucket_index].push(value)
        if res is not None:
            res_key = self._value_key(res)
            self._bucket_sets[bucket_index].remove(res_key)
        return res

    def load_buckets(self, buckets):
        buckets = tuple(buckets)
        self._buckets = [RoundRobinQueue(self._bucket_size) for _ in range(len(buckets))]
        self._bucket_sets = [set() for _ in range(len(buckets))]
        for bucket_index, b in enumerate(buckets):
            for value in b:
                self.push(value, bucket_index)

    def clear(self):
        self._bucket_sets = [set() for _ in range(len(self._buckets))]
        return super().clear()

    def state_dict(self):
        res = super().state_dict()
        res.update({
            'bucket_sets': self._bucket_sets,
        })
        return res

    def load_state_dict(self, state_dict, load_config=False):
        if 'bucket_sets' in state_dict:
            self._bucket_sets = state_dict['bucket_sets']
        return super().load_state_dict(state_dict, load_config=load_config)


class BucketUniqueMemory(Memory):
    def __init__(self, value_key=None, seed=None):
        self._bucket_label = {}
        self._buckets = {}
        self._all_bucket_labels = set()
        self.randomizer = Randomizer(seed)
        self._value_key = value_key if value_key is not None else lambda _: _

        self.bucket_label_weights = {}

    def push(self, value, bucket_index):
        key = self._value_key(value)
        prev_label = self._bucket_label.get(key, None)
        if prev_label == bucket_index:
            return None
        self._all_bucket_labels.add(bucket_index)
        self._bucket_label[key] = bucket_index
        if bucket_index not in self._buckets:
            bucket = {}
            self._buckets[bucket_index] = bucket
        else:
            bucket = self._buckets[bucket_index]
        bucket[key] = value
        if prev_label is not None:
            del self._buckets[prev_label][key]

    def load_buckets(self, buckets):
        buckets = tuple(buckets)
        self._bucket_label = {}
        self._buckets = {}
        for bucket_index, b in enumerate(buckets):
            for value in b:
                self.push(value, bucket_index)

    def clear(self):
        self._bucket_label = {}
        self._buckets = {}
        self._all_bucket_labels = set()
        self.randomizer.reset()

    def state_dict(self):
        return {
            'buckets': self._buckets,
            'bucket_label': self._bucket_label,
            'all_bucket_labels': self._all_bucket_labels,
            'randomizer': self.randomizer.state_dict(),
        }

    def load_state_dict(self, state_dict, load_config=False):
        if 'buckets' in state_dict:
            self._buckets = state_dict['buckets']
        if 'bucket_label' in state_dict:
            self._bucket_label = state_dict['bucket_label']
        if 'all_bucket_labels' in state_dict:
            self._all_bucket_labels = state_dict['all_bucket_labels']
        if 'randomizer' in state_dict:
            self.randomizer.load_state_dict('randomizer')

    def sample(self, size, preserve=0, with_label=False):
        bucket_labels = tuple(self._all_bucket_labels)
        bucket_label_weights = tuple(map(lambda x: self.bucket_label_weights.get(x, 1.), bucket_labels))
        bucket_counts = choice_counts(size, bucket_label_weights)
        res = []
        for index, bucket_label in enumerate(bucket_labels):
            bucket = self._buckets[bucket_label]
            samples = self.randomizer.sample(tuple(bucket.values()), min(len(bucket), bucket_counts[index]))
            if with_label:
                samples = map(lambda x: (bucket_label, x), samples)
            res.extend(samples)
        return res

    def empty(self):
        return len(self._bucket_label) == 0


def get_buckets(objects, criteria):
    # objects: (object, (value1, value2, ...))
    # criteria: (criterion1, criterion2, ...)
    criteria = tuple(criteria)

    lens = []
    _total_lens = [1, ]
    buckets = {}
    total_lens = 1
    for crit in criteria:
        l = len(crit) + 1
        lens.append(l)
        total_lens *= l
        _total_lens.append(total_lens)

    for index in range(total_lens):
        indices = []
        for i in range(len(_total_lens) - 1):
            current = (index % _total_lens[i + 1]) // _total_lens[i]
            indices.append(current)
        buckets[tuple(indices)] = []

    for obj, values in objects:
        indices = []
        for i, v in enumerate(values):
            indices.append(bisect.bisect_left(criteria[i], v))
        indices = tuple(indices)
        buckets[indices].append(obj)

    return buckets


class SquareRootMemory(Memory):
    def __init__(self, value_key=None, seed=None, weight_function=math.sqrt):
        self.randomizer = Randomizer(seed)
        self._memory = {}
        self._value_key = value_key if value_key is not None else lambda _: _
        self._weight_function = weight_function

    def push(self, value):
        value_key = self._value_key(value)
        new_count = self._memory.get(value_key, (0, ))[0] + 1
        self._memory[value_key] = (new_count, self._weight_function(new_count), value)

    def clear(self):
        self._memory.clear()
        self.randomizer.reset()

    def empty(self):
        return len(self._memory) == 0

    def sample(self, size, preserve=0):
        _, weights, values = zip(*self._memory.values())
        res = self.randomizer.choices(values, weights, k=size)
        return res

    def state_dict(self):
        return {
            'memory': self._memory,
            'randomizer': self.randomizer.state_dict(),
        }

    def load_state_dict(self, state_dict, load_config=False):
        if 'memory' in state_dict:
            self._memory = state_dict['memory']
        if 'randomizer' in state_dict:
            self.randomizer.load_state_dict(state_dict['randomizer'])
