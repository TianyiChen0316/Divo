import traceback


def get_exception_str(exception : Exception):
    exception_str = str(exception)
    exception_str = f'{exception.__class__.__name__}{": " + exception_str if exception_str else ""}'
    return exception_str


def get_current_traceback(exception : Exception):
    header = 'Traceback (most recent call last):\n'
    tb = traceback.extract_tb(exception.__traceback__)
    tb_str = ''.join(traceback.format_list(tb))
    exception_str = get_exception_str(exception)
    return ''.join((header, tb_str, exception_str))


def get_traceback(exception : Exception, join=True):
    res = traceback.format_exception(exception.__class__, exception, exception.__traceback__)
    if join:
        return ''.join(res)
    return res


__all__ = ['get_exception_str', 'get_traceback', 'get_current_traceback']