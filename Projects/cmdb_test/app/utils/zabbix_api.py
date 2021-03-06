# encoding:utf-8
# by 2017-03-20
import json
import urllib2
import sys
import re
from StringIO import StringIO

import re


class Zabbixtools:
    # 初始化,地址,头部信息
    def __init__(self):
        self.url = "http://zabbix.lieyan.com.cn/api_jsonrpc.php"
        self.header = {"Content-Type": "application/json"}
        self.username = 'admin'
        self.password = 'zabbix密码'
        self.authID = self.user_login()

    # 用户登陆认证,获取authid,调用user.login 方法
    def user_login(self):
        data = json.dumps(
            {
                "jsonrpc": "2.0",
                "method": "user.login",
                "params": {
                    "user": self.username,
                    "password": self.password,
                },
                "id": 0,
            }
        )
        request = urllib2.Request(self.url, data)
        for key in self.header:
            request.add_header(key, self.header[key])
        try:
            result = urllib2.urlopen(request)
        except BaseException as e:
            print "登陆失败,请检查您的密码:", e.code
        else:
            ####处理对字符串中出现异常字符的重新编码,解决json.loads报错的问题
            # tt = result.read()
            # t1 = re.sub(r"(,?)(\w+?)\s*?:",r"\1'\2':",tt)
            # t2 = t1.replace("'", "\"")
            #####
            response = json.loads(result.read())
            result.close()
            authID = response['result']
            # print "Auth Successful, AuthID: %s" % authID
            return authID

    # 获取数据的方法
    def get_data(self, data):
        request = urllib2.Request(self.url, data)
        for key in self.header:
            request.add_header(key, self.header[key])
        try:
            result = urllib2.urlopen(request)
        except urllib2.URLError as e:
            if hasattr(e, 'reason'):
                print 'We failed to reach a server.'
                print 'Reason: ', e.reason
            elif hasattr(e, 'code'):
                print 'The server could not fulfill the request.'
                print 'Error code: ', e.code
        else:
            response = json.loads(result.read())
            result.close()
            return response

    # 获取主机网络信息,调用hostinterface.get方法
    def hostinterface_get(self, hostid):
        data = json.dumps(
            {
                "jsonrpc": "2.0",
                "method": "hostinterface.get",
                "params": {
                    "output": "extend",
                    "hostids": hostid,
                    # "filter": {"hostids": hostid}
                },
                "auth": self.authID,
                "id": 1
            }
        )

        res = self.get_data(data)['result']
        if (res != 0) and (len(res) != 0):
            return res[0]
        else:
            return 0

    # 根据IP或者域名判断主机是否在监控中
    def host_get_hostid(self, host):
        data = json.dumps(
            {
                "jsonrpc": "2.0",
                "method": "hostinterface.get",
                "params": {
                    "output": ["hostid", 'ip', 'dns'],
                },
                "auth": self.authID,
                "id": 1
            }
        )
        res = self.get_data(data)['result']
        result = {}
        for x in res:
            if x['ip'] == host or x['dns'] == host:
                result = x
        return result




    # 获取host信息,调用host.get 方法
    def host_get(self, host=""):
        # hostip = raw_input("\033[1;35;40m%s\033[0m" % 'Enter Your Check Host:Host_ip :')
        data = json.dumps(
            {
                "jsonrpc": "2.0",
                "method": "host.get",
                "params": {
                    "output": ["hostid", "name", "status", "host"],
                    # "output": "extend",
                    "filter": {"hostid": host}
                },
                "auth": self.authID,
                "id": 1
            })
        res = self.get_data(data)['result']
        # for x,y in res[0].items():
        #     print "%s : %s" % (x,y)
        if (res != 0) and (len(res) != 0):
            # for host in res:
            if host == "":
                return res
            host = res[0]
            return host  # 直接返回hots信息
            if host['status'] == '1':
                # print "\t","\033[1;31;40m%s\033[0m" % "Host_IP:","\033[1;31;40m%s\033[0m" %host['host'].ljust(15),'\t',"\033[1;31;40m%s\033[0m" % "Host_Name:","\033[1;31;40m%s\033[0m"% host['name'].encode('UTF-8'),'\t',"\033[1;31;40m%s\033[0m" % u'未在监控状态'.encode('UTF-8')
                print "HostID:%s , name:%s , host:%s , status:%s, interface:" % (
                host['hostid'], host['name'], host['host'], host['status'])
                return host
            elif host['status'] == '0':
                # print "\t","\033[1;32;40m%s\033[0m" % "Host_IP:","\033[1;32;40m%s\033[0m" %host['host'].ljust(15),'\t',"\033[1;32;40m%s\033[0m" % "Host_Name:","\033[1;32;40m%s\033[0m"% host['name'].encode('UTF-8'),'\t',"\033[1;32;40m%s\033[0m" % u'在监控状态'.encode('UTF-8')
                print "HostID:%s , name:%s , host:%s , status:%s, interface:%s" % (
                host['hostid'], host['name'], host['host'], host['status'],
                self.hostinterface_get(host['hostid'])['ip'])
                return host
            print
        else:
            print '\t', "\033[1;31;40m%s\033[0m" % "Get Host Error or cannot find this host,please check !"
            return 0

    def host_del(self):
        hostip = raw_input("\033[1;35;40m%s\033[0m" % 'Enter Your Check Host:Host_ip :')
        hostid = self.host_get(hostip)
        if hostid == 0:
            print '\t', "\033[1;31;40m%s\033[0m" % "This host cannot find in zabbix,please check it !"
            sys.exit()
        data = json.dumps(
            {
                "jsonrpc": "2.0",
                "method": "host.delete",
                "params": [{"hostid": hostid}],
                "auth": self.authID,
                "id": 1
            })
        res = self.get_data(data)['result']
        print res
        if 'hostids' in res.keys():
            print "\t", "\033[1;32;40m%s\033[0m" % "Delet Host:%s success !" % hostip
        else:
            print "\t", "\033[1;31;40m%s\033[0m" % "Delet Host:%s failure !" % hostip

    def hostgroupid_get(self, hostid):
        data = json.dumps(
            {
                "jsonrpc": "2.0",
                "method": "host.get",
                "params": {
                    "output": ["hostid"],
                    "selectGroups": "extend",
                    "filter": {
                        "hostid": [hostid]
                    }
                },
                "auth": self.authID,
                "id": 2,
            })
        res = self.get_data(data)
        if 'result' in res.keys():
            return res['result']
        else:
            print "Get HostGroupID Error,please check !"

    def hostgroup_get(self):
        data = json.dumps(
            {
                "jsonrpc": "2.0",
                "method": "hostgroup.get",
                "params": {
                    "output": "extend",
                },
                "auth": self.authID,
                "id": 1,
            })
        res = self.get_data(data)
        if 'result' in res.keys():
            res = res['result']
            if (res != 0) or (len(res) != 0):
                print "\033[1;32;40m%s\033[0m" % "Number Of Group: ", "\033[1;31;40m%d\033[0m" % len(res)
                for host in res:
                    print"\t", "HostGroup_id:", host['groupid'], "\t", "HostGroup_Name:", host['name'].encode('GBK')
                print
        else:
            print "Get HostGroup Error,please check !"

    def templateid_get(self, hostid):
        data = json.dumps(
            {
                "jsonrpc": "2.0",
                "method": "host.get",
                "params": {
                    "output": ["hostid"],
                    "selectParentTemplates": [
                        "templateid",
                        "name"
                    ],
                    "hostids": hostid
                },
                "id": 1,
                "auth": self.authID
            })
        res = self.get_data(data)
        if 'result' in res.keys():
            return res['result']
        else:
            print "Get HostGroupID Error,please check !"

    def template_get(self):
        data = json.dumps(
            {
                "jsonrpc": "2.0",
                "method": "template.get",
                "params": {
                    "output": "extend",
                },
                "auth": self.authID,
                "id": 1,
            })
        res = self.get_data(data)  # ['result']
        if 'result' in res.keys():
            res = res['result']
            if (res != 0) or (len(res) != 0):
                print "\033[1;32;40m%s\033[0m" % "Number Of Template: ", "\033[1;31;40m%d\033[0m" % len(res)
                for host in res:
                    print"\t", "Template_id:", host['templateid'], "\t", "Template_Name:", host['name'].encode('GBK')
                print
        else:
            print "Get Template Error,please check !"

    def get_grapgs(self,hostid,name):
        data = json.dumps(
            {
                "jsonrpc": "2.0",
                "method": "graph.get",
                "params": {
                    'selectGraphs': ['graphid',"name"],
                    "filter": {"hostid":hostid,"name":name},
                },
                "auth": self.authID,
                "id": 1,
            })
        res = self.get_data(data)['result']
        # print res
        return res[0].get('graphid')
        pass

    def get_graphs_list(self, name, hostid_list, columns):
        # print name
        # print hostid
        # print columns
        graphs = []
        for hostid in hostid_list:
            data = json.dumps(
                {
                    "jsonrpc": "2.0",
                    "method": "graph.get",
                    "params": {
                        'selectGraphs':['graphid'],
                        # 'select':[name,'name'],
                        'output':"extend",
                        "hostids":hostid['hostid'],
                        "filter": {'name': name},
                        "sortfield": 'name',

                    },
                    "auth": self.authID,
                    "id": 1,
                })
            res = self.get_data(data)
            if 'result' in res.keys():
                res = res['result']
            for i in res:
                graphs.append(i['graphid'])
        graphs_list = []
        x = 0
        y = 0
        for z in graphs:  # 注意这里走了个捷径,为了去掉模板的图像,故用了res[1:]
            # print z
            # print '================'
            graphs_list.append(
                {
                    "resourcetype": 0,
                    "resourceid": z,
                    "width": 500,
                    "height": 100,
                    "dynamic": 1,
                    "x": x,
                    "y": y,

                }
            )
            x += 1
            if x == int(columns):
                x = 0
                y += 1
        return graphs_list

    def screen_creat(self, screen_name='', graphs_list=''):
        get_data = json.dumps({
            "jsonrpc": "2.0",
            "method": "screen.get",
            "params": {
                "output": "extend",
                # 过滤Screen
                "filter": {"name": screen_name},
            },
            "auth": self.authID,
            "id": 1
        })
        if len(graphs_list) % 3 == 0:
            vsize = len(graphs_list) / 3 + 1
        else:
            vsize = len(graphs_list) / 3
        creat_data = json.dumps({
            "jsonrpc": "2.0",
            "method": "screen.create",
            "params": {
                "name": screen_name,
                # Screen的宽度
                "hsize": 2,
                # Screen的长度
                "vsize": vsize,
                # Screen的item信息
                "screenitems": graphs_list,
                "sortfield": 'resourceid',
            },
            "auth": self.authID,
            "id": 1
        })
        res = self.get_data(get_data)
        if res['result'] == []:
            res = self.get_data(creat_data)
            if 'result' in res.keys():
                res = res['result']
                return res
        else:
            screen_id = res['result'][0].get('screenid', '')
            update_data = json.dumps({
                "jsonrpc": "2.0",
                "method": "screen.update",
                "params": {
                    # ScreenID
                    "screenid": screen_id,
                    # 计算Screen的行数
                    "vsize": vsize,
                    # Screen的item
                    "screenitems": graphs_list,
                },
                "auth": self.authID,
                "id": 1
            })
            res = self.get_data(update_data)
            if 'result' in res.keys():
                res = res['result']
                return res







    def host_create(self):
        hostip = raw_input("\033[1;35;40m%s\033[0m" % 'Enter your:Host_ip :')
        groupid = raw_input("\033[1;35;40m%s\033[0m" % 'Enter your:Group_id :')
        templateid = raw_input("\033[1;35;40m%s\033[0m" % 'Enter your:Tempate_id :')
        g_list = []
        t_list = []
        for i in groupid.split(','):
            var = {}
            var['groupid'] = i
            g_list.append(var)
        for i in templateid.split(','):
            var = {}
            var['templateid'] = i
            t_list.append(var)
        if hostip and groupid and templateid:
            data = json.dumps(
                {
                    "jsonrpc": "2.0",
                    "method": "host.create",
                    "params": {
                        "host": hostip,
                        "interfaces": [
                            {
                                "type": 1,
                                "main": 1,
                                "useip": 1,
                                "ip": hostip,
                                "dns": "",
                                "port": "10050"
                            }
                        ],
                        "groups": g_list,
                        "templates": t_list,
                    },
                    "auth": self.authID,
                    "id": 1,
                })
            res = self.get_data(data, hostip)
            if 'result' in res.keys():
                res = res['result']
                if 'hostids' in res.keys():
                    print "\033[1;32;40m%s\033[0m" % "Create host success"
            else:
                print "\033[1;31;40m%s\033[0m" % "Create host failure: %s" % res['error']['data']
        else:
            print "\033[1;31;40m%s\033[0m" % "Enter Error: ip or groupid or tempateid is NULL,please check it !"


if __name__ == "__main__":
    test = Zabbixtools()

    # 主机组获取'10257'
    # test.hostgroup_get()
    # print test.hostgroupid_get('10257')

    # 模板获取
    # test.template_get()
    # print test.templateid_get('10224')

    # 主机获取,如果指定hostid,则只获取当前指定id的信息,如未指定,则获取全部host信息
    print test.host_get('10161')

    # 获取批量服务器的host
    all_host = test.host_get()
    pattern = re.compile(r'fps[0-9]*.gd')  # 正则匹配广东
    hostid_list = []

    #all_host需要排序
    for i in all_host:
        if pattern.findall(i.get('name')):
            hostid_list.append(i)
    sort_host_list = sorted(hostid_list, key=lambda t:int(t['name'].split('.')[0].split('fps')[1]))

    # 图像获取
    #创建csbh_status的Screen
    graphs_list = test.get_graphs_list( 'CPU_apps', sort_host_list, 3)
    test.screen_creat(screen_name='csbh_status', graphs_list=graphs_list)

    #创建csbh_cpu的Screen
    graphs_list = test.get_graphs_list('cpu', sort_host_list, 3)
    test.screen_creat(screen_name='csbh_cpu', graphs_list=graphs_list)

    #创建csbh_load的Screen
    graphs_list = test.get_graphs_list('Cpu_load', sort_host_list, 3)
    test.screen_creat(screen_name='csbh_load', graphs_list=graphs_list)

    # 创建csbh_disk的Screen
    graphs_list = test.get_graphs_list('Disk_use_/', sort_host_list, 3)
    test.screen_creat(screen_name='csbh_disk', graphs_list=graphs_list)

    #创建csbh_online的Screen
    graphs_list = test.get_graphs_list('onlineplayer', sort_host_list, 3)
    test.screen_creat(screen_name='csbh_online', graphs_list=graphs_list)

    # screen创建
    # test.screen_creat(screen_name='csbh_load', graphs_list=graphs_list)


    # 主机网络信息获取
    # print test.hostinterface_get('10190')
    # print test.host_get_hostid('120.92.253.11')
