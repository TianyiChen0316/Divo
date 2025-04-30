import abc as _abc
import os as _os
import sys as _sys
import io as _io
import logging as _logging
from logging import NOTSET, DEBUG, INFO, WARN, WARNING, ERROR, FATAL, CRITICAL


class _LoggerIO(_io.TextIOBase):
    def __init__(self, logger):
        super().__init__()
        self._logger = logger

    def write(self, s: str):
        self._logger(s)
        return len(s)


class Logger(_logging.Logger):
    def __init__(self, name, level=NOTSET):
        super().__init__(name, level)
        self._file_handler = None
        self._stdout_handler = None
        self._stderr_handler = None
        self.format('[{levelname} {asctime}.{msecs:03.0f}] {message}', '%Y-%m-%d %H:%M:%S', style='{')
        self._io = _LoggerIO(self)

    @property
    def io(self):
        return self._io

    @property
    def file_handler(self):
        return self._file_handler

    @property
    def stdout_handler(self):
        return self._stdout_handler

    @property
    def stderr_handler(self):
        return self._stderr_handler

    def format(self, format : str, date_format : str = None, style='%'):
        self._formatter = _logging.Formatter(format, date_format, style)
        for h in self.handlers:
            h.setFormatter(self._formatter)

    def __call__(self, *value, sep=' ', end='', flush=False, level=INFO):
        if sep is None:
            sep = ' '
        if end is None:
            end = ''
        msg = sep.join(map(str, value)) + end
        self.log(level, msg)
        if flush:
            for handler in self.handlers:
                handler.flush()

_Logger = Logger


class Logger(_abc.ABC):
    __slots__ = ()

    def __init__(self, name, level=None, file=None, to_stderr=None, to_stdout=None):
        raise NotImplementedError

    def __new__(cls, name, level=None, file=None, to_stderr=None, to_stdout=None):
        ori_logger_class = _logging.getLoggerClass()
        _logging.setLoggerClass(_Logger)
        logger = _logging.getLogger(name)
        if not isinstance(logger, _Logger):
            raise RuntimeError(f"logger '{name}' has already been created")
        if level is not None:
            logger.setLevel(level)
        if file:
            if logger._file_handler is not None:
                logger.removeHandler(logger._file_handler)
            _os.makedirs(_os.path.dirname(file), exist_ok=True)
            logger._file_handler = _logging.FileHandler(file, 'a', 'utf8')
            logger.addHandler(logger._file_handler)
            if logger._formatter:
                logger._file_handler.setFormatter(logger._formatter)
        if to_stdout is not None:
            if to_stdout:
                if logger._stdout_handler is None:
                    logger._stdout_handler = _logging.StreamHandler(_sys.stdout)
                    logger.addHandler(logger._stdout_handler)
                    if logger._formatter:
                        logger._stdout_handler.setFormatter(logger._formatter)
                if isinstance(to_stdout, (int, str)):
                    logger._stdout_handler.setLevel(to_stdout)
            else:
                if logger._stdout_handler is not None:
                    logger.removeHandler(logger._stdout_handler)
                    logger._stdout_handler = None
        if to_stderr is not None:
            if to_stderr:
                if logger._stderr_handler is None:
                    logger._stderr_handler = _logging.StreamHandler(_sys.stderr)
                    logger.addHandler(logger._stderr_handler)
                    if logger._formatter:
                        logger._stderr_handler.setFormatter(logger._formatter)
                if isinstance(to_stderr, (int, str)):
                    logger._stderr_handler.setLevel(to_stderr)
            else:
                if logger._stderr_handler is not None:
                    logger.removeHandler(logger._stderr_handler)
                    logger._stderr_handler = None
        _logging.setLoggerClass(ori_logger_class)
        return logger

    @classmethod
    def __subclasshook__(cls, subclass):
        return issubclass(subclass, _Logger)


__all__ = ['Logger', 'NOTSET', 'DEBUG', 'INFO', 'WARN', 'WARNING', 'ERROR', 'FATAL', 'CRITICAL']
