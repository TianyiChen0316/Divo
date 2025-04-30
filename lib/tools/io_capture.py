import sys, io
import typing
from collections import deque
import re
import threading

from ..syntax.placeholder import PlaceholderMetaclass

def _get_kwargs(kwargs, *names):
    res = {}
    for name in names:
        if name in kwargs:
            res[name] = kwargs[name]
    return res

class _recordtype:
    def __init__(self):
        self.queue = deque()
        self.total_size = 0
        self.lock = threading.Lock()

def _get_io(io: typing.Union[str, io.TextIOBase]):
    if isinstance(io, str):
        io = {
            'stdin': sys.stdin,
            'stdout': sys.stdout,
            'stderr': sys.stderr,
            '__stdin__': sys.__stdin__,
            '__stdout__': sys.__stdout__,
            '__stderr__': sys.__stderr__,
        }.get(io, None)
        if io is None:
            raise ValueError('invalid file')
    return io

_re_console_escape = re.compile(r'\033\[((?:[0-9]+;)*[0-9]+)m')
_re_console_escape_rev = re.compile(r'm((?:[0-9]+;)*[0-9]+)\[\033')
def _get_format_from_str(s: str, prev_format = None):
    values = s.split(';')
    value = [0, 0, 0] if prev_format is None else list(prev_format)
    index = 0
    while index < len(values):
        try:
            v = int(values[index])
        except ValueError:
            v = 0
        if v == 0:
            value = [0, 0, 0]
        elif 1 <= v < 30:
            value[0] = v
        elif 30 <= v <= 37:
            value[1] = v
        elif 40 <= v <= 47:
            value[2] = v
        elif v in (38, 48):
            target_index = {38: 1, 48: 2}.get(v, 1)
            if index + 1 < len(values):
                try:
                    next = int(values[index + 1])
                except ValueError:
                    value[target_index] = v
                else:
                    if next == 5 and index + 2 < len(values):
                        try:
                            arg = int(values[index + 2])
                        except ValueError:
                            value[target_index] = v
                        else:
                            value[target_index] = (v, 5, arg)
                            index += 2
                    elif next == 2 and index + 4 < len(values):
                        try:
                            args = tuple(map(int, values[index + 2 : index + 5]))
                        except ValueError:
                            value[target_index] = v
                        else:
                            value[target_index] = (v, 2, *args)
                            index += 4
        index += 1
    return tuple(value)

def _get_format_str(format, prev_format = None):
    format = tuple(format)
    if prev_format is None:
        if format == (0, 0, 0):
            return '\033[0m'
        final_format = []
        for v in format:
            if v != 0:
                if isinstance(v, tuple):
                    v = ';'.join(map(str, v))
                else:
                    v = str(v)
                final_format.append(v)
        return '\033[' + ';'.join(final_format) + 'm'
    prev_format = tuple(prev_format)
    if format == prev_format:
        return ''
    if format == (0, 0, 0):
        return '\033[0m'
    final_format = []
    for v, pv in zip(format, prev_format):
        if v != pv:
            if isinstance(v, tuple):
                v = ';'.join(map(str, v))
            else:
                v = str(v)
            final_format.append(v)
    return '\033[' + ';'.join(final_format) + 'm'

def _get_console_line(line: str, prev_format = None):
    if prev_format is None:
        prev_format = (0, 0, 0)
    _parts = line.split('\r')
    parts = []
    for p in _parts:
        last_format_match = _re_console_escape_rev.search(p[::-1])
        if last_format_match:
            this_format = _get_format_from_str(last_format_match.group(1)[::-1], prev_format)
        else:
            this_format = prev_format
        parts.append((prev_format, p, this_format))
        prev_format = this_format
    last_line, max_size, buf = None, 0, []
    _final_format = parts[-1][2]
    _last_format = _final_format
    _last_line_prev_format = parts[-1][0]
    for i, (prev_format, _s, last_format) in enumerate(reversed(parts)):
        if i == 0 and _s and _s[-1] == '\n':
            last_line = _s
        else:
            formats = _re_console_escape.finditer(_s)
            s_len = len(_s)
            this_format = prev_format
            this_skip_size, skip_size = 0, 0
            for matched in formats:
                start_pos, end_pos = matched.span(0)
                start_pos, end_pos = start_pos - skip_size, end_pos - skip_size
                if start_pos <= max_size:
                    this_skip_size += end_pos - start_pos
                    this_format = _get_format_from_str(matched.group(1), this_format)
                skip_size += end_pos - start_pos
            if s_len - skip_size > max_size:
                if prev_format != _last_format:
                    buf.append(_get_format_str(this_format, prev_format))
                buf.append(_s[max_size + this_skip_size:])
                max_size = s_len - skip_size
                _last_format = last_format
    buf = ''.join(buf)
    if last_line:
        if buf:
            if _last_format != _last_line_prev_format:
                last_line = _get_format_str(_last_line_prev_format, _last_format) + last_line
            last_line = buf + '\r' + last_line
    else:
        last_line = buf
        if _last_format != _last_line_prev_format:
            last_line += _get_format_str(_last_line_prev_format, _last_format)
    return last_line, _final_format

def capture(io, capacity: typing.Optional[int] = None):
    io = _get_io(io)
    class TextIOCapturer(
        metaclass=PlaceholderMetaclass,
        type=io.__class__,
        placeholder_name='_io',
    ):
        def __init__(
            self,
            io,
            capacity: typing.Optional[int] = None,
        ):
            if capacity is not None:
                if not isinstance(capacity, int):
                    raise ValueError('capacity should be int')
                if capacity < 0:
                    raise ValueError('capacity should be greater than zero')
            else:
                capacity = 0
            self._io = io
            self._capacity = capacity
            self._record_output = _recordtype()
            self._record_input = _recordtype()

        @property
        def io(self):
            return self._io

        def _get_record(self, record: _recordtype):
            if not record.queue:
                res = ''
            elif not self._capacity or record.total_size <= self._capacity:
                res = ''.join(map(lambda x: x[1], record.queue))
            else:
                q = tuple(record.queue)
                left = q[0][1][record.total_size - self._capacity:]
                res = left + ''.join(map(lambda x: x[1], q[1:]))
            return res

        @property
        def input_record(self):
            return self._get_record(self._record_input)

        @property
        def output_record(self):
            return self._get_record(self._record_output)

        @property
        def capacity(self):
            return self._capacity

        def _record_line(self, s: str, record: _recordtype):
            if record.lock.acquire(False):
                self._unsafe_record_line(s, record)
                record.lock.release()
            else:
                def proc():
                    record.lock.acquire(True)
                    self._unsafe_record_line(s, record)
                    record.lock.release()
                thread = threading.Thread(target=proc, daemon=True)
                thread.start()

        def _unsafe_record_line(self, s: str, record: _recordtype):
            last_prev_format, last, last_format = record.queue[-1] if record.queue else (None, None, None)
            prev_format = (0, 0, 0)
            if last and last[-1] == '\n':
                last = None
                prev_format = last_format
            if last:
                record.queue.pop()
                record.total_size -= len(last)
                s = last + s
                prev_format = last_prev_format
            new_s, new_format = _get_console_line(s, last_format)
            record.queue.append((prev_format, new_s, new_format))
            record.total_size += len(new_s)
            if self._capacity:
                while record.total_size > self._capacity:
                    left_len = len(record.queue[0][1])
                    if record.queue and record.total_size > self._capacity + left_len:
                        record.queue.popleft()
                        record.total_size -= left_len
                    else:
                        break

        def _record_lines(self, s: str, record: _recordtype):
            lines = s.split('\n')
            for i in range(len(lines) - 1):
                lines[i] += '\n'
            if not lines[-1]:
                lines.pop()
            for l in lines:
                self._record_line(l, record)

        def read(self, size: typing.Optional[int] = None):
            args = [] if size is None else [size]
            res = self._io.read(*args)
            self._record_lines(res, self._record_input)
            return res

        def readline(self, size: typing.Optional[int] = None) -> str:
            args = [] if size is None else [size]
            res = self._io.readline(*args)
            self._record_lines(res, self._record_input)
            return res

        def readlines(self, hint: typing.Optional[int] = None) -> typing.List[str]:
            args = [] if hint is None else [hint]
            res = self._io.readlines(*args)
            for s in res:
                self._record_line(s, self._record_input)
            return res

        def write(self, s: str):
            self._record_lines(s, self._record_output)
            return self._io.write(s)

    return TextIOCapturer(io, capacity)

def get_input_record(io: typing.Union[str, io.TextIOBase]):
    io = _get_io(io)
    if not hasattr(io, 'input_record'):
        raise ValueError('input is not captured')
    return io.input_record

def get_output_record(io: typing.Union[str, io.TextIOBase]):
    io = _get_io(io)
    if not hasattr(io, 'output_record'):
        raise ValueError('output is not captured')
    return io.output_record

__all__ = ['capture', 'get_input_record', 'get_output_record']
