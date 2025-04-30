import threading
import uuid
from . import randomizer


class Timer(threading.Thread):
    def __init__(self, parent, thread_id, interval, function, invoke_times=None, args=None, kwargs=None):
        super().__init__(name=f'Timer-{thread_id}', daemon=True)
        self._parent = parent
        self._thread_id = thread_id
        self.interval = interval
        self.invoke_times = invoke_times
        self.function = function
        self.args = args if args is not None else []
        self.kwargs = kwargs if kwargs is not None else {}
        self.finished = threading.Event()

    def _postprocess(self):
        if self._parent and self._thread_id in self._parent._threads:
            del self._parent._threads[self._thread_id]

    def cancel(self):
        """Stop the timer if it hasn't finished yet."""
        self._postprocess()
        self.finished.set()

    def run(self):
        invoked = 0
        while True:
            self.finished.wait(self.interval)
            if not self.finished.is_set():
                self.function(*self.args, **self.kwargs)
                if self.invoke_times is not None and self.invoke_times > 0:
                    invoked += 1
                    if invoked >= self.invoke_times:
                        self._postprocess()
                        break
            else:
                break
        self.finished.set()


class TimerThreads:
    def __init__(self, seed=0):
        self._threads = {}
        self._randomizer = randomizer.Randomizer(seed)

    def appoint(self, callback, args=None, kwargs=None, interval=0, times=None, ):
        if times is not None and (not isinstance(times, int) or times < 0):
            raise ValueError('times should be a non-negative integer')
        new_uuid = str(uuid.UUID(bytes=self._randomizer.randbytes(16), version=4))
        thread = Timer(self, new_uuid, interval, callback, invoke_times=times, args=args, kwargs=kwargs)
        self._threads[new_uuid] = thread
        thread.start()
        return new_uuid

    def cancel(self, uuid: str):
        if uuid not in self._threads:
            raise ValueError(f"thread '{uuid}' does not exist")
        thread = self._threads.pop(uuid)
        thread.cancel()


_thread_pool = TimerThreads(seed=1443582375)

appoint = _thread_pool.appoint
cancel = _thread_pool.cancel


__all__ = ['TimerThreads', 'appoint', 'cancel']

