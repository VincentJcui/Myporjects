#encoding:utf-8
'''
【程序53】
题目：学习使用按位异或 ^ 。　　　
1.程序分析：0^0=0; 0^1=1; 1^0=1; 1^1=0
2.程序源代码：
'''
if __name__ == '__main__':
    a = 077
    b = a ^ 3
    print 'The a ^ 3 = %d' % b
    b ^= 7
    print 'The a ^ b = %d' % b