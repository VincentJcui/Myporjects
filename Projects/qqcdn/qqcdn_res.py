#!/usr/bin/python
# -*- coding: utf-8 -*-

from src.QcloudApi.qcloudapi import QcloudApi

module = 'cdn'
action = 'RefreshCdnUrl'
config = {
    'Region': 'gz',
    'secretId': 'QQ云平台对应的账户ID',
    'secretKey': 'QQ云平台对应的账户秘钥',
    'method': 'post'
}
params = {
    'urls.0': 'http://fps.qq.kukuplay.com/res4399/res0.1.15/',
    'urls.1': 'http://fps.qq.kukuplay.com/res7k/res0.1.15/',
    'urls.2': 'http://fps.qq.kukuplay.com/res2144/res0.1.15/',
    'urls.3': 'http://fps.qq.kukuplay.com/res360wan/res0.1.15/',
    'urls.4': 'http://fps.qq.kukuplay.com/reskugou/res0.1.15/',
    'urls.5': 'http://fps.qq.kukuplay.com/restiexue/res0.1.15/',
    'urls.6': 'http://fps.qq.kukuplay.com/restencent/res0.1.15/',
}
try:
    service = QcloudApi(module, config)
    print service.generateUrl(action, params)
    print service.call(action, params)
    #service.setRequestMethod('get')
    #print service.call('DescribeCdnEntities', {})
except Exception, e:
    print 'exception:', e
