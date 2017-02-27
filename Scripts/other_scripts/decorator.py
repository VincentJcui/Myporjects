#encoding:utf-8
''
'''
装饰器的使用
'''

'''
# 第一步
# 定义函数,讲调用原函数,使用新函数替换
'''
print '第一步..........................'

def test_func():
    return 'test_func'


def test_wrapper_func():
    print 'before'
    rt = test_func()
    print 'after'
    return rt

print test_wrapper_func()

'''
# 第二步
# 原函数可以定参数
'''
print '第二步..........................'

def test_func():
    return 'test_func'


def test_wrapper_func(*args, **kwargs):
    print 'before'
    rt = test_func(*args, **kwargs)
    print 'after'
    return rt

print test_wrapper_func()

'''
# 第三步
# 定义工厂函数,返回wrapper函数
'''
print '第三步..........................'

def test_func():
    return 'test_func'


def test_wrapper_func(*args, **kwargs):
    print 'before'
    rt = test_func(*args, **kwargs)
    print 'after'
    return rt

def test_wrapper():
    return test_wrapper_func

test_wrapper_func_temp = test_wrapper()

print test_wrapper_func_temp == test_wrapper_func
print test_wrapper_func_temp()
print test_wrapper_func()

'''
# 第四步
# 去掉共有的wrapper函数,放在工厂函数内部
'''
print '第四步..........................'

def test_func():
    return 'test_func'


def test_wrapper():
    def wrapper(*args, **kwargs):
        print 'before'
        rt = test_func(*args, **kwargs)
        print 'after'
        return rt
    return wrapper


test_wrapper_func = test_wrapper()
print test_wrapper_func()

'''
# 第五步
# 可以为所有函数添加同一功能前后执行代码
'''
print '第五步..........................'

def test_func():
    return 'test_func'

def test_wrapper(func):
    def wrapper(*args, **kwargs):
        print 'before'
        rt = func(*args, **kwargs)
        print 'after'
        return rt
    return wrapper


test_wrapper_func = test_wrapper(test_func)
print test_wrapper_func()

'''
# 第六步
# 使用装饰器
'''
print '第六步..........................'

def test_wrapper(func):
    def wrapper(*args, **kwargs):
        print 'before'
        rt = func(*args, **kwargs)
        print 'after'
        return rt
    return wrapper
@test_wrapper
def test_func():
    return 'test_func'

print test_func()

'''
# 第七步
# 修正多个装饰器时，使用函数fun名称问题
'''
print '第七步..........................'

from functools import wraps

def test_wrapper(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        print 'before'
        rt = func(*args, **kwargs)
        print 'after'
        return rt

    return wrapper

@test_wrapper
def test_func():
    return 'test_func'


print test_func()