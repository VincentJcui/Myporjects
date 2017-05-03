#!/usr/bin/env bash
1.解压mysql-standard-5.0.19-linux-i686-glibc23.tar.gz包。

    tar -xzf mysql-standard-5.0.19-linux-i686-glibc23.tar.gz

2.更改mysql-standard-5.0.19-linux-i686-glibc23为mysql_jcui

    mv mysql-standard-5.0.19-linux-i686-glibc23 mysql_jcui

3.修改mysql_jcui的组别和用户为jcui
    chown -R jcui:jcui mysql_jcui

#主从数据库

chown -R root.mysql /data1/mysql5
cd mysql5
chown -R mysql.mysql data
chmod 755 data


cd /data1/mysql/bin
ln -s -f mysqld_safe safe_mysqld      配合启动脚本使用


4.执行安装命令                                     指定用户为：jcui       指定安装路径为：/home/jcui/mysql_jcui/data
    /home/jcui/mysql_jcui/scripts/mysql_install_db --user=jcui --datadir=/home/jcui/mysql_jcui/data

	/data1/mysql5/scripts/mysql_install_db --user=mysql --datadir=/data1/mysql5/data

5.复制启动脚本到data目录下
    将mysql_jcui.sh  复制到data目录下   cp命令

6.确保使用mysql的用户为：jcui

7.登陆指定路径的mysql
    mysql -uroot -p --socket=/home/jcui/mysql_jcui/data/mysql.sock -A

8.修改mysql状态下的root密码
    1.mysql> use mysql;
    2.mysql> update user set password=password('新密码') where user='root';

	         update user set password=password('aaaaaaaa') where user='root';

    另外的方法：
	1.mysql> set password for root@localhost=password('test');
	2.shell>mysqladmin -uroot password test

	主从数据库复制需创建用户,命令如下：
	grant replication slave on *.* to 'repl'@'%' identified by 'repl';

9.新建mysql用户  例如新建test1的用户  密码为abc  可以在任何地方登陆mysql   访问所有数据库  且有查询，新建，修改，删除的权限。
    grant select,insert,update,delete on *.* to test1@"%" Identified by "abc";
	grant select,insert,update,delete on mydb.* to test1@"localhost" Identified by "abc";  只能在本地登录  且只能访问mydb数据库
	grant all privileges on *.* to test3@"%" identified by 'password' with grant option;    增加可以在任何地方访问数据库的超级用户

#flash

    update user set password=password('aaaaaaa') where user='sanguo';


    grant select on sanguo_101.* to pipcount@"%" Identified by "aaaaaaa";
	grant select on sanguo_101.* to pipcount@"localhost" Identified by "aaaaaaa";

	grant select on sanguo_101.* to sgselect@"%" Identified by "aaaaaaa##";
	grant select on sanguo_101.* to sgselect@"localhost" Identified by "aaaaaaa##";

#内网
	grant all privileges on misos.* to web3@"%" identified by 'web30218' with grant option;
	grant all privileges on misos.* to web3@"localhost" identified by 'web30218' with grant option;

10.新建数据库    并赋予该数据库某个用户具有完全访问的权限
    create database newdata;
	grant all privileges on newdata.* to jcui@localhost identified by '123123' with grant option;

	grant all privileges on *.* to astercti@"%"  identified by 'astercti' with grant option;
	这句增加一个本地具有所有权限的test用户（超级用户），密码是test。ON子句中的*.*意味着"所有数据库、所有表"。with grant option表示它具有grant权限。

	权限如下：
	select
	insert
	update
	delete
	create
	drop

11.数据库刷新命令
    flush privileges;

12.删除新数据库中的空用户
    mysql> delete from user where user='';


13.显示表的结构
    describe sales_rep;  						#显示sales_rep表的结构
	show table status\G;   						#查看表的状态及引擎
	show variables like '%storage_engine%';     #看你的mysql当前默认的存储引擎
	show engines								#显示当前数据库支持的存储引擎情况
	show variables;                             #查看mysql数据中各个参数设置
	set global max_allowed_packet=10000000;     #设置mysql库中的参数值 将max_allowed_packet设置为10M大小
	show variables like '%character%';          #查看系统的字符集
	show create database sanguo_33              #查看sanguo_33区的字符集。
    show create table tablename                 #查看建表语句

	SET SESSION tmp_table_size=64*1024*1024;
	SET SESSION max_heap_table_size=32*1024*1024;
	SHOW VARIABLES WHERE Variable_name LIKE %tmp_table_size%



14.重命名表:
    alter table t1 rename t2;    t1为命名前   t2为命名后

15.备份数据库

shell> mysqldump -h host -u root -p dbname >dbname_backup.sql

   恢复数据库

shell> mysqladmin -h myhost -u root -p create dbname

shell> mysqldump -h host -u root -p dbname < dbname_backup.sql

16.删除授权：

	revoke all privileges on sanguo_gm.* from sanguo@”%”;

	delete from user where user='pipstat' and host='localhost';
	delete from user where user='pipstat' and host='%';

	flush privileges;
17.
mysql>select host,user,password from user;    查看所有用户的数据库权限
mysql>use mysql;          调用mysql数据库
mysql>update user set user="wghgreat" where user="root";   修改root用户为wghgreat
mysql>select Host,User,Password,Select_priv,Grant_priv from user;   查询所有用户的权限含grant、select是否开启权限
mysql>delete from user where user='';    删除空用户
mysql>delete from user where password=;    删除空密码的用户
mysql>delete from user where host=%;      删除在任何地方可访问的用户。
mysql>drop database test;   删除test数据库
mysql>select version();     查询mysql的版本号
mysql>select id,max(FROM_UNIXTIME(lastlogintime,'%Y-%m-%d %H:%i:%s')) from player where FROM_UNIXTIME(lastlogintime,'%Y-%m-%d %H:%i:%s') > '2014-12-03 16:59:44';

18. 导出某个数据为sql文件   某个数据库的表为sql文件

mysqldump -u root -pBHlog2014 -S mysql.sock --default-character-set=utf8 --hex-blob --databases mzcq_01 > /home/jcui/mzcq_01.sql

mysqldump -userverinfo -pserverinfo --default-character-set=utf8 --hex-blob --databases csbh_stat --tables idc_data > /home/op/idc_data.sql

mysqldump -u root -pxgx@@dbroot@@2010 --socket=/data1/backmysql5_3310/data/mysql.sock --default-character-set=utf8 --hex-blob --databases sanguo_001 > sanguo_001.sql

mysqldump -uroot -pcy@@dbroot@@2010 --socket=/data1/mysql5/data/mysql.sock --default-character-set=gbk --hex-blob sanguo_133 player --where id=59738 > 59738.sql

mysqldump -u root -ppip123 --socket=/data1/mysql5/data/mysql.sock --default-character-set=utf8 --hex-blob --databases bugs > /home/jcui/bugs.sql

mysqldump -uroot -pcy@@dbroot@@2010 --socket=/data1/mysql5/data/mysql.sock --default-character-set=gbk --hex-blob -d sanguo_001 >sanguo.sql   #导出表结构

mysqldump -uroot -pdbpass --socket=/data1/mysql5/data/mysql.sock --default-character-set=gbk --hex-blob sanguo_133 player --where id=59738 > 59738.sql
mysqldump -u用户 -p密码 -hIP -P端口 --default-character-set=utf8 --hex-blob 数据库名字 表名 --where id=59738 > 59738.sql

mysqldump -uroot -ppip@@dbroot@@2008 -S /data2/mysql5_3307/data/mysql.sock  --default-character-set=utf8 --hex-blob -t --database msn_d003 --table playerext1 --where="id in (527448543,527447767,527438850,,527442024,527447963)" > /home/yang.liu/msn_d003_playerext1.sql     #导出多个ID值得表数据

#参数选项如下:
-t or –no-create-info 这个选项使的mysqldump命令不创建CREATE TABLE语句，这个选项在您只需要数据而不需要DDL（数据库定义语句）时很方便
-d or or -no-data  这个选项使的mysqldump命令不创建INSERT语句
-q or -quick   这个选项使得MySQL不会把整个导出的内容读入内存再执行导出，而是在读到的时候就写入导文件中
--lock-all-tables  如遇到锁表报错,可增加该参数


19. 恢复sql文件

登入数据库：执行source xxx.sql

20. 删除表

truncate table 表名  \\清空当前表的数据

21. 测试添加索引 以解决停服速度慢的问题

ALTER TABLE player ADD INDEX weekcredit_faction_index (weekcredit, faction);


22.  表优化功能 mysqlcheck

/data1/mysql5/bin/mysqlcheck -o -uroot -ppip@@dbroot@@2008 -S mysql.sock -A   对整个库进行optimize 优化

#3月5日优化
/data1/mysql5/bin/mysqlcheck -uroot -ppip@@dbroot@@2008 -S /data1/mysql5/data/mysql.sock --optimize account tbl_gameaccount
#3月12日优化
/data1/mysql5/bin/mysqlcheck -uroot -ppip@@dbroot@@2008 -S /data1/mysql5/data/mysql.sock --optimize account tbl_logininfo
23.  修改表的引擎

alter table tablename engine=InnoDB

alter table tablename engine=MyISAM


24.   数据库操作

插入数据
insert into data values ('','10.10.10.31','2012-09-28','08:09:10','87654323','1.56','0.27','0.47')

删除数据
delete from data where date=('2012-09-28');

清空数据表
truncate  table '表名'


25.   主从复制时的操作

slave stop;   停止复制
reset slave;  清除复制

26.   mysql字符类型
char   固定长度字符数据类型          如果希望列中的数据值大小接近一致，请使用 char
varchar   可变长度字符数据类型       如果希望列中的数据值大小显著不同，请使用 varchar

30.   修复root用户的权限
如果root 没有所有数据的权限
                    更新的MYSQL.USER表的所有字段中为Ｎ的为Ｙ就可以了。
                    update user set Select_priv ='Y' where user = 'root';
                    update user set Insert_priv ='Y' where user = 'root';
                    update user set Update_priv ='Y' where user = 'root';
                    update user set Delete_priv ='Y' where user = 'root';
                    update user set Create_priv ='Y' where user = 'root';
                    update user set Drop_priv ='Y' where user = 'root';
                    update user set Reload_priv ='Y' where user = 'root';
                    update user set Shutdown_priv ='Y' where user = 'root';
                    update user set Process_priv ='Y' where user = 'root';
                    update user set File_priv ='Y' where user = 'root';
                    update user set Grant_priv ='Y' where user = 'root';
                    update user set References_priv ='Y' where user = 'root';
                    update user set Index_priv ='Y' where user = 'root';
                    update user set Alter_priv ='Y' where user = 'root';
                    update user set Show_db_priv ='Y' where user = 'root';
                    update user set Super_priv ='Y' where user = 'root';
                    update user set Create_tmp_table_priv ='Y' where user = 'root';
                    update user set Lock_tables_priv ='Y' where user = 'root';
                    update user set Execute_priv ='Y' where user = 'root';
                    update user set Repl_slave_priv ='Y' where user = 'root';
                    update user set Repl_client_priv ='Y' where user = 'root';
                    update user set Create_view_priv ='Y' where user = 'root';
                    update user set Show_view_priv ='Y' where user = 'root';
					update user set Create_routine_priv ='Y' where user = 'root';
                    update user set Alter_routine_priv ='Y' where user = 'root';
                    update user set Create_user_priv ='Y' where user = 'root';
                    update user set Event_priv ='Y' where user = 'root';
                    update user set Trigger_priv ='Y' where user = 'root';

############mysql常用启动参数############################

bulk_insert_buffer_size     //用在块插入优化中的树缓冲区的大小

concurrent_insert           //在MyISAM存储引擎支持并发的插入，以减少对于一个给定表的写入与读取之间的争争执

delay-key-write             //对任何MyISAM表的写操作之间不要刷新键缓冲区

have_rtree_keys             //YES 如果 RTREE 索引是可用的, NO 如果没有RTREE

key_buffer_size             //用于索引块的缓冲区大小 允许的最大key_buffer_size设置是在32位平台上为4GB。值大于4GB允许64位平台

log-isam                    //记录所有的MyISAM变更（仅用于调试时的MyISAM）。可以指定一个文件名.例:log-isam=C:/mysql/logs/isam.log

myisam-block-size           //MyISAM索引的页的大小

myisam_data_pointer_size    //默认指针以字节为单位的大小，当使用MyISAM表时，没有MAX_ROWS选项指定的CREATE  TABLE。这个变量不能小于2或大于7。默认值是6。

myisam_max_sort_file_size   //如果临时文件会变得超过索引，不要使用快速排序索引方法来创建一个索引。注释：这个参数以字节的形式给出。

myisam_mmap_size            //最大内存量使用内存映射文件压缩MyISAM表。如果很多压缩MyISAM表的使用，该值可以降低，以减少内存交换问题的可能性。加入这个变量在MySQL5.5.1。

myisam-recover              //设置为崩溃MyISAM表自动恢复的模式。

myisam-recover-options      //设置自动恢复模式当MyISAM表崩溃时。

myisam_repair_threads       //如果这个值大于1，MyISAM表中创建索引的并行（每个在自己的线程指数）在修复过程中进行排序。默认值是1。

myisam_sort_buffer_size     //设置恢复表之时使用的缓冲区的尺寸。

myisam_stats_method         //服务器处理NULL值时，收集关于对MyISAM表的索引值分布统计NULL值。这个变量有三种可能的值，nulls_equal，nulls_unequal和nulls_ignored。

myisam_use_mmap             //使用内存映射MyISAM表的读和写

skip-concurrent-insert      //关闭在同一时间对MyISAM表并发写入

tmp_table_size              //内存中的临时表的最大尺寸。

innodb_buffer_pool_size=3072M     //对于纯数据库服务器，越大越好，一般为最大内存的80%。我建议我们把换下来的55服务器加到16G内存作为主库，把这个值设置为12G。

skip-innodb_doublewrite           //这个选项，可以让InnoDB在内存中缓存更多的修改操作，不立刻写到磁盘上，减少磁盘I/O。

innodb_file_per_table             //这个选项，可以让每一个表都占用一个ibd文件，就像MyISAM那样，便于备份和恢复。

innodb_flush_log_at_trx_commit=0  //这个选项，可以让InnoDB不要在每次commit操作后都把修改写到磁盘，而是每一秒写一次，减少磁盘I/O。

innodb_log_file_size=128M         //把log文件变大，可以减少log文件切换的次数，减少磁盘I/O。

innodb_log_buffer_size=64M        //把log缓冲区变大，可以减少log文件写盘的次数，减少磁盘I/O。

################################
mysql  root  密码忘记如何重置
/usr/local/mysql/bin/mysqld_safe --skip-grant-tables&   // 其中/usr..../bin是我的mysql安装目录
/usr/local/mysql/bin/mysql                              //进入mysql
>use mysql                                               //切换到mysql database
>UPDATE user SET password=password('新密码') WHERE user='root';


#####刘泉美在252测试数据库上使用的用户和密码
pipgame wap@pip0615
websg websg100919


#########################
select name,crystal,food,stone,wood from player where food>1000000 and stone>1000000 and wood>1000000 order by food desc;

#####烈焰畅游:
打开mysql的配置my.ini。在innodb配置出添加：innodb_file_per_table=1
set GLOBAL innodb_file_format = 'Barracuda';
show GLOBAL VARIABLES LIKE '%file_format%';



#####


++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
启动脚本：

#
# chkconfig: - 69 88
# description: this script is used for mysql
# author: mysql
#
# MySQL daemon of "mysql5_3306.sh" start/stop script.
# Usage: /data3/mysql5/data/mysql5 start|stop|status
#
# BY jcui
# 2016-01-17

lpath=/data1/mysql5
lport=3309
dbpasswd=pip123

case $1 in
start)
cd $lpath
$lpath/bin/safe_mysqld --user=mysql --pid-file=$lpath/data/mysql.pid --log-error=$lpath/data/mysql.log --basedir=$lpath --datadir=$lpath/data --max_allowed_packet=10000000 --log-slow-queries=$lpath/data/slow-queries.log --default-character-set=utf8 -O max_connections=500 -O long_query_time=1 -O key_buffer_size=1280M -O table_cache=256 -O thread_concurrency=8 -O thread_cache_size=32 --port=$lport --socket=$lpath/data/mysql.sock --skip-name-resolve --myisam-recover=FORCE,BACKUP &
;;
stop)
$lpath/bin/mysqladmin -u root -p$dbpasswd -S $lpath/data/mysql.sock shutdown
;;
status)
if [ -f $lpath/data/mysql.pid ] ; then
  echo "mysqld process(`cat $lpath/data/mysql.pid`)running..."
else
  echo "mysqld stoped."
fi
;;
*)
echo "Usage: $lpath/data/mysql5 start|stop|status"
;;
esac