# encoding:utf-8
# 爬虫赶集网配合高德api加载周边租房信息
''
'''
本地启动http服务,监听8000端口,访问html
python2 -m SimpleHTTPServer 8000
'''
from bs4 import BeautifulSoup
from urlparse import urljoin
import requests
import csv
import html5lib


# 爬取租房网站
def house_get(URLs, end_page, price):
    with open('house.csv', 'wb') as f:  # 创建一个csv文件,创建一个f的变量
        csv_writer = csv.writer(f, delimiter=',')  # 创建writer对象,以逗号分隔('天通苑一区', '天通苑', '7000')
        for URL in URLs:
            start_page = 1  # 默认从第一页开始爬取
            n = URL.split(".")[1]
            ADDR = 'http://' + URL.split("/")[2] + "/"
            if n == 'ganji':
                print '开始爬取赶集网租房信息......'
                while start_page <= end_page:
                    start_page += 1
                    print 'get:{0}'.format(URL.format(page=start_page, price=price))
                    response = requests.get(URL.format(page=start_page, price=price))  # 抓取目标页面
                    html = BeautifulSoup(response.text, 'html.parser')  # 第一个参数是要抓取的html页面征文,第二个参数是使用哪种解析器
                    house_list = html.select('.f-list > .f-list-item > .f-list-item-wrap')  # 获取房源信息,前端页面中class标签名
                    if not house_list:
                        break
                    for house in house_list:
                        house_title = house.select('.title > a')[0].string.encode('utf-8')
                        house_addr = house.select('.address > .area > a')[-1].string.encode('utf-8')
                        house_price = house.select('.info > .price > .num ')[0].string.encode('utf-8')
                        house_url = urljoin(ADDR, house.select('.title > a')[0]['href'])
                        csv_writer.writerow([house_title, house_addr, house_price, house_url])
            elif n == '58':
                print '开始爬取58同城租房信息......'
                while start_page <= end_page:
                    start_page += 1
                    print 'get:{0}'.format(URL.format(page=start_page, price=price))
                    response = requests.get(URL.format(page=start_page, price=price))  # 抓取目标页面
                    html = BeautifulSoup(response.text, 'html.parser')  # 第一个参数是要抓取的html页面征文,第二个参数是使用哪种解析器
                    house_list = html.select('.main > .list > li')  # 获取房源信息,前端页面中class标签名
                    if not house_list:
                        break
                    for house in house_list:
                        # print house
                        try:
                            house_title = house.select('.des > h2')[0].string.encode('utf-8')
                            house_info_list = house_title.split()
                            if "公寓" in house_info_list[1] or "青年社区" in house_info_list[1]:
                                house_addr = house_info_list[0]
                            else:
                                house_addr = house_info_list[1]
                            house_price = house.select('.money')[0].select('b')[0].string.encode('utf-8')
                            house_url = urljoin(ADDR, house.select('a')[0]['href'])
                            csv_writer.writerow([house_title, house_addr, house_price, house_url])
                        except BaseException, e:
                            print e
    print '爬取结束......'


if __name__ == '__main__':
    end_page = 20  # 结束爬取得结束页面
    price = 7  # 爬取得加价格
    URL = ['http://bj.ganji.com/fang1/o{page}/', 'http://bj.58.com/pinpaigongyu/pn/{page}/']
    house_get(URL, end_page, price)
