#encoding:utf-8
from flask import Flask
from apscheduler.schedulers.background import BackgroundScheduler

app = Flask(__name__,static_folder='static', template_folder='templates')

import users, cmdb, monitor, cost, statistics, code_release


sched = BackgroundScheduler()
sched.add_job(monitor.mongoback_info_auto_refresh_getip, 'cron', hour='10', minute='10')
sched.add_job(monitor.backupServer_monitor_cron, 'cron', hour='10,14', minute='20')

'''
#####间隔每20分钟执行一次
sched.add_job(monitor.backupServer_monitor_cron, 'interval', minute='20')

#####在指定的时间，只执行一次
sched.add_job(monitor.backupServer_monitor_cron, 'date', run_date='2016-02-14 15:01:05')

#####采用定时任务的方式执行,每天的10点20 和 14点20 分别执行一次
sched.add_job(monitor.backupServer_monitor_cron, 'cron', hour='10,14', minute='20')

具体可选参数如下:
           year (int|str) – 4-digit year
           month (int|str) – month (1-12)
           day (int|str) – day of the (1-31)
           week (int|str) – ISO week (1-53)
           day_of_week (int|str) – number or name of weekday (0-6 or mon,tue,wed,thu,fri,sat,sun)
           hour (int|str) – hour (0-23)
           minute (int|str) – minute (0-59)
           second (int|str) – second (0-59)

           start_date (datetime|str) – earliest possible date/time to trigger on (inclusive)
           end_date (datetime|str) – latest possible date/time to trigger on (inclusive)
           timezone (datetime.tzinfo|str) – time zone to use for the date/time calculations (defaults to scheduler timezone)

           *    any    Fire on every value
           */a    any    Fire every a values, starting from the minimum
           a-b    any    Fire on any value within the a-b range (a must be smaller than b)
           a-b/c    any    Fire every c values within the a-b range
           xth y    day    Fire on the x -th occurrence of weekday y within the month
           last x    day    Fire on the last occurrence of weekday x within the month
           last    day    Fire on the last day within the month
           x,y,z    any    Fire on any matching expression; can combine any number of any of the above expressions
'''


sched.start()   #采用的是阻塞的方式,只有一个线程专职做调度的任务