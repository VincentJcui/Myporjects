#encoding:utf-8
'''
【程序80】
题目：海滩上有一堆桃子，五只猴子来分。第一只猴子把这堆桃子凭据分为五份，多了一个，这只
　　　猴子把多的一个扔入海中，拿走了一份。第二只猴子把剩下的桃子又平均分成五份，又多了
　　　一个，它同样把多的一个扔入海中，拿走了一份，第三、第四、第五只猴子都是这样做的，
　　　问海滩上原来最少有多少个桃子？
1.程序分析：
2.程序源代码：
'''
if __name__ == '__main__':
    for i in range(4,10000,4):
        count = 0
        m = i
        for k in range(5):
            j = i / 4 * 5 + 1
            i = j
            if j % 4 == 0:
                count += 1
            else:
                break
        i = m
        if count == 4:
            print count
            break
        
