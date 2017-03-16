#encoding:utf-8
'''
多线程的应用

'''
import urllib2
import time
import threading
from threading import Thread
from threading import Lock
import sys
lock = Lock()

'''
实例1
'''
class GetUrlThread(Thread):
    def __init__(self, url, n):
        self.url = url
        self.n = n
        super(GetUrlThread, self).__init__()
    def run(self):
        lock.acquire()
        try:
            resp = urllib2.urlopen(self.url)
        except urllib2.BaseHandler as e:
            print ''
        print self.n, self.url, resp.getcode()
        lock.release()

def get_responses():
    urls1 = ['http://www.google.com', 'http://www.amazon.com', 'http://www.ebay.com', 'http://www.alibaba.com', 'http://www.reddit.com']
    urls2 = ['http://www.baidu.com', 'http://www.sohu.com', 'http://www.qq.com', 'http://www.126.com', 'http://www.163.com']
    start = time.time()
    threads = []
    n = 1
    for url in urls2+urls1:
        t = GetUrlThread(url,n)
        threads.append(t)
        t.start()
        n += 1
    for t in threads:
        t.join()
    print "Elapsed time: %s" % (time.time()-start)

'''
实例2
'''

#define a global variable
some_var = 0

class IncrementThread(Thread):
    def run(self):
        #we want to read a global variable
        #and then increment it
        global some_var
        lock.acquire()
        read_value = some_var
        print "some_var in %s is %d" % (self.name, read_value)
        some_var = read_value + 1
        print "some_var in %s after increment is %d" % (self.name, some_var)
        lock.release()

def use_increment_thread():
    threads = []
    for i in range(50):
        t = IncrementThread()
        threads.append(t)
        t.start()
    for t in threads:
        t.join()
    print "After 50 modifications, some_var should have become 50"
    print "After 50 modifications, some_var is %d" % (some_var,)


'''
实例3  模拟开50线程进行http下载

简单修改,模拟支持ftp下载
'''

max_thread = 50
# 初始化锁
lock = threading.RLock()

class Downloader(threading.Thread):
    def __init__(self, url, start_size, end_size, fobj, buffer):
        self.url = url
        self.buffer = buffer
        self.start_size = start_size
        self.end_size = end_size
        self.fobj = fobj
        threading.Thread.__init__(self)

    def run(self):
        """
            马甲而已
        """
        with lock:
            print 'starting: %s' % self.getName()
        self._download()

    def _download(self):
        """
            我才是搬砖的
        """
        req = urllib2.Request(self.url)
        # 添加HTTP Header(RANGE)设置下载数据的范围
        req.headers['Range'] = 'bytes=%s-%s' % (self.start_size, self.end_size)
        f = urllib2.urlopen(req)
        # 初始化当前线程文件对象偏移量
        offset = self.start_size
        while 1:
            block = f.read(self.buffer)
            # 当前线程数据获取完毕后则退出
            if not block:
                with lock:
                    print '%s done.' % self.getName()
                break
            # 写如数据的时候当然要锁住线程
            # 使用 with lock 替代传统的 lock.acquire().....lock.release()
            # 需要python >= 2.5
            with lock:
                # sys.stdout.write('%s saveing block...' % self.getName())
                # 设置文件对象偏移地址
                self.fobj.seek(offset)
                # 写入获取到的数据
                self.fobj.write(block)
                offset = offset + len(block)
                # sys.stdout.write('done.\n')

def main(url, thread=3, save_file='', buffer=1024):
    #判断url是ftp还是http
    urltype = url.split(':')[0]
    # 最大线程数量不能超过max_thread
    thread = thread if thread <= max_thread else max_thread
    thread = 1 if urltype == 'ftp' else thread
    # 获取文件的大小
    req = urllib2.urlopen(url)
    size = int(req.info().getheaders('Content-Length')[0])
    # 初始化文件对象
    fobj = open(save_file, 'wb')
    # 根据线程数量计算 每个线程负责的http Range 大小
    # divmod(a,b)方法返回的是a//b（除法取整）以及a对b的余数
    # print size, thread
    avg_size, pad_size = divmod(size, thread)
    plist = []
    for i in xrange(thread):
        # print i, avg_size, pad_size
        start_size = i*avg_size
        end_size = start_size + avg_size - 1
        if i == thread - 1:
            # 最后一个线程加上pad_size
            end_size = end_size + pad_size + 1
        t = Downloader(url, start_size, end_size, fobj, buffer)
        plist.append(t)
    #  开始搬砖
    for t in plist:
        t.start()
    # 等待所有线程结束
    for t in plist:
        t.join()
    # 结束当然记得关闭文件对象
    fobj.close()
    print 'Download completed!'
    # print req.info()
if __name__ == '__main__':
    #测试实例1
    # get_responses()

    #测试实例2
    # use_increment_thread()s

    #测试实例3
    t = time.time()
    url = 'http://dldir1.qq.com/music/clntupate/QQMusic_Setup_1302.exe'
    # url = 'ftp://upload:upload@10.0.10.52/CSBH_WARS/2017-03-15-22-01-53/config20170315svn112244.zip'
    main(url=url, thread=5, save_file='/home/op/qq2017.exe', buffer=8192)
    # main(url=url, thread=10, save_file='/home/op/aa.zip', buffer=4096)
    print '耗时: %ss' % (time.time() - t)

    # handler  = urllib2.FTPHandler()
    # req = urllib2.urlopen(url='ftp://upload:upload@10.0.10.52/CSBH_WARS/2017-03-15-22-01-53/StateServer20170315svn112234.war')
    # print req.info()
    # opener = urllib2.build_opener(handler)
    # f = opener.open(req)

    pass