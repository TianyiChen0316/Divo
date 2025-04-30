import re
import builtins

def _str_split(s: str):
    res = []
    str_type, str_indicators, escape = 0, [], False
    prev_pos, skip = 0, 0
    for i, c in enumerate(s):
        if skip:
            skip -= 1
            continue
        if str_type == 0:
            if c in "FfRrBb":
                str_indicators.append(c)
            elif c == "'":
                if i < len(s) - 2 and s[i + 1: i + 3] == "''":
                    str_type = 11
                    skip = 2
                else:
                    str_type = 1
                str_indicators = str_indicators[-2:]
                res.append((0, s[prev_pos : i - len(str_indicators)]))
                prev_pos = i - len(str_indicators)
            elif c == '"':
                if i < len(s) - 2 and s[i + 1: i + 3] == '""':
                    str_type = 21
                    skip = 2
                else:
                    str_type = 2
                str_indicators = str_indicators[-2:]
                res.append((0, s[prev_pos : i - len(str_indicators)]))
                prev_pos = i - len(str_indicators)
            elif c == '#':
                str_type = 3
                res.append((0, s[prev_pos : i]))
                prev_pos = i
            else:
                str_indicators = []
        elif str_type == 1:
            if escape:
                escape = False
            elif c == '\\' and 'r' not in str_indicators:
                escape = True
            elif c == "'" or c == '\n':
                res.append((1, s[prev_pos: i + 1]))
                str_type, str_indicators = 0, []
                prev_pos = i + 1
        elif str_type == 2:
            if escape:
                escape = False
            elif c == '\\' and 'r' not in str_indicators:
                escape = True
            elif c == '"' or c == '\n':
                res.append((1, s[prev_pos : i + 1]))
                str_type, str_indicators = 0, []
                prev_pos = i + 1
        elif str_type == 11:
            if c == "'":
                if i < len(s) - 2 and s[i + 1: i + 3] == "''":
                    skip = 2
                    res.append((1, s[prev_pos: i + 3]))
                    prev_pos = i + 3
                    str_type, str_indicators = 0, []
        elif str_type == 21:
            if c == '"':
                if i < len(s) - 2 and s[i + 1: i + 3] == '""':
                    skip = 2
                    res.append((1, s[prev_pos : i + 3]))
                    prev_pos = i + 3
                    str_type, str_indicators = 0, []
        elif str_type == 3:
            if c == '\n':
                res.append((2, s[prev_pos : i + 1]))
                str_type, str_indicators = 0, []
                prev_pos = i + 1
    if prev_pos < len(s):
        if str_type == 3:
            str_format = 2
        elif str_type != 0:
            str_format = 1
        else:
            str_format = 0
        res.append((str_format, s[prev_pos:]))
    return res

def _make_regex(*regs):
    _regs = '|'.join(regs)
    return re.compile(f'(^|[^A-Za-z0-9_])({_regs})([^A-Za-z0-9_]|$)')

def _make_regex_names(*regs):
    _regs = '|'.join(regs)
    return re.compile(f'(^|[^A-Za-z0-9_.])({_regs})([^A-Za-z0-9_]|$)')

_keywords = _make_regex(
    "await", "else", "pass",
    "break", "except", "in", "raise",
    "class", "finally", "is", "return",
    "and", "continue", "for", "lambda", "try",
    "as", "def", "nonlocal", "while",
    "assert", "del", "global", "not", "with",
    "async", "elif", "if", "or", "yield",
)
_import_keywords = _make_regex('from', 'import')
_reserved_values = _make_regex('False', 'True', 'None')
_builtin_funcs = _make_regex_names(*filter(lambda x: not x.startswith('_'), dir(builtins)))
_special_names = _make_regex_names('self', 'cls')
_special_fields = _make_regex_names(*dir(object))
_re_values = re.compile('(^|[^A-Za-z0-9_])((?:0[BbOoXx]|[1-9])(?:_?[0-9]+)*)')
_re_class_name = re.compile('(^|[^A-Za-z0-9_]class)(\s+[A-Za-z_][A-Za-z0-9_]*)')
_re_method_name = re.compile('(^|[^A-Za-z0-9_]def)(\s+[A-Za-z_][A-Za-z0-9_]*)')

_default_format = '\033[0\001'
_class_format = '\033[0;1;36\001'
_method_format = '\033[0;36\001'
_values_format = '\033[0;31\001'
_string_format = '\033[0;31\001'
_import_keywords_format = '\033[0;35\001'
_keywords_format = '\033[0;33\001'
_reserved_values_format = '\033[0;1;36\001'
_special_names_format = '\033[0;1;33\001'
_special_fields_format = '\033[0;35\001'
_builtin_funcs_format = '\033[0;36\001'
_comment_format = '\033[0;32\001'

def _beautify_content(s: str):
    s = re.sub(_re_values, f"\\1{_values_format}\\2{_default_format}", s)
    s = re.sub(_re_class_name, f"\\1{_class_format}\\2{_default_format}", s)
    s = re.sub(_re_method_name, f"\\1{_method_format}\\2{_default_format}", s)
    s = re.sub(_import_keywords, f"\\1{_import_keywords_format}\\2{_default_format}\\3", s)
    s = re.sub(_keywords, f"\\1{_keywords_format}\\2{_default_format}\\3", s)
    s = re.sub(_special_names, f"\\1{_special_names_format}\\2{_default_format}\\3", s)
    s = re.sub(_special_fields, f"\\1{_special_fields_format}\\2{_default_format}\\3", s)
    s = re.sub(_builtin_funcs, f"\\1{_builtin_funcs_format}\\2{_default_format}\\3", s)
    s = re.sub(_reserved_values, f"\\1{_reserved_values_format}\\2{_default_format}\\3", s)
    return s

def beautify(s: str):
    str_split = _str_split(s)
    res = []
    for str_type, substr in str_split:
        if str_type == 1:
            res.append(_string_format)
            res.append(substr)
            res.append(_default_format)
        elif str_type == 2:
            res.append(_comment_format)
            res.append(substr)
            res.append(_default_format)
        else:
            res.append(_beautify_content(substr))
    res = _default_format + ''.join(res) + _default_format
    return res.replace('\001', 'm')


__all__ = ['beautify']
