#encoding:utf-8
import time
import random

start = time.time()
heighs = [165, 168, 155, 179, 2323, 169, 173, 175, 178, 160]


'''
冒泡排序算法
'''
def bubble_sort(list_num, rev=True):
    for x in range(0,len(list_num)-1):
        for y in range(0,len(list_num)-x-1):
            if rev:
                if list_num[y] > list_num[y+1]:
                    list_num[y], list_num[y+1] = list_num[y+1], list_num[y]
            else:
                if list_num[y] < list_num[y+1]:
                    list_num[y], list_num[y+1] = list_num[y+1], list_num[y]
    return list_num

    pass

'''
插入排序法
'''
def inset_sort(list_num, rev=True):
    for x in range(len(list_num)):
        for y in range(x+1, len(list_num)):
            if rev:
                if list_num[x] > list_num[y]:
                    list_num[x], list_num[y] = list_num[y], list_num[x]
            else:
                if list_num[x] < list_num[y]:
                    list_num[x], list_num[y] = list_num[y], list_num[x]

    return list_num

    pass



'''
二分查找:

二分法查找的基本算法是 在一个有序的list中判断元素是否在list中，比较方法主要是，将当前元素和list中间的数字进行比较，
如果当前元素比中间的数字小，那就可以在list的前半段进行查找，如果比中间的元素大，那就可以在list的后半段查找，如果和中
间的数字相同，那就意味已找到，按照这个思路（主要是变换在list中查找的开始位置start和结束位置end）直到找到相等的元素
（找到），或者是直到变换后的start>end（没找到）
'''
def binary_search(num_list):
   nums = int(raw_input("%s 请从列表中选择查找的数字:" % num_list))
   left = 0
   right = len(num_list)-1
   n = 1
   while True:
       if left <= right:
           mid = (left+right)/2
           # print left, right, mid
           if nums == num_list[mid]:
               print "您输入的数字:%s 在列表的索引位置为:%s,对应值为%s,共执行了%s次查找" % (nums, mid, num_list[mid], n) ,
               break
           elif nums > num_list[mid]:
               left = mid + 1
           else:
               right = mid - 1
           n = n + 1
       else:
           print "您输入的数字:%s不在列表中,共执行了%s次查找" % (nums,n) ,
           break

'''
#猜数字的游戏
'''

def guess_num():
    n = 0
    nums = random.randint(0,100)
    while True :
        guess = int(raw_input('请在0-100的数字中猜一个数:'))
        if guess >100 or guess < 0 :
            print "您输入的数字超出范围,请重新输入"
        else:
            if nums == guess:
                print "恭喜你猜对了!合计一共猜了%s次,猜错%s次" % (n,n-1) ,
                break
            elif guess > nums:
                print "您猜的数字太大了"
            else:
                print "您猜的数字太小了"
        n += 1








if __name__ == "__main__":
    # a = inset_sort(heighs, rev=True)
    # print a
    # b = bubble_sort(heighs, rev=True)
    # print b
    #二分查找必须是有序的队列
    # listc = [-1, 5, 6, 10, 23, 34, 123, 213, 344, 435, 65535]
    # binary_search(bubble_sort(heighs+listc))

    guess_num()

    print '算法排序用时: %ss' % (time.time()-start)
    pass