def add(a,b):
    return a+b
def sub(a,b):
    return a-b
def mul(a,b):
    return a*b
def div(a,b):
    return a/b
def square(a):
    return a**2


import calculator

print(calculator.add(10,20))
print(calculator.sub(50,20))
print(calculator.mul(10,20))

from calculator import add
print(add(10,20))

