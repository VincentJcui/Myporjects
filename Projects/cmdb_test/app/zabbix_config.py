# encoding:utf-8
''
import cookielib
import urllib2
import urllib
from datetime import datetime

import os
from flask import render_template, request, jsonify, redirect
from . import app
from login_require import login_required
from utils import util, zabbix_api
import db
'''
zabbix配置界面,前端加载配置
by 2017-04-05
'''



display = util.Display()
display.display['monitor'] = 'block'
dis = display.display

zabbix = zabbix_api.Zabbixtools()


# 获取服务器IP,从server中和虚拟机中取得IP地址或者域名信息
def get_server():
    columns = ['hostname', 'lan_ip']
    domain_list_tmp = db.get_list(columns, 'virtuals')
    ip_list_tmp = db.get_list(['wan_ip'], 'server')
    domain_list = []
    for x in domain_list_tmp:
        if len(x['hostname'].split('/')) == 2:
            domain_list.append(x['hostname'].split('/')[1] + '.ppweb.com.cn')
        else:
            domain_list.append(x['lan_ip'])
    for y in ip_list_tmp:
        domain_list.append(y['wan_ip'])
    return domain_list


# 根据hostid获取groupid及groupname
def get_group_info(hostid):
    info = zabbix.hostgroupid_get(hostid)[0]
    groupinfo = []
    if len(info['groups']) == 1:
        if int(info['groups'][0]['groupid']) > 7:
            groupinfo.append({'groupid': info['groups'][0]['groupid'], 'groupname': info['groups'][0]['name']})
    else:
        tmp_id = []
        tmp_name = []
        for g in info['groups']:
            if int(g['groupid']) > 7:
                tmp_id.append(g['groupid'])
                tmp_name.append(g['name'])
        groupinfo.append({'groupid': ', '.join(tmp_id), 'groupname': ', '.join(tmp_name)})
    return groupinfo


# 根据hostid获取templateid及templatename
def get_template_info(hostid):
    info = zabbix.templateid_get(hostid)[0]
    templateinfo = []
    if len(info['parentTemplates']) == 1:
        templateinfo.append({'templateid': info['parentTemplates'][0]['templateid'],
                             'templatename': info['parentTemplates'][0]['name']})
    else:
        tmp_id = []
        tmp_name = []
        for t in info['parentTemplates']:
            tmp_id.append(t['templateid'])
            tmp_name.append(t['name'])
        templateinfo.append({'templateid': ', '.join(tmp_id), 'templatename': ', '.join(tmp_name)})
    return templateinfo


# 根据取得的域名或者IP获取zabbix中的详细信息
def get_server_monitor_status():
    domain_list = get_server()
    host_list = []
    for domain in domain_list:
        hostid = zabbix.host_get_hostid(domain).get('hostid', 0)
        if hostid != 0:
            host_info = zabbix.host_get(hostid)
            groupinfo = get_group_info(hostid)
            host_info.update(groupinfo[0])
            templateinfo = get_template_info(hostid)
            host_info.update(templateinfo[0])
            host_info['interface'] = domain
            host_list.append(host_info)
    return host_list

#获取当前状态下的zabbix监控图,保存至临时目录tmp目录下
class ZabbixGraph(object):
    def __init__(self,url="http://zabbix域名/index.php",name="admin",password='LADYgaga2015'):
        self.url=url
        self.name=name
        self.passwd=password
        #初始化的时候生成cookies
        cookiejar = cookielib.CookieJar()
        urlOpener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cookiejar))
        values = {"name":self.name,'password':self.passwd,'autologin':1,"enter":'Sign in'}
        data = urllib.urlencode(values)
        request = urllib2.Request(url, data)
        try:
            urlOpener.open(request,timeout=10)
            self.urlOpener=urlOpener
        except urllib2.HTTPError, e:
            print e
    def GetGraph(self,url="http://zabbix域名/chart2.php", values={'width': 800, 'height': 200, 'graphid': '2028', 'stime': '20160907090409', 'period': 3600}, image_dir='/tmp/zabbix'):
        data=urllib.urlencode(values)
        request = urllib2.Request(url,data)
        url = self.urlOpener.open(request)
        image = url.read()
        imagename="%s/%s_%s.jpg" % (image_dir, values["graphid"], values["stime"])
        #每次下载临时图片到该目录下,均把不是当天的文件删掉
        for i in os.listdir(image_dir):
            if datetime.now().strftime('%Y%m%d') not in i:
                os.remove('%s/%s' % (image_dir,i))
        f=open(imagename,'wb')
        f.write(image)
        f.close()
        return imagename

@app.route('/zabbix_monitor/', methods=['POST', 'GET'])
@login_required
def zabbix_monitor():
    if request.method == 'GET':
        return render_template('zabbix/zabbix_monitor.html', display = dis)
    host_list = get_server_monitor_status()
    print host_list[-1]
    # return render_template('zabbix/zabbix_monitor.html', host_list = host_list)
    return jsonify(host_list=host_list)
    pass

@app.route('/zabbix_graph_get/', methods=['POST', 'GET'])
@login_required
def zabbix_graph_get():
    graph = ZabbixGraph()
    columns = ['id', 'hostname']
    params = request.args if request.method == 'GET' else request.form
    id = params.get("id")
    type = params.get("type")
    if type == "online" :
        graphname = 'onlineplayer'
    elif type == 'cpu':
        graphname = 'cpu'
    elif type == 'apps':
        graphname = 'CPU_apps'
    else:
        graphname = 'Cpu_load'
    hostname = db.get_one(columns, "id=" + id, 'virtuals',list=True)[0][1].split("/")[1]
    hostid = zabbix.host_get_hostid(hostname+".ppweb.com.cn").get('hostid', 0)
    graphid = zabbix.get_grapgs(hostid,graphname)
    # print id, type, hostname, hostid, graphid
    values = {'width': 750, 'height': 210, 'graphid': graphid, 'stime': datetime.now().strftime('%Y%m%d%H%M%S'), 'period': 21600}
    image_name = graph.GetGraph("http://zabbix域名/chart2.php", values, "app/static/zabbix")
    imgsrc = '<img src="'+image_name.replace('app','')+'"></br>'
    return jsonify(imagerc=imgsrc)
    pass

if __name__ == '__main__':
    pass