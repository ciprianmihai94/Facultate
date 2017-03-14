from test import test

def cmmdc(x, y):
    while x != y:
        if x>y:
            x -= y
        else:
            y -= x
    return x

