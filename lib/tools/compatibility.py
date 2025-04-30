def reconstruct_object(obj, typ):
    res = object.__new__(typ)
    if hasattr(res, '__dict__'):
        if not hasattr(obj, '__dict__'):
            raise TypeError(f"incompatible types '{typ.__name__}' and '{obj.__class__.__name__}'")
        res.__dict__ = obj.__dict__.copy()
    if hasattr(typ, '__slots__'):
        for name in typ.__slots__:
            if not hasattr(obj, name):
                raise TypeError(f"incompatible types '{typ.__name__}' and '{obj.__class__.__name__}'")
            setattr(res, name, getattr(obj, name))
    return res
