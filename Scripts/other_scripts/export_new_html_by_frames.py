# -*- coding: UTF-8 -*-
from __future__ import division
import ordereddict
import os
import pymongo
import simplejson as json
import time
import urllib2
import csv

def gen_frame_lines(fp, server, collection, month, day):
	frame_25 = {}
	frame_25_rate = {}
	frame_39 = {}
	frame_39_rate = {}
	frame_100 = {}
	frame_100_rate = {}
	frame_total = {}

	for server_id, server_name in server.items():
		cursor = collection.find({"_id":"1009"},{server_id:1,"_id":0})
		frame_25[server_id] = 1
		for result_object in cursor:
			try:
				frame_25[server_id] = result_object[server_id][str(month)][str(day)]
			except Exception as e:
				print e
				pass

		cursor = collection.find({"_id":"1010"},{server_id:1,"_id":0})
		frame_39[server_id] = 1
		for result_object in cursor:
			try:
				frame_39[server_id] = result_object[server_id][str(month)][str(day)]
			except Exception as e:
				print e
				pass

		cursor = collection.find({"_id":"1011"},{server_id:1,"_id":0})
		frame_100[server_id] = 1
		for result_object in cursor:
			try:
				frame_100[server_id] = result_object[server_id][str(month)][str(day)]
			except Exception as e:
				print e
				pass

		frame_total[server_id] = frame_25[server_id] + frame_39[server_id] + frame_100[server_id]
		frame_25_rate[server_id] = frame_25[server_id] / float(frame_total[server_id])
		frame_39_rate[server_id] = frame_39[server_id] / float(frame_total[server_id])
		frame_100_rate[server_id] = frame_100[server_id] / float(frame_total[server_id])

		line_status = "%s,%s,%s | %s,%s | %s,%s | %s" % \
(str(month)+"-"+str(day), server_name["Chinese"], frame_25[server_id], frame_25_rate[server_id], frame_39[server_id], frame_39_rate[server_id], frame_100[server_id], frame_100_rate[server_id])
		fp.write(line_status)
        fp.write('\n')

ENTER_GAME_FIELD={
        1:["3031","3033"],#total game
        2:["3038","3039"],#team
        3:["3040","3041"],#enter room
        4:["3042","3043"],#enter hall
        5:["3044","3045"],#enter room first time
        6:["3046","3047"],#enter hall first time
        7:["3048","3049"],#enter battle first time
        8:["3033","3050"],#battle lost connection
        9:["3049","3051"], #battle lost connection first time
        10:["3055","3054"], #ladder battle lost connection
        11:["3055","3054"], #ladder battle lost connection first tim
        12:["3033","3056"], #trans lost connection
        13:["3033","3057"], #invalid speed lost connection
		14:["3085","3086"], #invalid speed lost connection
}
server_4399 = ordereddict.OrderedDict()
server_4399["25"] = {"Chinese":"4399联通9区", "English":"fps3.sy.ppweb.com.cn",
"url_frame":"http://state.lieyan.com.cn/GlobalMetrics/?partner=FPS_fps3.sy.ppweb.com.cn&level=SubPartner&fields=fpsFrameRate,fpsFrame25,fpsFrame39,fpsFrame100&tag=FPS",
"url_mouse":"http://state.lieyan.com.cn/GlobalMetrics/?partner=FPS_fps3.sy.ppweb.com.cn&level=SubPartner&fields=fpsMouseRate,fpsMouse20,fpsMouse30,fpsMouse50,fpsMouse75&tag=FPS",
"url_rtt":"http://state.lieyan.com.cn/GlobalMetrics/?partner=FPS_fps3.sy.ppweb.com.cn&level=SubPartner&fields=fpsRTT100,fpsRTT200,fpsRTT300,fpsRTT500,fpsRTT1000,fpsRTT10000,fpsRTTRate&tag=FPS",
"url_load":"http://state.lieyan.com.cn/GlobalMetrics/?partner=FPS_fps3.sy.ppweb.com.cn&level=SubPartner&fields=fpsStartLoad,fpsLoadConfig,fpsLoadUI,fpsFail,fpsConnectXserver,fpsConnectXserverSuccess,fpsConnectXserverFail&tag=FPS",
"url_health":"http://fps3.sy.ppweb.com.cn:8080/DarkForestService/Health",
"match_health":"http://fps3.sy.ppweb.com.cn:8081/MatchServer/Health",
"battle_health":"http://fps3.sy.ppweb.com.cn:8082/BattleServer/Health",
"url_health_realtime":"http://state.lieyan.com.cn/GlobalMetrics/?partner=FPS_fps3.sy.ppweb.com.cn&level=SubPartner&fields=fpsSession,fpsSevere&tag=FPS"
}

if __name__ == '__main__':
    year, month, day, hour = time.localtime(time.time())[:4]
    client = pymongo.MongoClient("127.0.0.1", 27017)
    db = client.datamine
    collection = db.p4399v0224
    fp = file("/home/op/sh/4399_9.csv", "wb")
    writer = csv.writer(fp)
    writer.writerow(['日期','区服','小于25帧','25到39帧','大于39帧'])
    m = [12,1,2,3]
    day12 = day1 = 31
    day2 = 30
    for month in m:
        for day in range(1,32):
            print month,day
            if month == 2 and day > 30:
                continue
            elif month == 3 and day > 4:
                continue
            else:
                gen_frame_lines(fp, server_4399, collection, month, day)
    fp.close()