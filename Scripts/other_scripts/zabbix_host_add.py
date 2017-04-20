#!/usr/bin/env python
# coding:utf-8

import json
import urllib2
import socket, fcntl, struct


def get_localIp(ifname='eth0'):
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        inet = fcntl.ioctl(s.fileno(), 0x8915, struct.pack('256s', ifname[:15]))
        ret = socket.inet_ntoa(inet[20:24])
        hostname = socket.gethostname()
        return ret, hostname
    except IOError as e:
        print e


def get_authId(url, header, user, password):
    data = json.dumps(
        {"jsonrpc": "2.0",
         "method": 'user.login',
         "params": {
             "user": user,
             "password": password
         },
         "id": 0
         })

    request = urllib2.Request(url, data)

    for key in header:
        request.add_header(key, header[key])

    try:
        result = urllib2.urlopen(request)
    except urllib2.URLError as e:
        print "Auth Failed, Please Check Your Name And Password:", e.code

    else:
        response = json.loads(result.read())
        result.close()
        return response['result']


def addHost_data(host, ip, groupid, authId, templateid, port):
    templateids = []
    groupids = []
    for i in templateid:
        templateids.append({"templateid": i})
    for i in groupid.split(','):
        groupids.append({"groupid": i})
    data = json.dumps(
        {
            "jsonrpc": "2.0",
            "method": "host.create",
            "params": {
                'host': host,
                'interfaces': [
                    {
                        'type': 1,
                        'main': 1,
                        'useip': 1,
                        "ip": ip,
                        "dns": "",
                        "port": port

                    }
                ],
                "groups": groupids,
                "templates": templateids
            },
            "auth": authId,
            "id": 1
        })
    return data


def get_result(url, header, data):
    request = urllib2.Request(url, data)
    for key in header:
        request.add_header(key, header[key])
    # get host list
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
        if response['result']:
            return response
        else:
            return '获取错误'


def addHost(url, header, authId):
    data = addHost_data(host, ip, "14", authId, templateid=["10105", "10001"], port="10050")
    res = get_result(url, header, data)
    if 'result' in res.keys():
        res = res['result']
        if 'hostids' in res.keys():
            print "\033[1;32;40m%s\033[0m" % "Create host success"
    else:
        print "\033[1;31;40m%s\033[0m" % "Create host failure: %s" % res['error']['data']


if __name__ == '__main__':
    ip, host = get_localIp('eth0')
    url = 'http://10.13.3.13/zabbix/api_jsonrpc.php'
    header = {"Content-Type": "application/json"}
    user = 'admin'
    password = 'zabbix'
    authId = get_authId(url, header, user, password)
# addHost(url,header,authId)
