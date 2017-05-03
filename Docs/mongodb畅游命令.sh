#!/usr/bin/env bash
mongoDB数据库使用

登入数据库:
mongo fps0.ty.ppweb.com.cn:27117/admin -u op -p mongodb密码  (在salt服务器上远程连接某台mongo)
mongo 172.16.2.11:27117/admin -u op -p mongodb密码  (注意IP地址)

show dbs  #查询有哪些数据库

use  DB_FPS_BETA_1   #进入到该库中

db.activity_9255.findOne({"_id":"922337929"})    #查询UID:1505978257 获取某个道具的信息

db.teams.findOne({"name":"梦工厂"})   #查询

show collections   #显示当前数据库中的集合（类似关系数据库中的表）

db.account.find();   #查看当前表中的数据

show users   #显示用户

db.help()       #显示数据库操作命令，里面有很多的命令 

db.foo.help()   #显示集合操作命令，同样有很多的命令，foo指的是当前数据库下，一个叫foo的集合，并非真正意义上的命令 

db.foo.find()   #对于当前数据库中的foo集合进行数据查找（由于没有条件，会列出所有数据） 

db.foo.find( { a : 1 } )   #对于当前数据库中的foo集合进行查找，条件是数据中有一个属性叫a，且a的值为1

db.getName();    #查看当前的数据库

db.stats();    #显示当前db的使用状态  

db.version();   #显示当前db的版本

db.toArray();   #格式化竖列显示

db.addUser('tank2','111')    #添加用户和密码;修改密码也可执行该操作,如果用户存在,则是更新密码.(注意操作之前需use admin 添加的即为管理员用户)

#命令行操作mongo
mongo
>use admin
>db.auth('op','mongodb密码')
>use DB_FPS_BETA_1



mongo
>use admin                           #进入管理员模式
>db.addUser('op','mongodb密码')   #创建管理员用户op和密码(可读可写)

>use test                            #进入普通用户模式
>db.addUser('op','mongodb密码')   #创建普通用户op和密码(可读可写)
>db.addUser('op','mongodb密码',true)   #创建普通用户op和密码(只读模式)


#查看数据库状态
> db.stats(); 
{ 
  "db" : "test",        //当前数据库 
  "collections" : 3,      //当前数据库多少表 
  "objects" : 4,        //当前数据库所有表多少条数据 
  "avgObjSize" : 51,      //每条数据的平均大小 
  "dataSize" : 204,      //所有数据的总大小 
  "storageSize" : 16384,    //所有数据占的磁盘大小 
  "numExtents" : 3, 
  "indexes" : 1,        //索引数 
  "indexSize" : 8176,     //索引大小 
  "fileSize" : 201326592,   //预分配给数据库的文件大小 
  "nsSizeMB" : 16, 
  "dataFileVersion" : { 
    "major" : 4, 
    "minor" : 5 
  }, 
  "ok" : 1 
} 

#查看数据表
> db.posts.stats(); 
{ 
  "ns" : "test.posts", 
  "count" : 1, 
  "size" : 56, 
  "avgObjSize" : 56, 
  "storageSize" : 8192, 
  "numExtents" : 1, 
  "nindexes" : 1, 
  "lastExtentSize" : 8192, 
  "paddingFactor" : 1, 
  "systemFlags" : 1, 
  "userFlags" : 0, 
  "totalIndexSize" : 8176, 
  "indexSizes" : { 
    "_id_" : 8176 
  }, 
  "ok" : 1 
} 

#查看mongodb锁
db.serverStatus()["globalLock"]
{
	"totalTime" : NumberLong(1425507000),    
	"lockTime" : NumberLong(2674771),
	"currentQueue" : {
		"total" : 0,
		"readers" : 0,
		"writers" : 0
	},
	"activeClients" : {
		"total" : 0,
		"readers" : 0,
		"writers" : 0
	}
}
// totalTime是数据库启动之后的总时间， 单位是micro second
// lockTime为处于锁定状态的时间。 如果锁定状态的时间占总时间较大的比例的话，说明很多请求实际上是在等待锁的释放
// current queue表示等待锁的请求数量。 reader表示在等待读锁的请求数量。 writers表示等待写锁的请求数量
// active clients表示处于连接状态的client的数量
// db.serverStatus()["locks"] 这个命令可以从一个更细的粒度查看锁的情况


#查询统计后台,通过取时间来查询
db.statsDay.find({"_id.t":{"$gt":ISODate("2016-02-01T00:00:00Z"),"$lt":ISODate("2016-02-02T00:00:00Z")}}).toArray()

#查询订单
db.payment.findOne()
db.payment.find({"_id":"2016021614183463683002"})   #根据订单号查询

#查询某天的记录,登陆盛大华北的数据库
> db.p7k7kv0224.find({"_id":"1042"},{"1.3.5":1})     #1.3.5 代表查询serverid为1  3月5日的数据,最后的1代表显示,0代表不显示
{ "1" : { "3" : { "5" : 2477 } }, "_id" : "1042" }
> db.p7k7kv0224.find({"_id":"1042"},{"1.3.5":1,"_id":0})    #1.3.5 代表查询serverid为1   3月5日的数据,最后的0代表把_id的信息关闭不显示
{ "1" : { "3" : { "5" : 2477 } } }
> 

#更新数据为0
db.pfengyunzhibov0224.update({"_id":"1042"},{"$set":{"1.3.7":NumberInt(1)}})

#00点之后迁服导致数据为空,查找数据为出现了两条数据
db.statsDay.find({"_id.t":{"$gte":ISODate("2016-04-03T16:00:00Z")}},{"nu":1})
db.statsDay.remove({"_id.p":9})  #删除多余的平台为9的初始化数据

#更新数据.update
db.banned.update({"id":7927},{$set:{"reason":"军团战加速、瞬移"}})

#删除数据.unset

#查看mongo的性能
mongotop -h 127.0.0.1 -vvvvv -u op -p 'mongodb密码'


mongostat -h 127.0.0.1 -vvvvv -u op -p 'mongodb密码'
insert  query update delete getmore command flushes mapped  vsize    res faults          locked db idx miss %     qr|qw   ar|aw  netIn netOut  conn       time 
     4     63     65      0       0      70       0   215g   431g   234m     20 DB_FPS_BETA_1:1.4%          0       0|0     0|0    37k    46k    60   17:57:04 
     1     65     43      0       0      45       0   215g   431g   242m      2 DB_FPS_BETA_1:0.5%          0       0|0     0|0    37k    37k    60   17:57:05 
     0      6      2      0       0       3       0   215g   431g   236m      0             .:0.1%          0       0|0     0|0     1k     7k    60   17:57:06 
     8     39     73      0       0      83       0   215g   431g   237m      1 DB_FPS_BETA_1:1.5%          0       0|0     0|0    36k    17k    60   17:57:07 
     1     76     45      0       0      47       0   215g   431g   233m     17 DB_FPS_BETA_1:1.8%          0       0|0     0|0    33k    21k    60   17:57:08 
     1      0      3      0       0       5       0   215g   431g   231m      0 DB_FPS_BETA_1:0.2%          0       0|0     0|0   989b     2k    60   17:57:09 
     0     14    105      0       0     106       0   215g   431g   232m      1 DB_FPS_BETA_1:1.8%          0       0|0     0|0    75k    16k    60   17:57:10 
     0     31     40      0       0      41       0   215g   431g   232m      5 DB_FPS_BETA_1:0.7%          0       0|0     0|0    20k    13k    60   17:57:11 
     0     71     38      0       0      39       0   215g   431g   235m     32 DB_FPS_BETA_1:0.5%          0       0|0     0|0    24k   101k    60   17:57:12 
     0     72     56      0       0      57       0   215g   431g   235m      2 DB_FPS_BETA_1:0.7%          0       0|0     0|0    55k    17k    60   17:57:13
	 
// insert query update delete分别代表一秒钟之内执行的操作次数
// res是mongod所占用的物理内存, faluts表示page faults的次数
// locked db是一个字段。 2.2之前是用locked字段。 2.2之后才有这个字段。 这个字段的含义， 不是太明白。 只能明确1点， 即展示的是所有db里面锁定时间 最长的db
// index miss是索引缺失的数量
// qr|qw 表示在队列中等待的客户端。 rw表示读和写。
// ar|aw 表示正在进行请求的客户端。 rw表示读和写。 至于为什么为0我也不是很明白。
// netIn 和 netOut表示网络流量，单位是字节 byte.
// conn表示连接数，这个没有什么好说。
// repl表示同步状态




#查询3035,3036的数据
 db.p4399v0224.find({"_id":"3035"},{"2.29":1}).toArray()
 db.p4399v0224.find({"_id":"3036"},{"2.29":1}).toArray()

#导入数据库 注意2.4.9 加了该参数: --authenticationDatabase admin
nohup nice -n -1 mongorestore -h 127.0.0.1 -d DB_FPS_BETA_1 --directoryperdb mongodb_dump/DB_FPS_BETA_1/ -u op -p mongodb密码 --authenticationDatabase admin --drop >/tmp/mongorestore_20150325.log 2>&1 &

#2.2.2的版本导入方法
nohup nice -n -1 mongorestore -h 127.0.0.1 -d DB_FPS_BETA_1 --directoryperdb mongodb_dump/DB_FPS_BETA_1/ -u op -p mongodb密码 --drop >/tmp/mongorestore_20150325.log 2>&1 &

#恢复某个表的语法
mongorestore -h 127.0.0.1 -d DB_FPS_BETA_1 -c teams --directoryperdb teams.bson  -u op -p mongodb密码 --drop
mongorestore -h 127.0.0.1 -d DB_FPS_BETA_1 -c team_apply --directoryperdb team_apply.bson  -u op -p mongodb密码 --drop
mongorestore -h 127.0.0.1 -d DB_FPS_BETA_1 -c team_battle --directoryperdb team_battle.bson  -u op -p mongodb密码 --drop
mongorestore -h 127.0.0.1 -d DB_FPS_BETA_1 -c team_gift --directoryperdb team_gift.bson  -u op -p mongodb密码 --drop
mongorestore -h 127.0.0.1 -d DB_FPS_BETA_1 -c team_member --directoryperdb team_member.bson  -u op -p mongodb密码 --drop
mongorestore -h 127.0.0.1 -d DB_FPS_BETA_1 -c teamRanking --directoryperdb teamRanking.bson  -u op -p mongodb密码 --drop
mongorestore -h 127.0.0.1 -d DB_FPS_BETA_1 -c team_recruit --directoryperdb team_recruit.bson  -u op -p mongodb密码 --drop
mongorestore -h 127.0.0.1 -d DB_FPS_BETA_1 -c team_season --directoryperdb team_season.bson  -u op -p mongodb密码 --drop