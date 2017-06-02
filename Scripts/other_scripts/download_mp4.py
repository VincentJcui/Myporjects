# encoding: utf-8
# __author__ = 'VincentJcui'
# 爬取网站的mp4并下载到本地
# by 2017-06-02
import urllib2
import re
import sys
import time
import json
import Queue
import threading



def get_url(endpage, urllist, urlname):
    for count in range(2,endpage):
        url =  'http://www.aotu17.com/recent/'+str(count)+'/'
        html = urllib2.urlopen(url).read()
        find_re = re.findall(r'<div class="video".*?<a href="(/.*?/)".title=".*?".*?</div>', html, re.S)
        G = [i for i in find_re]
        for i in range(len(G)):
            try:
                mp4url = 'http://aotu17.com/%s' % (G[i])
                html1 = urllib2.urlopen(mp4url).read()
                mp4_re = re.findall(r'<video id=.*?<source src="(http://.*?\.mp4)".*?',html1,re.S)
                name_re = re.findall(r'<div class="row actions-container">.*?<h1>(.*?)</h1>.*?',html1,re.S)
                name_rm = ''.join(name_re)
                # print  'mp4url = %s  moviename = %s' % (mp4url, name_rm)
                urllist += mp4_re
                urlname.append(name_rm)
            except KeyboardInterrupt:
                sys.exit(0)
    return urllist,urlname

def save_mp4(urllist, urlname):
    while True:
        try:
            if len(urllist) == 0:
                print 'download end, bye bye'
                break
            print len(urllist)
            url = urllist.pop(0)
            name = urlname.pop(0)
            content = urllib2.urlopen(url).read()
            with open('/tmp/mp4/%s.mp4' % name, 'wb') as f:
                f.write(content)
        except KeyboardInterrupt:
            sys.exit()



def main():
    urllist = []
    urlname = []
    urllist, urlname = get_url(3, urllist, urlname)
    save_mp4(urllist, urlname)


if __name__ == '__main__':
    main()

