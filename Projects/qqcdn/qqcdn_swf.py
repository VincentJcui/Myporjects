#!/usr/bin/python
# -*- coding: utf-8 -*-

from src.QcloudApi.qcloudapi import QcloudApi
import sys

module = 'cdn'
action = 'RefreshCdnUrl'
config = {
    'Region': 'gz',
    'secretId': 'QQ云平台对应的账户ID',
    'secretKey': 'QQ云平台对应的账户秘钥',
    'method': 'post'
}
params = {
    'urls.0': 'http://fps.qq.kukuplay.com/res4399/'+sys.argv[1],
    'urls.1': 'http://fps.qq.kukuplay.com/res7k/'+sys.argv[2],
    'urls.2': 'http://fps.qq.kukuplay.com/res2144/'+sys.argv[3],
    'urls.3': 'http://fps.qq.kukuplay.com/res360wan/'+sys.argv[4],
    'urls.4': 'http://fps.qq.kukuplay.com/reskugou/'+sys.argv[5],
    'urls.5': 'http://fps.qq.kukuplay.com/restiexue/'+sys.argv[6],
    'urls.6': 'http://fps.qq.kukuplay.com/restencent/'+sys.argv[7],
}
try:
    service = QcloudApi(module, config)
    print service.generateUrl(action, params)
    print service.call(action, params)
    #service.setRequestMethod('get')
    #print service.call('DescribeCdnEntities', {})
except Exception, e:
    print 'exception:', e
