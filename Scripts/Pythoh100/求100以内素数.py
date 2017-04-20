# encoding:utf-8

def prime():
    for i in range(2, 101):
        fg = 0
        for j in range(2, i - 1):
            if i % j == 0:
                fg = 1
                break
        if fg == 0:
            print i


def is_prime(n):
    if n == 1:
        return False
    for i in range(2, n // 2 + 1):
        if n % i == 0:
            return False
    return True


if __name__ == '__main__':
    print filter(is_prime, range(2, 101))
