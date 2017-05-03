#!/usr/bin/env bash
###########################################################################2013.03.04
http://211.151.99.70:7070/manager/html  tomcat热重启地址
####
1、	查看http的并发请求数及其TCP连接状态

2、	用tcpdump嗅探80端口的访问看看谁最高, 查看当前系统每个IP连接数

3、	把test.txt中出现的第一个数字和最后一个单词替换位置

4、统计出access.log中访问量最多的5个IP

5、查找/log目录下所有文件里面，包含C05559的文件

6、ps aux 中VSZ代表什么意思 RSS代表什么
VSZ     該进程使用的虚拟內存量（KB）
RSS     該進程占用的固定內存量（KB）（驻留中页的数量）

7、查找access.log中11:40 至 15:00:00 之间的日志并保存到test.log
cat bbs.ttlsa.com.access.log | awk '$4 >="[21/Jul/2014:14:37:50" && $4 <="[21/Jul/2014:14:38:00"'

8、简述raid0 raid1 raid5 三种工作模式的工作原理及特点

9、简述TCP 分别需要几次握手建立连接和断开连接，并说明其过程

10、top查看系统时%CPU这项增长到1000% ，怎么快速定位到具体的代码以及排查并解决

11、查找/log目录下10:10分 至 12:10 分之间的文件

12、你使用过哪些监控软件，说明掌握程度和优缺点

13、Linux系统你做过哪些优化

14、你熟练使用哪些软件和硬件配置及优化，例如：WEB 数据库 负载均衡 防火墙

15、使用过哪些Nosql数据库，生产环境如何选择，说明其原因

16、写一个脚本，实现批量添加20个用户，用户名为user1-20，密码为user后面跟5个随机字符

17、找出系统哪个进程占据了大量IO

18、简述你做过最大的网站架构，都使用到哪些技术，并设计一个高并发web架构,重点对数据库描述

19、你觉得运维需要具备哪些职业素质
####

#Red hat 下载FTP地址
ftp://ftp.redhat.com/pub/redhat/linux/eal/
#查看服务器是否作Raid
 dmesg |grep -i raid
 cat /proc/scsi/scsi

#安装perl模块
rm -rf ~/.cpan
perl -MCPAN -e shell
reload index
o conf init
install Bundle::CPAN
reload CPAN

#服务器禁ping
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
#########################################################################################
#redis操作  明珠服务器
20.111 上执行导出
redis-dump 10.10.20.111 6379 123456 2 /home/jcui/db2.dat
#单独导出某个分区的数据
redis-dump 10.10.20.111 6379 123456 2 /home/jcui/db2.dat msn_d001


30.214 上执行导入
redis-load 10.10.30.214 6379 123456 2 /home/jcui/db2.dat
#单独导入某个分区的数据
redis-load 10.10.30.214 6379 123456 2 /home/jcui/db2.dat msn_d001

查看

登陆 redis-cli -a 123456
选择 select 2
查看 keys *
清空 flushdb

#########################################################################################
#nginx加密

那么 在 nginx.conf 文件中对应的 server 段中 添加
location ^~ /test/ {
auth_basic TEST-Login;
auth_basic_user_file /home/tog/.httppasswd;
}

使用如下命令生成一个加密的文件.httppasswd
用户名:密码的格式   注意必须是用如下命令生成方可
htpasswd -c .httppasswd kdyh

#内网固定资产  git更新
git pull
rake assets:precompile  #若更新中有css更新，需执行该步骤
touch tmp/restart.txt

#########################################################################################
vim  快捷操作按键

按“i”：从光标当前位置开始输入文件。
按“a”：从目前光标所在位置的下一个位置开始输入文字。
按“o”：插入新的一行，从行首开始输入文字。
按“I”：在光标所在行的行首插入。
按“A”：在光标所在行的行末插入。
按“O”：在光标所在的行的下面插入一行。
按“s”：删除光标后的一个字符，然后进入插入模式。
按“S”：删除光标所在的行，然后进入插入模式。

h 光标向左移动
j 光标向下移动
k 光标向上移动
l 光标向右移动

按“ctrl+b”：屏幕往上移动一页。
按“ctrl+f”：屏幕往下移动一页。
按“ctrl+u”：屏幕往上移动半页。
按“ctrl+d”：屏幕往下移动半页。

sp 文件名  vim窗口下打开多个文件

ctrl + w + L 垂直分割
ctrl + w + J 左右分割
crtl + w   上下键控制切换窗口
ctrl + ww  切换到下一个窗口
X  输入密码  对shell加密
set type=    对shell解密


多行注释或者选取
1.多行注释
ctrl+v  用上线箭头选取需要注释的行   大写I插入`#`  按ESC返回 则全部都被注释。
2.多行取消注释
ctrl+v  用上线箭头选取需要取消注释的行   x删除      按ESC返回 则全部被取消注释。
#########################################################################################

Ctrl + a    shell界面光标跳到行首
Ctrl + c    shell界面结算shell任务
Ctrl + d    shell界面从光标开始逐个删除字符
Ctrl + e    shell界面光标跳到行尾
Ctrl + l    shell界面清屏
Ctrl + u    shell界面删除正行内容

#########################################################################################
特殊变量
$!  代表最后执行的后台命令的PID
$?  记录着最后退出的状态, 0表示没有错误
$#  记录着传入的参数个数
$@  为所有参数列表，不受IFS控制
$*  所有参数列表 受IFS控制
$$  进程标识号
$-  使用set及执行时传递给shell的标志位
$_  代表上一个命令的最后一个参数

$0  获取当前执行的shell脚本的文件名
$n  获取当前执行的shell脚本的第n个参数值，n=1..9
$*  获取当前shell的所有参数 “$1 $2 $3 …注意与$#的区别
$#  获取当前shell命令行中参数的总个数
$$  获取当前shell的进程号（PID）
$!  执行上一个指令的PID
$?  获取执行的上一个指令的返回值(0 为成功， 非零为失败)
$@  这个程序的所有参数 “$1″ “$2″ “$3″ “…”


网页西游平台合服时注意：  登入数据库执行：update account set name=lower(name);
#########################################################################################
#Perl正则表达式 零宽断言

分类	                 代码/语法	说明
捕获	(exp)	         匹配exp,并捕获文本到自动命名的组里
(?<name>exp)	         匹配exp,并捕获文本到名称为name的组里，也可以写成(?'name'exp)
(?:exp)	                 匹配exp,不捕获匹配的文本，也不给此分组分配组号
零宽断言	(?=exp)	         匹配exp前面的位置
(?<=exp)	             匹配exp后面的位置
(?!exp)	                 匹配后面跟的不是exp的位置
(?<!exp)	             匹配前面不是exp的位置
注释	(?#comment)	     这种类型的分组不对正则表达式的处理产生任何影响，用于提供注释让人阅读

#举例1：
["check_ssh",ok],["check_eth",ok],["check_disk",ok],["check_swap",ok],["check_mem",ok],["check_hardware",false],["check_filesystem",false],["check_port",ok],["check_redis-server",ok],["check_login",ok]

取出里面false中的字符串
grep -Po '[^"]+(?=",false)' cc

check_hardware
check_filesystem

#举例2：
echo 'aaa bbb CD="123" fd' |grep -Po '(?<=CD=")\d+'  //取CD后的数字

123

#举例3：
echo quan@163.com |grep -Po '(?<=@.).*(?=.$)'

63.com

#举例4：
echo 'Rx Optical Power: -5.01dBm, Tx Optical Power: -2.41dBm' |grep -Po '(?<=:).*?(?=d)'

-5.01
-2.41

# .*?  这里的问号代表一个中断字符 贪婪因子
#########################################################################################

自动删除10天前的文件
find /data2/monitor -mtime +90 -name "*.*" -exec ls -l  {} \;

find /data2/monitor -name "*.txt" -or -name "*.doc"

创建链接方式：
    ln -s -f /data/data1 data1
    ln -s -f /data/home home

### 删除/data2/monitor目录下六个月前的*.wav文件
find /data2/monitor -maxdepth 1 -name "*.wav" -and -mtime +180 -type f -exec rm -rf {} \;

-maxdepth 1  定义只在当前目录下
-name        定义文件名字
-type f      定义文件类型
#########################################################################################
seq -s ' ' 1 10|xargs mkdir    #创建目录名为1-10的目录

#shell取整数
a=4.5
echo ${a%.*}

******************************************************************************
#centos5.5 BUG

printf "install uprobes /bin/sh" > exploit.conf; MODPROBE_OPTIONS="-C exploit.conf" staprun -u whatever

更新bug

*******************************************************************************
数据库备份   抛去mysql  test  先备份mysql  再赋值给a
ls -p|awk '/\/$/{print $1}'|awk -F"/" '\$1!~/net/ && \$1!~/disk/{print $1}'

*******************************************************************************
修改主机名：
vi /etc/sysconfig/network
vi /etc/hosts
规则：
127.0.0.1       localhost.localdomain   localhost
127.0.0.1       www.pearlinpalm.com     js6

重启计算机，重启后查看防火墙策略
iptables -L -n
iptables -VLn

定制软件包大小  3683m (_RHEL4.8)
安装软件包包括：Gnome、编辑器、工程和科学、基于文本的互联网、服务器一下全选
分区容量：“ /20G     SWAP 内存的两倍 16G    /data 其余全部容量

网卡 eth0 ---开机激活
网卡 eth1 ---开机不激活  配置IP同eth0


*************************************************************************************
验证主从复制  是否成功：
mysql -uroot -p --socket=/data1/mysql5/data/mysql.sock -A
use mysql;
select host,user,password from user;    //查看权限
show  slave status\G;                   //验证主从复制
show processlist;                      //验证主从复制
SHOW PROCESSLIST\G                      //验证主从复制

如果提示 Cant locate DBD/mysql.pm 缺少 DBD::mysql  则先安装 perl-DBD-MySQL

**************************************************************************************1
yum -y install perl-DBD-MySQL             //解决mysql备份失败

yum -y install gcc*             //安装gcc g++ c++组件包

yum -y install lrzsz             //yum安装sz rz组件包

yum -y update systemtap          //更新centos5.5系统BUG

yum -y install  vixie-cron crontabs    //yum安装crontab

yum -y install redhat-lsb       //解决lsb_release 命令找不到的安装方法

yum -y install xen kernel-xen virt-manager   //yum安装xen服务及核心和图形管理界面

yum -y install vnc*               //远程执行xen安装

yum -y install mailx               //解决mail命令找不到

rpm -Uvh http://repo.webtatic.com/yum/centos/5/latest.rpm
yum install --enablerepo=webtatic git-all     //解决centos安装git命令
————————————————————————————————————————————
jobs    观看后台暂停的程序   jobs -l
fg      将后台程序调到前台   fg n n是数字,可以指定进行那个程序
bg      让工作在后台运行

————————————————————————————————————————————
Linux Acl 权限控制

dumpe2fs -h /dev/sda3    查看/dev/sda3 是否可以用acl权限控制
getfacl 查看权限
setfacl -m u:jcui:r-x wabba   对wabba的目录添加允许jcui用户可读可执行
setfacl -m g:backup:r-x wabba   对wabba的目录添加允许backup组可读可执行
setfacl -x u:jcui wabba   对wabba的目录删除jcui用户的权限
setfacl -b wabba   对wabba的目录删除所有用户的acl权限


————————————————————————————————————————————

修改/etc/ssh/sshd_config

#Port 22
Port 8866

UseDNS no

AllowUsers hwang jcui jgwu wap

----------------------------------------------------------------------------

tar zcvfp mysql.tar.gz mysql  压缩命令
tar xzvfp mysql.tar.gz        解压缩命令
tar -ztvf mysql.tar.gz        查看压缩包里的文件但不解包
tar zxvfp mysql.tar.gz mysql.tar.gz/data  只解包mysql.tar.gz文件中的data目录


----------------------------------------------------------------------------
#注释shell脚本  多行内容

# :<<'
#    ....脚本内容
# '

_______________________________________________________________________________________

网页游戏在没有CDN下载的时候需修改如下：

#tomcat： /home/lighthu/tomcat/conf

 <Connector port="80" maxHttpHeaderSize="8192"
               maxThreads="1500" minSpareThreads="25" maxSpareThreads="75"
               enableLookups="false" redirectPort="8443" acceptCount="100"
               connectionTimeout="20000" disableUploadTimeout="true" />

#proxy： /home/lighthu/proxy1  /home/lighthu/proxy2

host=210.242.206.1
port=8080
aggotime=0
directbuffer=N
buffersize=8192
adminpass=proxy@pip2008

proxy编译

make clean   #\\清除缓存

make         #\\编译

----------------------------------------------------------------------------
# 查看TCP 最大并发连接数
netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'
Nginx 服务启停

1、启动nginx
/data1/nginx/sbin/nginx

2、停止nginx
/data1/nginx/sbin/nginx -s stop
----------------------------------------------------------------------------

修改防火墙命令：
1.vi iptables.cfg
2.修改  -A INPUT -s 192.168.0.0/255.255.0.0 -p tcp -j ACCEPT   保存退出
3.iptables-restore < iptables.cfg
4./etc/init.d/iptables save
5./etc/init.d/iptables restart



IPTABLES简单应用说明:

iptables -A INPUT -p tcp -s 10.1.2.187 -j ACCEPT
将10.1.2.187加入允许范围

iptables -t nat -A POSTROUTING -j SNAT --to-source 10.1.2.1
参数——

-A: 添加 (跟链)
-I: 插入
-p: 跟协议
-s: 源IP
-d: 目标IP
-j: 操作行为
-t: 加表
--to-source：SNAT用，表示改成的SNAT源地址
--to-destination：DNAT用，表示改成的DANT目标地址

允许所有已经建立的和相关的连接
######内网IP地址的网络通过 NAT转发 上网操作步骤--------------------------------------------------------
#以下是双网卡主机上的操作

#-------------------------------------------------------------
#修改/etc/sysctl.conf文件，让包转发功能在系统启动时自动生效:
net.ipv4.ip_forward = 1

#转发策略
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -o eth0 -j SNAT --to 211.151.99.90

#端口映射
iptables -t nat -A PREROUTING -d 211.151.99.90 -p tcp -m tcp --dport 50001 -j DNAT --to-destination 10.10.20.109:22
#注明这条策略需添加到转发策略之前
#-------------------------------------------------------------

#
iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -d 10.10.20.109 -p tcp -m tcp --dport 22 -j SNAT --to-source 211.151.99.90

#
iptables -A FORWARD -o eth1 -d 10.10.20.109 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -i eth1 -s 10.10.20.109 -p tcp --sport 22 -m --state ESTABLISHED -j ACCEPT

#注明：
1.eth0 外网网卡，指定网关
2.eth1 内网网卡，本机不需要指定网关 其他通过这台主机上网的服务器内网网关需指定本机IP
3.10.10.10.0/24  内网网段
4.192.168.10.68  外网网卡的IP地址
5."echo 1 > /proc/sys/net/ipv4/ip_forward" 打开路由转发功能

######end-------------------------------------------------------------------------------------------

#iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#-A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -d 192.168.0.0/24 -m string --string "test"  --algo -j bm DROP

##iptables 实例分析

iptables -t nat -A POSTROUTING -o eth1 -s localhost -p tcp -j SNAT --to 10.10.10.41:8006
iptables -t nat -A PREROUTING -i eth1 -d 10.10.10.41 -p tcp --dport 8006 -j DNAT --to localhost

iptables -t nat -A POSTROUTING -s 10.10.10.54 -j SNAT --to-source 10.10.10.41:8006

iptables -t nat -A OUTPUT -s 10.10.10.54 -p tcp --sport 25 -j SNAT --to-source 10.10.10.41:8006

iptables -t nat -A PREROUTING -d 221.179.216.60 -p tcp --dport 25 -j DNAT --to 10.10.10.0/255.255.255.0

首先，对防火墙接收到的目的ip为202.110.123.100和202.110.123.200的所有数据包进行目的NAT(DNAT):

　　iptables -A PREROUTING -i eth1 -d 10.10.10.42 -j DNAT --to 10.10.10.41

　　iptables -A PREROUTING -i eth1 -d 10.10.10.42 -j DNAT --to 10.10.10.41

　　其次，对防火墙接收到的源ip地址为192.168.1.100和192.168.1.200的数据包进行源NAT(SNAT):

　　iptables -A POSTROUTING -o eth1 -s 10.10.10.41 -j SNAT --to 10.10.10.42

　　iptables -A POSTROUTING -o eth1 -s 10.10.10.41 -j SNAT --to 10.10.10.42

iptables -t nat -A POSTROUTING -o eth1 -s 127.0.0.1 -j SNAT --to 10.10.10.42
iptables -t nat -A PREROUTING -i eth1 -d 10.10.10.42 -j DNAT --to 127.0.0.1


/sbin/iptables -t nat -A PREROUTING -i eth1 -d 127.0.0.1 -p tcp -m tcp -j DNAT --to-destination 10.10.10.41:8006
/sbin/iptables -t nat -A POSTROUTING -o eth0 -d 10.10.10.41 -p tcp -m tcp --dport 8006 -j SNAT --to 127.0.0.1

实例一：简单的nat路由器
环境介绍：
linux 2.4 +
2个网络接口
Lan口:10.1.1.254/24 eth0
Wan口:60.1.1.1/24 eth1
目的：实现内网中的节点（10.1.1.0/24）可控的访问internet。

首先将Lan的节点pc的网关指向10.1.1.254
确定你的linux的ip配置无误，可以正确的ping通内外的地址。同时用route命令查看linux的本地路由表，确认指定了可用的ISP提供的默认网关。
使用sysctl net.ipv4.ip_forward=1打开linux的转发功能。

iptables -P FORWARD DROP
将FORWARD链的策略设置为DROP，这样做的目的是做到对内网ip的控制，你允许哪一个访问internet就可以增加一个规则，不在规则中的ip将无法访问internet.

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
这条规则规定允许任何地址到任何地址的确认包和关联包通过。一定要加这一条，否则你只允许lan IP访问没有用，至于为什么，下面我们再详细说。

iptables -t nat -A POSTROUTING -s 10.1.1.0/24 -j SNAT --to 60.1.1.1
这条规则做了一个SNAT，也就是源地址转换，将来自10.1.1.0/24的地址转换为60.1.1.1

有这几条规则，一个简单的nat路由器就实现了。这时你可以将允许访问的ip添加至FORWARD链，他们就能访问internet了。

比如我想让10.1.1.9这个地址访问internet,那么你就加如下的命令就可以了。
iptables -A FORWARD -s 10.1.1.9 -j ACCEPT

也可以精确控制他的访问地址,比如我就允许10.1.1.99访问3.3.3.3这个ip
iptables -A FORWARD -s 10.1.1.99 -d 3.3.3.3 -j ACCEPT

或者只允许他们访问80端口。
iptables -A FORWARD -s 10.1.1.0/24 -p tcp --dport http -j ACCEPT
更多的控制可以自己灵活去做,或者查阅iptables的联机文档。



#############################################################################################################################################################################
编译安装mysql,apache,nginx,php
1.安装mysql        ###   略过

2.安装apache       ###

#编译
./configure --prefix=/data1/apache2 --with-mysql=/data1/mysql5/lib --enable-so --enable-track-vars --enable-rewrite --with-zlib-dir --enable-mods-shared=all --enable-suexec --with-suexec-caller=apache --with-suexec-docroot=/data1/apache2/htdocs  --enable-deflate=shared --enable-expires=shared --enable-rewrite=shared --enable-static-support --with-included-apr
#安装
make && make install

3.安装nginx        ###

4.安装php          ###

#安装jpeg
mkdir -p /usr/local/jpeg/{lib,bin,include,man/man1,man1}
./configure --prefix=/usr/local/jpeg/ --enable-shared --enable-static
make
make install

#安装lib库
yum -y install libmctypt*

yum -y install libtool-ltdl*

#编译PHP

./configure --prefix=/data1/php --with-apxs2=/data1/apache2/bin/apxs --with-mysql=/data1/mysql5 --with-mysqli=/data1/mysql5/bin/mysql_config --with-config-file-path=/etc --with-zlib --with-libxml-dir --with-gd --with-freetype-dir --with-jpeg-dir=/data1/jpeg --with-png-dir --with-ttf --with-iconv --with-openssl --with-mcrypt --enable-sockets --enable-bcmath --enable-calendar --enable-exif --enable-libxml --enable-magic-quotes --enable-mbstring --with-bz2 --with-curl --with-xmlrpc --with-gettext  --enable-cli --disable-debug

make

make install

#############################################################################################################################################################################
*****************************************************************************
附93服务器防火墙配置文件
*filter
:INPUT ACCEPT [204892:14397040]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [54029751:32150041643]
-A INPUT -s 127.0.0.1 -p tcp -j ACCEPT
-A INPUT -s 211.100.18.93 -p tcp -j ACCEPT
-A INPUT -s 211.100.18.94 -p tcp -j ACCEPT
-A INPUT -s 114.251.179.128/255.255.255.192 -p tcp -j ACCEPT
-A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,URG RST -j DROP
-A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 843 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 7000:10000 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 1:6999 -j REJECT --reject-with icmp-port-unreachable
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
COMMIT
*****************************************************************************
------------------------------------------------------------------------------
修改软件  硬件的最大连接数

vi /etc/security/limits.conf

在下边添加：

*               soft    nofile          65536
*               hard    nofile          65536

命令查看：
ulimit -a
ulimit -Ha
-----------------------------------------------------------------------------
修改启动默认界面为命令窗口

vi /etc/inittab

将id:5:initdefault:    中的5改成3

-----------------------------------------------------------------------------
postfix 维护

/etc/postfix/local_sender   可发送全体邮件配置文件

更新邮件组列表   postalias /etc/aliases

vi /etc/postfix/local_sender   编辑可发送全体邮件组的人员
postmap /etc/postfix/local_sender

vi /etc/postfix/local_recipient    编辑控制权限的邮件组
postmap /etc/postfix/local_recipient
-----------------------------------------------------------------------------
同步系统时钟和硬件时钟

date

clock

hwclock --systohc 硬件时钟同步系统时钟

手动修改硬件时钟  vi  /etc/sysconfig/clock
ZONE="America/Los_Angeles"
-----------------------------------------------------------------------------
#在硬盘上挂载swap分区的方法
1.dd if=/dev/zero of=/home/swap bs=1024 count=5120000  这里挂载的是5G的swap
2./sbin/mkswap /home/swap
3./sbin/swapon /home/swap    启用swap分区
4.编辑/etc/fstab ,保证随系统启动
/home/swap              swap                    swap    defaults        0 0
-----------------------------------------------------------------------------
创建SSH认证

使用自己的账户登录执行如下命令

ssh -keygen -t rsa   一路回车下去

生成的文件在自己的家目录下： /home/jcui/.ssh

id_rsa       私钥文件
id_rsa.pub   公钥文件

vi id_rsa.pub 复制里边的内容  到另外机器的/home/jcui/.ssh  创建authorized_keys2文件并将粘贴复制的内容保存退出。且authorized_keys2文件的权限是644

-------------------------------------------------------------------------------
CVS  常用命令

创建新用户：useradd -s /bin/false 用户

并vi /etc/group   将用户添加到cvsroot组中

创建新项目：
在/data1/repository/projects     mkdir 项目名称   并设置权限为2770   设置组limiter.limiter
并在/acl 目录下创建新的acl 权限文件


CVS的路径：/data1/repository/projects
CVS的权限路径：/data1/repository/projects/acl
CVS的权限赋予：setfacl --set-file=acl/**  **     ----**表示所存在的项目
CVS的权限添加：/data1/repository/projects/acl  vi读取  ----对CVS人员赋予项目的权限

CVS的目录恢复：
data2中cvsbackup里找到最近的文件，解压损坏的目录到temp；删除data1中已损坏的CVS目录，将解压后的目录拷贝过去即可。
_____________________________________________________________________________________
SVN  常用命令

路径:/data1/repository_svn/projects

配置文件：/data1/repository_svn/projects/conf

authz    权限分配文件
passwd   用户及密码分配文件

启动SVN服务:svnserve -d -r /data4/repository_svn   注明：必须切换到svnroot
SVN服务端口号：3690
查看SVN进程ID：netstat -nalp|grep 3690   或者 pgrep svnserve

查看SVN目录结构：svn list file:///data1/repository_svn/projects
---------------------------------------------------------------------------
日志分割
配置文件位置：/etc/logrotate.conf

vi /etc/logrotate.d/nginx
分割日志配置文件如下（举例Nginx日志）
/data1/nginx/logs/*.log {
  daily
  missingok
  rotate 7
  compress
  delaycompress
  notifempty
  copytruncate
}

验证配置文件是否准确
/usr/sbin/logrotate -f /etc/logrotate.d/nginx

相关注释都需要去掉，如下参数和功能
compress            #通过gzip 压缩转储以后的日志
nocompress           #不需要压缩时，用这个参数
copytruncate         #用于还在打开中的日志文件，把当前日志备份并截断
nocopytruncate       #备份日志文件但是不截断
create mode owner group    #转储文件，使用指定的文件模式创建新的日志文件
nocreate             #不建立新的日志文件
delaycompress        #和 compress 一起使用时，转储的日志文件到下一次转储时才压缩
nodelaycompress      #覆盖 delaycompress 选项，转储同时压缩。
errors address       #专储时的错误信息发送到指定的Email 地址
ifempty              #即使是空文件也转储，这个是 logrotate 的缺省选项。
notifempty           #如果是空文件的话，不转储
mail address        #把转储的日志文件发送到指定的E-mail 地址
nomail               #转储时不发送日志文件
olddir directory     #转储后的日志文件放入指定的目录，必须和当前日志文件在同一个文件系统
noolddir             #转储后的日志文件和当前日志文件放在同一个目录下
prerotate/endscript  #在转储以前需要执行的命令可以放入这个对，这两个关键字必须单独成行
postrotate/endscript #在转储以后需要执行的命令可以放入这个对，这两个关键字必须单独成行
daily                #指定转储周期为每天
weekly               #指定转储周期为每周
monthly              #指定转储周期为每月
rotate count         #指定日志文件删除之前转储的次数，0 指没有备份，5 指保留5 个备份
tabootext [+] list 让logrotate 不转储指定扩展名的文件，缺省的扩展名是：.rpm-orig, .rpmsave, v, 和 ~
size size 当日志文件到达指定的大小时才转储，Size 可以指定 bytes (缺省)以及KB (sizek)或者MB (sizem).
______________________________________________________________________________________

#查看全球IPv4 各个国家地址段的网址
http://ipwhois.cnnic.cn/ipstats/index.php?obj=ipv4
#linux下计算机IP地址段、子网掩码、主机数的方法
经常配置ip地址,偶尔也许会遗忘子网掩码,亦或是广播地址,现在我们用linux下的ipcalc来计算一下,可以省下很多事哦.
[root@dbrg-2 ~]# ipcalc -h
ipcalc: ip address expected
Usage: ipcalc [OPTION...]
-b, --broadcast Display calculated broadcast address（显示指定ip和子网掩码的广播地址）
-h, --hostname Show hostname determined via DNS（显示指定ip的主机名）
-m, --netmask Display default netmask for IP (class A, B, or C)（显示指定ip的子网掩码--特指默认,实际未必是）
-n, --network Display network address（显示指定ip的网络地址）
-p, --prefix Display network prefix（显示网络前缀）
-s, --silent Do not ever display error messages （不显示错误信息）

Help options:
-?, --help Show this help message
--usage Display brief usage message

[root@dbrg-2 ~]# ipcalc -p 192.168.1.1 255.255.255.0
PREFIX=24
[root@dbrg-2 ~]# ipcalc -n 192.168.1.1 255.255.255.0
NETWORK=192.168.1.0
[root@dbrg-2 ~]# ipcalc -h 192.168.1.1
HOSTNAME=dbrg-2
[root@dbrg-2 ~]# ipcalc -m 192.168.1.1
NETMASK=255.255.255.0
[root@dbrg-2 ~]# ipcalc -pnbm 192.168.1.1 255.255.255.0
NETMASK=255.255.255.0
PREFIX=24
BROADCAST=192.168.1.255
NETWORK=192.168.1.0

根据IP段和计算机数计算子网掩码
ipcalc -m 1.52.0.0 -p 262144   （该命令只应用于Linux 4.8系统  5.5系统不支持）

ipcalc -nbmp 202.75.52.239/27   (5.5系统使用命令)

##########################################################################################

编译PHP

1. ./configure --prefix=/data1/php5 --with-apxs2=/data1/apache2/bin/apxs --with-config-file-path=/data1/php5 --with-mysql=/data1/mysql5 --enable-track-vars --enable-sockets --with-zlib-dir=/usr/include --with-gd --with-pcre-regex --with-mbstring  --with-libmbfl
2. make
3. make test
4. make install

修改php.ini
register_globals = On
mysql.default_socket = /data1/mysql5/data/mysql.sock
output_buffering = On

###########################################################################################

用 ${ } 分別替换获得不同的值
http://www.chinaunix.net/forum/viewtopic.php?t=201843
定义了一个变量为：
file=/dir1/dir2/dir3/my.file.txt
${file#*/}：拿掉第一条 / 及其左边的字串：dir1/dir2/dir3/my.file.txt
${file##*/}：拿掉最后一条 / 及其左边的字串：my.file.txt
${file#*.}：拿掉第一个 .  及其左边的字串：file.txt
${file##*.}：拿掉最后一个 .  及其左边的字串：txt
${file%/*}：拿掉最后条 / 及其右边的字串：/dir1/dir2/dir3
${file%%/*}：拿掉第一条 / 及其右边的字串：(空值)
${file%.*}：拿掉最后一个 .  及其右边的字串：/dir1/dir2/dir3/my.file
${file%%.*}：拿掉第一个 .  及其右边的字串：/dir1/dir2/dir3/my
记忆的方法为：
      # 是去掉左边(在键盘上 # 在 $ 之左边)
      % 是去掉右边(在键盘上 % 在 $ 之右边)
      单一符号是最小匹配﹔两个符号是最大匹配。
${#变量} 可得到变量中字节


	变量引用技巧 ${}

${name:+value}        #  如果设置了name,就把value显示,未设置则为空
${name:-value}        #  如果设置了name,就显示它,未设置就显示value
${name:?value}        #  未设置提示用户错误信息value 
${name:=value}        #  如未设置就把value设置并显示<写入本地中>
${#A}                 #  可得到变量中字节
${#A[*]}              #  数组个数
${A[*]}               #  数组所有元素
${A[@]}               #  数组所有元素(标准)
${A[2]}               #  脚本的一个参数或数组第三位
${A:4:9}              #  取变量中第4位到后面9位
${A/www/http}         #  取变量并且替换每行第一个关键字
${A//www/http}        #  取变量并且

###########################################################################################

#安装nginx

把nginx 安装到 /data1/nginx 下

nginx可以实现web服务器的功能，并且和tomcat完美结合，是替代apache的产品。
nginx又叫做反向代理服务器或者web前端服务器。
nginx的结构，简单的说就是：

位置1
http{
位置2
	server{
	位置3
	}
	server{
	位置4
	}

}
中间可以配置很多个server，server的域名和端口不能相同。位置3/4的配置会覆盖位置2和位置1的配置，位置2的配置会覆盖位置1的配置。


一、下载nginx

wget http://nginx.org/download/nginx-0.8.53.tar.gz

二、编译

tar xvzfp nginx-0.8.53.tar.gz
cd nginx-0.8.53
./configure --prefix=/data3/nginx --with-http_stub_status_module --with-http_ssl_module
make
make install

注意：如果configure时报错，报错内容是：Perl兼容正则表达式库（PCRE）相关信息。
yum -y install pcre-devel


三、配置nginx

1、在 /data1/nginx/conf 下创建 proxy.conf 文件内容如下：


#!nginx (-)
# proxy.conf
proxy_redirect          off;
proxy_set_header        Host $host;
proxy_set_header        X-Real-IP $remote_addr;  #获取真实ip
#proxy_set_header       X-Forwarded-For   $proxy_add_x_forwarded_for; #获取代理者的真实ip
client_max_body_size    10m;
client_body_buffer_size 128k;
proxy_connect_timeout   90;
proxy_send_timeout      90;
proxy_read_timeout      90;
proxy_buffer_size       4k;
proxy_buffers           4 32k;
proxy_busy_buffers_size 64k;
proxy_temp_file_write_size 64k;


2、修改 /data1/nginx/conf/nginx.conf

3行 worker_processes  4;                              #这里是CPU的核数,4核的CPU就要写4.
19行 default_type  application/octet-stream;          #找到19行,在下面的20行增加下面内容
20行 include /data1/nginx/conf/proxy.conf;            #在20行新增此行
25行 access_log  logs/access.log;                     #开启日志
33行 gzip on;                                         #在30行开启支持压缩功能,可以加快下载速度.
35行 server {                                         #找到35行,这里开始,是第一个server的配置.
36行 listen       80;                                 #这里是server监听的端口
37行 server_name  pipdown1.pipgame.com;               #这里是服务器的域名或者IP,我们下载服务器采用的是域名
41行 #access_log  logs/host.access.log  main;         #开启每个server自己的访问日志(此处禁掉),这里如果开启后会覆盖25行的设置,开启后应该去掉main以避免报错.
#从这行开始,添加以下内容:

        index  index.html index.htm index.jsp;        #这里定义默认首页
        root /data1/nginx/pipdown1;                   #这里定义下载服务器的根路径(不是下载服务器也适用),根路径需要手工创建

		#---------------------------从这里开始---------------------------
		#如果是下载服务器的话，以下需要禁掉，否则需要开启
		#location ~ .*.jsp$ #所有jsp的页面均交由tomcat处理
        #{
        #        index index.jsp;
        #        proxy_pass http://localhost:8181; #转向tomcat处理
        #}
        #location ~ .*.action$ #所有jsp的页面均交由tomcat处理
        #{
        #        index index.jsp;
        #        proxy_pass http://localhost:8181; #转向tomcat处理
        #}
        #location ~ .*$ #所有jsp的页面均交由tomcat处理
        #{
        #        index index.jsp;
        #        proxy_pass http://localhost:8181; #转向tomcat处理
        #}
		#如果是下载服务器的话，上面需要禁掉，否则需要开启
		#---------------------------到这里结束---------------------------


		location ~ .*\.(gif|jpg|jpeg|png|bmp|swf)$ #设定访问静态文件直接读取不经过tomcat
        {
                expires      30d;
        }

		#---------------------------从这里开始---------------------------
		#如果是下载服务器的话，以下需要禁掉，否则需要开启
		#location ~ .*\.(js|css)?$
        #{
        #        expires      1h;
        #}
        #如果是下载服务器的话，上面需要禁掉，否则需要开启
		#---------------------------到这里结束---------------------------


		location / {  #这里是默认查找规则,上面的location都不匹配以后,就从上面定义的root中层层查找
                        index  index.html index.htm index.jsp;
        }


下面内容禁掉：

        #location / {
        #    root   html;
        #    index  index.html index.htm;
        #}

下面的内容不用修改：

		#error_page  404              /404.html;
        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
}


四、服务控制
1、启动nginx
/data1/nginx/sbin/nginx

2、停止nginx
/data1/nginx/sbin/nginx -s stop

五、nginx优化：

找到7-9行
events {
    worker_connections  1024;
}

改为：实现最大并发连接(maxclient) = worker_processes * worker_connections / cpu_number=4*51200/1=204800

events
{
        use epoll;
        #maxclient = worker_processes * worker_connections / cpu_number
        worker_connections 51200;
}

六、查看nginx最大连接数

通过查看Nginx的并发连接，我们可以更清除的知道网站的负载情况。Nginx并发查看有两种方法（之所以这么说，是因为笔者只知道两种），一种是通过 web界面，一种是通过命令，web查看要比命令查看显示的结果精确一些。下面介绍这两种查看方法

1、通过浏览器查看(未经测试)：

通过web界面查看时Nginx需要开启status模块，也就是安装Nginx时加上“ --with-http_stub_status_module”，然后配置Nginx.conf，在server里面加入如下内容：

location　/status　{
stub_status　on;
access_log　/usr/local/nginx/logs/status.log;
auth_basic　"NginxStatus";　}

配置完后重新启动Nginx后我们可以通过浏览器访问http://localhost/status 查看。

解析：

Active　connections　　　　//当前　Nginx　正处理的活动连接数。
server　accepts　handled　requests　//总共处理了8　个连接　,　成功创建　8　次握手,总共处理了500个请求。
Reading　//nginx　读取到客户端的　Header　信息数。
Writing　//nginx　返回给客户端的　Header　信息数。
Waiting　//开启　keep-alive　的情况下，这个值等于　active　-　(reading　+　writing)，意思就是　Nginx　已经处理完正在等候下一次请求指令的驻留连接

2、通过命令查看：

netstat -n | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'

TIME_WAIT　17
ESTABLISHED　3254
LAST_ACK　236
FIN_WAIT_1　648
FIN_WAIT_2　581
CLOSING　7
CLOSE_WAIT　4916

解析：

CLOSED　//无连接是活动的或正在进行
LISTEN　//服务器在等待进入呼叫
SYN_RECV　//一个连接请求已经到达，等待确认
SYN_SENT　//应用已经开始，打开一个连接
ESTABLISHED　//正常数据传输状态/当前并发连接数
FIN_WAIT1　//应用说它已经完成
FIN_WAIT2　//另一边已同意释放
ITMED_WAIT　//等待所有分组死掉
CLOSING　//两边同时尝试关闭
TIME_WAIT　//另一边已初始化一个释放
LAST_ACK　//等待所有分组死掉


七、安装中出现的问题及解决办法：

1、rewrite错误：

错误提示：
./configure: error: the HTTP rewrite module requires the PCRE library.

解决办法：安装pcre-devel
yum -y install pcre-devel

2、HTTP cache错误：

错误提示：
./configure: error: the HTTP cache module requires md5 functions
from OpenSSL library.   You can either disable the module by using
--without-http-cache option, or install the OpenSSL library into the system,
or build the OpenSSL library statically from the source with nginx by using
--with-http_ssl_module --with-openssl=<path> options.

解决办法：安装openssl和openssl-devel
yum -y install openssl openssl-devel



###########################################################################################
创建邮箱账户

useradd -s /bin/false 用户  ----表示创建的用户禁止登录
passwd  用户

vi /etc/aliases  添加邮件组

newaliases 更新别名

删除邮箱账户

userdel -r 用户   删除用户时注意查看该用户家目录下是否用数据 /home/用户

从别名中删除

echo "b_zhang" | passwd bzhang --stdin   ----表示为创建的用户设置密码(适用于脚本中)



查看进程
ps -eaf|grep sendmail

查看监听端口
netstat -nalp|grep sendmail

启动/停止/重启 sendmail进程
/etc/init.d/sendmail start/stop/restart

修改配置文件
vi sendmail.mc    修改保存后执行 make -C /etc/mail (修改之前注意备份)

可修改文件

vi virtusertable  映射不同的域名邮箱
local-host-names  多个用户邮箱
relay-domains     多个用户邮箱

修改后执行   makemap hash /etc/mail/virtusertable.db < /etc/mail/virtusertable

#利用mail参数发送带附件的邮件
echo 123|mutt -s 123 -a 218.206.80.189_4227833-day.png jcui@pip.co

****************************************************
1.添加邮件虚拟主机虚名:

#cd /etc/mail

# vi local-host-names  ，在里面添加邮件虚拟主机

xxit.com

mail.xxit.com
****************************************************
2.Relay转发

#vi /etc/mail/access

通常情况下，Sendmail不会为邮件服务Relay信息，这样可以防止一些有恶意的人利用别人的邮件服务器乱发邮件。缺省情况下，Sendmail关闭了Relay功能。如果你要为别的服务器Relay邮件，可以进行如下设置——在access文件中加入要为其Relay信件的机器，格式为：

hostname RELAY

ipaddress RELAY

如果要为一个域内多个机器Relay信件，则可以在/etc/mail/access文件中直接加入其子网IP或域名，如下所示：

　　access文件内容：

　　domainname.com RELAY（允许为域domainname的所有计算机relay邮件）

　　localhost RELAY

　　192.168.1.0 RELAY (为192.168.1.0此网内所有机器relay邮件)

此文件惟一决定了哪些机器、哪个域可以使用邮件服务器转发邮件。

根据自己需要修改完成后，生成数据库文件:

 makemap hash access.db <access       //生成access.db文件

service sendmail restart
****************************************************
3.添加虚拟域:

#vi /etc/mail/virtusertable

webmaster@xxit.com     netseek

cnseek@xxt.com        cnseek

运行makemap命令为virtusertable重新建立数据库映谢。

cd /etc/mail

makemap hash virtusertable.db < virtusertable
############################################################################

05 00 * * * /usr/sbin/ntpdate 192.168.0.5>/dev/null 2>&1;/sbin/hwclock -w

#############################################################################
获取网卡IP地址(针对只存在一个网卡的主机)           /sbin/ifconfig | grep -i bcast | awk  '{print $2}' | awk -F "[: ]" '{print  $2}'


#############################################################################
1.使用dialog命令实现进度条

#!/bin/bash
{
for ((i=1;i<=10;i++))
do
         let I=10*i
         echo $I
        sleep 1
done
}| dialog --guage "安装进度" 10 60 0


########################

2.dialog 安装

tar xzvfp dialog.tar.gz
cd dialog-1.1-20100428
./configure
make
make install

3.dialog实现日历显示。
 --calendar     <text> <height> <width> <day> <month> <year>
dialog --stdout --title "日历"  --calendar "请选择" 0 0 0 0 0


############################################################################

date命令的功能是显示和设置系统日期和时间。
该命令的一般格式为： date [选项] 显示时间格式（以+开头，后面接格式）
date 设置时间格式
命令中各选项的含义分别为：
-d datestr, --date datestr 显示由datestr描述的日期
-s datestr, --set datestr 设置datestr 描述的日期
-u, --universal 显示或设置通用时间
时间域
% H 小时（00..23）
% I 小时（01..12）
% k 小时（0..23）
% l 小时（1..12）
% M 分（00..59）
% p 显示出AM或PM
% r 时间（hh：mm：ss AM或PM），12小时
% s 从1970年1月1日00：00：00到目前经历的秒数
% S 秒（00..59）
% T 时间（24小时制）（hh:mm:ss）
% X 显示时间的格式（％H:％M:％S）
% Z 时区 日期域
% a 星期几的简称（ Sun..Sat）
% A 星期几的全称（ Sunday..Saturday）
% b 月的简称（Jan..Dec）
% B 月的全称（January..December）
% c 日期和时间（ Mon Nov 8 14：12：46 CST 1999）
% d 一个月的第几天（01..31）
% D 日期（mm／dd／yy）
% h 和%b选项相同
% j 一年的第几天（001..366）
% m 月（01..12）
% w 一个星期的第几天（0代表星期天）
% W 一年的第几个星期（00..53，星期一为第一天）
% x 显示日期的格式（mm/dd/yy）
% y 年的最后两个数字（ 1999则是99）
% Y 年（例如：1970，1996等）

例2：用预定的格式显示当前的时间。
# date
Fri Nov 26 15：20：18 CST 1999
例3：设置时间为下午14点36分。
# date -s 14:36:00
Fri Nov 26 14：15：00 CST 1999
例4：设置时间为1999年11月28号。
# date -s 991128
Sun Nov 28 00：00：00 CST 1999
例5：设置一天前
date --date "1 days ago" +"%Y-%m-%d"Date 命令参数小技巧
LastUpdated:2006-03-27

[root@Gman root]# date -d next-day +%Y%m%d
20060328
[root@Gman root]# date -d last-day +%Y%m%d
20060326
[root@Gman root]# date -d yesterday +%Y%m%d
20060326
[root@Gman root]# date -d tomorrow +%Y%m%d
20060328
[root@Gman root]# date -d last-month +%Y%m
200602
[root@Gman root]# date -d next-month +%Y%m
200604
[root@Gman root]# date -d next-year +%Y
2007
#将一个妙格式化为标准日期（限于高版本系统）
date -d "@1211231243" +%Y-%m-%d-%T
2008-05-20-05:07:23

#######################################
替换操作

查找： grep "要找的字符串" -rl 目录

替换： sed -i "s/要查找的字符串/替换字符串/g"         grep "要查找的字符串" -rl 目录
       sed -i "/^pearls/s/$/,jcui/" ab.txt   匹配ab.txt文件中以pearls开头的行在行尾追加,jcui
       sed -i 's/^AllowUsers/& jlin/g' /etc/ssh/sshd_config


echo -e "1\n2\n3\n4" | sed -n 'N;s/\n/ /;p'
sed先读入第一行到pattern space，然后执行N命令，将第二行追加进pattern space
这时pattern space里面就是1\n2，然后执行s/\n/ /，将换行符替换成空格，最后打印。

echo -e "1\n2\n3\n4" | sed -n 'n;s/\n/ /;p'
sed先读入第一行到pattern space，然后执行n命令，用第二行覆盖pattern space
这时pattern space里面就是2，然后执行s/\n/ /，因为pattern space里没有\n，所以不做任何替换，直接打印

############################################################################

#解决只读文件系统

解决方法：RH5下,因磁盘改变,而导致系统停在Ctrl+d,此时需输入密码进入修改fstab文件,把相应的磁盘挂载点注释或删除掉即可.
但在rh5下,此时进入后是没有写权限的,这时候修改fstab时总显示只读无法更改保存
这里告诉大家一条命令,先退出vi,直接在命令行输入下面命令就可顺利编辑保存vi操作了.
mount -o remount,rw / 注意逗号之间没有空格

卷标：
对于ext2/ext3类型文件系统使用工具：e2label


############################################################################
#批量打包，各自打各自的包
#!/bin/bash

#先列出所有的文件,把值扔给Files:
Files=`ls -l . | gawk '/^-/{ print $NF }'`

#打包罗.......
for File in $Files
  do
    tar cvzfp $File.tar.gz $File
done
############################################################################
#批量解包，各自解各自的包
#!/bin/bash

#先列出所有的文件,把值扔给Files:
Files=`ls -l . | gawk '/^-/{ print $NF }'`

#解包罗.......
for File in $Files
  do
    tar xzvfp $File
done
############################################################################
#批量解包，各自解各自的包2
#!/bin/bash
Files=`ls -l *.tar.gz | awk '/^-/{ print $NF }'`

for File in $Files
  do
    tar xzvfp $File
done
rm -rf *.tar.gz
############################################################################
ls |xargs -i -t tar zxvpf {} -C /home/xiyou/xiyou/server10/logs/
############################################################################
#!/bin/bash
Files=`ls -l world.log.* | awk '/^-/{ print $NF }'`

for File in $Files
  do
    tar czvfp $File.tar.gz $File
done
############################################################################
服务器端配置rsyslog.conf配置文件

$template myFormat,"%msg%\n"                                 #定义模板
$template MyFile,"/var/log/sysinfo/%FROMHOST-IP%.log"        #定义文件名,这里以IP命名
$ActionFileDefaultTemplate myFormat                          #引用模板

local3.*   -?MyFile ;myFormat                                #将获取的日志指定文件名

#模本参数
%timegenerated:::date-mysql%','%timereported:::date-mysql%','%msg%','%fromhost-ip%','%syslogtag%'

客户端配置: 都需要重启服务
local3.* @@192.168.0.14      #rsyslog  以TCP方式传送

local3.* @192.168.0.14       #syslog   以UDP方式传送


发送命令: logger -t "192.168.70.13" -p local3.info -f /var/log/sysinfo.log
############################################################################

linux 服务器禁ping的方法

cd /proc/sys/net/ipv4

echo 1 >/proc/sys/net/ipv4/icmp_echo_ignore_all    #开启禁ping的功能
echo 0 >/proc/sys/net/ipv4/icmp_echo_ignore_all    #关闭禁ping的功能

############################################################################
系统参数相关

# uname -a               # 查看内核/操作系统/CPU信息
# head -n 1 /etc/issue   # 查看操作系统版本
# cat /proc/cpuinfo      # 查看CPU信息
# hostname               # 查看计算机名
# lspci -tv              # 列出所有PCI设备
# lsusb -tv              # 列出所有USB设备
# lsmod                  # 列出加载的内核模块
# env                    # 查看环境变量
# getconf LONG_BIT       # 查看操作系统位数
# lsb_release -a         # 查看操作系统版本
# dmidecode | grep "Product Name"   # 查看主机的型号
# dmidecode|grep -P -A5 "Memory\s+Device"|grep Size|grep -v Range     #查看服务器内存的条数及插槽位置及内存大小
# dmidecode|grep -P 'Maximum\s+Capacity'     #查看最大支持内存数
# dmidecode|grep -A16 "Memory Device"|grep 'Speed'     #查看每条内存的实际频率

############################################################################
#收藏常用正则表达式用法

"^\d+$"　　//非负整数（正整数 + 0）
"^[0-9]*[1-9][0-9]*$"　　//正整数
"^((-\d+)|(0+))$"　　//非正整数（负整数 + 0）
"^-[0-9]*[1-9][0-9]*$"　　//负整数
"^-?\d+$"　　　　//整数
"^\d+(\.\d+)?$"　　//非负浮点数（正浮点数 + 0）
"^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$"　　//正浮点数
"^((-\d+(\.\d+)?)|(0+(\.0+)?))$"　　//非正浮点数（负浮点数 + 0）
"^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$"　　//负浮点数 //PHP开源代码
"^(-?\d+)(\.\d+)?$"　　//浮点数
"^[A-Za-z]+$"　　//由26个英文字母组成的字符串
"^[A-Z]+$"　　//由26个英文字母的大写组成的字符串
"^[a-z]+$"　　//由26个英文字母的小写组成的字符串
"^[A-Za-z0-9]+$"　　//由数字和26个英文字母组成的字符串
"^\w+$"　　//由数字、26个英文字母或者下划线组成的字符串
"^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$"　　　　//email地址
"^[a-zA-z]+://(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\S*)?$"　　//url
/^(d{2}|d{4})-((0([1-9]{1}))|(1[1|2]))-(([0-2]([1-9]{1}))|(3[0|1]))$/   //  年-月-日
/^((0([1-9]{1}))|(1[1|2]))/(([0-2]([1-9]{1}))|(3[0|1]))/(d{2}|d{4})$/   // 月/日/年
"^([w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$"   //Emil
//OSPHP.com.CN

/^((\+?[0-9]{2,4}\-[0-9]{3,4}\-)|([0-9]{3,4}\-))?([0-9]{7,8})(\-[0-9]+)?$/     //电话号码
"^(d{1,2}|1dd|2[0-4]d|25[0-5]).(d{1,2}|1dd|2[0-4]d|25[0-5]).(d{1,2}|1dd|2[0-4]d|25[0-5]).(d{1,2}|1dd|2[0-4]d|25[0-5])$"   //IP地址

匹配中文字符的正则表达式： [\u4e00-\u9fa5]
匹配双字节字符(包括汉字在内)：[^\x00-\xff]
匹配空行的正则表达式：\n[\s| ]*\r
匹配HTML标记的正则表达式：/<(.*)>.*<\/\1>|<(.*) \/>/
匹配首尾空格的正则表达式：(^\s*)|(\s*$)
匹配Email地址的正则表达式：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*
匹配网址URL的正则表达式：^[a-zA-z]+://(\\w+(-\\w+)*)(\\.(\\w+(-\\w+)*))*(\\?\\S*)?$
//开源OSPhP.COM.CN


匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$
匹配国内电话号码：(\d{3}-|\d{4}-)?(\d{8}|\d{7})?
匹配腾讯QQ号：^[1-9]*[1-9][0-9]*$


元字符及其在正则表达式上下文中的行为：

\ 将下一个字符标记为一个特殊字符、或一个原义字符、或一个后向引用、或一个八进制转义符。

^ 匹配输入字符串的开始位置。如果设置了 RegExp 对象的Multiline 属性，^ 也匹配 ’\n’ 或 ’\r’ 之后的位置。

$ 匹配输入字符串的结束位置。如果设置了 RegExp 对象的Multiline 属性，$ 也匹配 ’\n’ 或 ’\r’ 之前的位置。

* 匹配前面的子表达式零次或多次。

+ 匹配前面的子表达式一次或多次。+ 等价于 {1,}。

? 匹配前面的子表达式零次或一次。? 等价于 {0,1}。
//开源代码OSPhP.COm.CN


{n} n 是一个非负整数，匹配确定的n 次。

{n,} n 是一个非负整数，至少匹配n 次。

{n,m} m 和 n 均为非负整数，其中n <= m。最少匹配 n 次且最多匹配 m 次。在逗号和两个数之间不能有空格。

? 当该字符紧跟在任何一个其他限制符 (*, +, ?, {n}, {n,}, {n,m}) 后面时，匹配模式是非贪婪的。非贪婪模式尽可能少的匹配所搜索的字符串，而默认的贪婪模式则尽可能多的匹配所搜索的字符串。

. 匹配除 "\n" 之外的任何单个字符。要匹配包括 ’\n’ 在内的任何字符，请使用象 ’[.\n]’ 的模式。
(pattern) 匹配pattern 并获取这一匹配。

(?:pattern) 匹配pattern 但不获取匹配结果，也就是说这是一个非获取匹配，不进行存储供以后使用。

(?=pattern) 正向预查，在任何匹配 pattern 的字符串开始处匹配查找字符串。这是一个非获取匹配，也就是说，该匹配不需要获取供以后使用。
//OsPHP.COM.CN


(?!pattern) 负向预查，与(?=pattern)作用相反

x|y 匹配 x 或 y。

[xyz] 字符集合。

[^xyz] 负值字符集合。

[a-z] 字符范围，匹配指定范围内的任意字符。

[^a-z] 负值字符范围，匹配任何不在指定范围内的任意字符。

\b 匹配一个单词边界，也就是指单词和空格间的位置。

\B 匹配非单词边界。

\cx 匹配由x指明的控制字符。

\d 匹配一个数字字符。等价于 [0-9]。

\D 匹配一个非数字字符。等价于 [^0-9]。

\f 匹配一个换页符。等价于 \x0c 和 \cL。

\n 匹配一个换行符。等价于 \x0a 和 \cJ。

\r 匹配一个回车符。等价于 \x0d 和 \cM。

\s 匹配任何空白字符，包括空格、制表符、换页符等等。等价于[ \f\n\r\t\v]。

\S 匹配任何非空白字符。等价于 [^ \f\n\r\t\v]。
//开源OSPhP.COM.CN


\t 匹配一个制表符。等价于 \x09 和 \cI。

\v 匹配一个垂直制表符。等价于 \x0b 和 \cK。

\w 匹配包括下划线的任何单词字符。等价于’[A-Za-z0-9_]’。

\W 匹配任何非单词字符。等价于 ’[^A-Za-z0-9_]’。

\xn 匹配 n，其中 n 为十六进制转义值。十六进制转义值必须为确定的两个数字长。

\num 匹配 num，其中num是一个正整数。对所获取的匹配的引用。

\n 标识一个八进制转义值或一个后向引用。如果 \n 之前至少 n 个获取的子表达式，则 n 为后向引用。否则，如果 n 为八进制数字 (0-7)，则 n 为一个八进制转义值。

\nm 标识一个八进制转义值或一个后向引用。如果 \nm 之前至少有is preceded by at least nm 个获取得子表达式，则 nm 为后向引用。如果 \nm 之前至少有 n 个获取，则 n 为一个后跟文字 m 的后向引用。如果前面的条件都不满足，若 n 和 m 均为八进制数字 (0-7)，则 \nm 将匹配八进制转义值 nm。 //OSPHP.com.CN

\nml 如果 n 为八进制数字 (0-3)，且 m 和 l 均为八进制数字 (0-7)，则匹配八进制转义值 nml。

\un 匹配 n，其中 n 是一个用四个十六进制数字表示的Unicode字符。

匹配中文字符的正则表达式： [u4e00-u9fa5]

匹配双字节字符(包括汉字在内)：[^x00-xff]

匹配空行的正则表达式：n[s| ]*r

匹配HTML标记的正则表达式：/<(.*)>.*|<(.*) />/

匹配首尾空格的正则表达式：(^s*)|(s*$)

匹配Email地址的正则表达式：w+([-+.]w+)*@w+([-.]w+)*.w+([-.]w+)*

匹配网址URL的正则表达式：http://([w-]+.)+[w-]+(/[w- ./?%&=]*)?

利用正则表达式限制网页表单里的文本框输入内容：

用正则表达式限制只能输入中文：onkeyup="value=value.replace(/[^u4E00-u9FA5]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^u4E00-u9FA5]/g,''))"

用正则表达式限制只能输入全角字符： onkeyup="value=value.replace(/[^uFF00-uFFFF]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^uFF00-uFFFF]/g,''))" //开源代码OSPHP.COM.Cn

用正则表达式限制只能输入数字：onkeyup="value=value.replace(/[^d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^d]/g,''))"

用正则表达式限制只能输入数字和英文：onkeyup="value=value.replace(/[W]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^d]/g,''))"

=========常用正则式

匹配中文字符的正则表达式： [\u4e00-\u9fa5]

匹配双字节字符(包括汉字在内)：[^\x00-\xff]

匹配空行的正则表达式：\n[\s| ]*\r

匹配HTML标记的正则表达式：/<(.*)>.*<\/\1>|<(.*) \/>/

匹配首尾空格的正则表达式：(^\s*)|(\s*$)

匹配IP地址的正则表达式：/(\d+)\.(\d+)\.(\d+)\.(\d+)/g //

匹配Email地址的正则表达式：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)* //OSPHP.COM.Cn开源

匹配网址URL的正则表达式：http://(/[\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?

sql语句：^(select|drop|delete|create|update|insert).*$

1、非负整数：^\d+$

2、正整数：^[0-9]*[1-9][0-9]*$

3、非正整数：^((-\d+)|(0+))$

4、负整数：^-[0-9]*[1-9][0-9]*$

5、整数：^-?\d+$

6、非负浮点数：^\d+(\.\d+)?$

7、正浮点数：^((0-9)+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$

8、非正浮点数：^((-\d+\.\d+)?)|(0+(\.0+)?))$

9、负浮点数：^(-((正浮点数正则式)))$

10、英文字符串：^[A-Za-z]+$

11、英文大写串：^[A-Z]+$

12、英文小写串：^[a-z]+$

13、英文字符数字串：^[A-Za-z0-9]+$

14、英数字加下划线串：^\w+$

15、E-mail地址：^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$
//开源代码OSPHP.COM.Cn


16、URL：^[a-zA-Z]+://(\w+(-\w+)*)(\.(\w+(-\w+)*))*(\?\s*)?$
或：^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~@[\]\':+!]*([^<>\"\"])*$

17、邮政编码：^[1-9]\d{5}$

18、中文：^[\u0391-\uFFE5]+$

19、电话号码：^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$

20、手机号码：^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$

21、双字节字符(包括汉字在内)：^\x00-\xff

22、匹配首尾空格：(^\s*)|(\s*$)（像vbscript那样的trim函数）

23、匹配HTML标记：<(.*)>.*<\/\1>|<(.*) \/>

24、匹配空行：\n[\s| ]*\r

25、提取信息中的网络链接：(h|H)(r|R)(e|E)(f|F) *= *('|")?(\w|\\|\/|\.)+('|"| *|>)?
//OSPHP.COM.Cn开源

"

26、提取信息中的邮件地址：\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*

27、提取信息中的图片链接：(s|S)(r|R)(c|C) *= *('|")?(\w|\\|\/|\.)+('|"| *|>)?
"
28、提取信息中的IP地址：(\d+)\.(\d+)\.(\d+)\.(\d+)

29、提取信息中的中国手机号码：(86)*0*13\d{9}

30、提取信息中的中国固定电话号码：(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8}

31、提取信息中的中国电话号码（包括移动和固定电话）：(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}

32、提取信息中的中国邮政编码：[1-9]{1}(\d+){5}

33、提取信息中的浮点数（即小数）：(-?\d*)\.?\d+

34、提取信息中的任何数字 ：(-?\d*)(\.\d+)?
//oSPHP.COM.CN


35、IP：(\d+)\.(\d+)\.(\d+)\.(\d+)

36、电话区号：/^0\d{2,3}$/

37、腾讯QQ号：^[1-9]*[1-9][0-9]*$

38、帐号(字母开头，允许5-16字节，允许字母数字下划线)：^[a-zA-Z][a-zA-Z0-9_]{4,15}$

39、中文、英文、数字及下划线：^[\u4e00-\u9fa5_a-zA-Z0-9]+$


############################################################################

整数比较

-eq        等于,如:if [ "$a" -eq "$b" ]
-ne        不等于,如:if [ "$a" -ne "$b" ]
-gt        大于,如:if [ "$a" -gt "$b" ]
-ge        大于等于,如:if [ "$a" -ge "$b" ]
-lt        小于,如:if [ "$a" -lt "$b" ]
-le        小于等于,如:if [ "$a" -le "$b" ]
<        小于(需要双括号),如:(("$a" < "$b"))
<=        小于等于(需要双括号),如:(("$a" <= "$b"))
>        大于(需要双括号),如:(("$a" > "$b"))
>=        大于等于(需要双括号),如:(("$a" >= "$b"))

字符串比较
=        等于,如:if [ "$a" = "$b" ]
==        等于,如:if [ "$a" == "$b" ],与=等价
        注意:==的功能在[[]]和[]中的行为是不同的,如下:
        1 [[ $a == z* ]]    # 如果$a以"z"开头(模式匹配)那么将为true
        2 [[ $a == "z*" ]]  # 如果$a等于z*(字符匹配),那么结果为true
        3
        4 [ $a == z* ]      # File globbing 和word splitting将会发生
        5 [ "$a" == "z*" ]  # 如果$a等于z*(字符匹配),那么结果为true
        一点解释,关于File globbing是一种关于文件的速记法,比如"*.c"就是,再如~也是.
        但是file globbing并不是严格的正则表达式,虽然绝大多数情况下结构比较像.
!=        不等于,如:if [ "$a" != "$b" ]
        这个操作符将在[[]]结构中使用模式匹配.
<        小于,在ASCII字母顺序下.如:
        if [[ "$a" < "$b" ]]
        if [ "$a" \< "$b" ]
        注意:在[]结构中"<"需要被转义.
>        大于,在ASCII字母顺序下.如:
        if [[ "$a" > "$b" ]]
        if [ "$a" \> "$b" ]
        注意:在[]结构中">"需要被转义.
        具体参考Example 26-11来查看这个操作符应用的例子.
-z        字符串为"null".就是长度为0.
-n        字符串不为"null"
        注意:
        使用-n在[]结构中测试必须要用""把变量引起来.使用一个未被""的字符串来使用! -z
        或者就是未用""引用的字符串本身,放到[]结构中。虽然一般情况下可
        以工作,但这是不安全的.习惯于使用""来测试字符串是一种好习惯.

#######################################################################################
#正则表达式
一个正则表达式就是由普通字符（例如字符 a 到 z）以及特殊字符（称为元字符）组成的文字模式。该模式描述在查找文字主体时待匹配的一个或多个字符串。正则表达式作为一个模板，将某个字符模式与所搜索的字符串进行匹配。

\

#将下一个字符标记为一个特殊字符、或一个原义字符、或一个 后向引用、或一个八进制转义符。例如，'n' 匹配字符 "n"。'\n' 匹配一个换行符。序列 '\\' 匹配 "\" 而 "\(" 则匹配 "("。

^

匹配输入字符串的开始位置。

$

匹配输入字符串的结束位置。

*

匹配前面的子表达式零次或多次。例如，zo* 能匹配 "z" 以及 "zoo"。 * 等价于{0,}。

+

匹配前面的子表达式一次或多次。例如，'zo+' 能匹配 "zo" 以及 "zoo"，但不能匹配 "z"。+ 等价于 {1,}。

?

匹配前面的子表达式零次或一次。例如，"do(es)?" 可以匹配 "do" 或 "does" 中的"do" 。? 等价于 {0,1}。

{n}

n 是一个非负整数。匹配确定的 n 次。例如，'o{2}' 不能匹配 "Bob" 中的 'o'，但是能匹配 "food" 中的两个 o。

{n,}

n 是一个非负整数。至少匹配n 次。例如，'o{2,}' 不能匹配 "Bob" 中的 'o'，但能匹配 "foooood" 中的所有 o。'o{1,}' 等价于 'o+'。'o{0,}' 则等价于 'o*'。

{n,m}

m 和 n 均为非负整数，其中n <= m。最少匹配 n 次且最多匹配 m 次。 "o{1,3}" 将匹配 "fooooood" 中的前三个 o。'o{0,1}' 等价于 'o?'。请注意在逗号和两个数之间不能有空格。

?

当该字符紧跟在任何一个其他限制符 (*, +, ?, {n}, {n,}, {n,m}) 后面时，匹配模式是非贪婪的。非贪婪模式尽可能少的匹配所搜索的字符串，而默认的贪婪模式则尽可能多的匹配所搜索的字符串。例如，对于字符串 "oooo"，'o+?' 将匹配单个 "o"，而 'o+' 将匹配所有 'o'。

.

匹配除 "\n" 之外的任何单个字符。要匹配包括 '\n' 在内的任何字符，请使用象 '[.\n]' 的模式。

(pattern)

匹配pattern 并获取这一匹配。所获取的匹配可以从产生的 Matches 集合得到，在VBScript 中使用 SubMatches 集合，在Visual Basic Scripting Edition 中则使用 $0…$9 属性。要匹配圆括号字符，请使用 '\(' 或 '\)'。

(?:pattern)

#匹配 pattern 但不获取匹配结果，也就是说这是一个非获取匹配，不进行存储供以后使用。这在使用 "或" 字符 (|) 来组合一个模式的各个部分是很有用。例如， 'industr(?:y|ies) 就是一个比 'industry|industries' 更简略的表达式。

(?=pattern)

正向预查，在任何匹配 pattern 的字符串开始处匹配查找字符串。这是一个非获取匹配，也就是说，该匹配不需要获取供以后使用。例如， 'Windows (?=95|98|NT|2000)' 能匹配 "Windows 2000" 中的 "Windows" ，但不能匹配 "Windows 3.1" 中的 "Windows"。预查不消耗字符，也就是说，在一个匹配发生后，在最后一次匹配之后立即开始下一次匹配的搜索，而不是从包含预查的字符之后开始。

(?!pattern)

负向预查，在任何不匹配Negative lookahead matches the search string at any point where a string not matching pattern 的字符串开始处匹配查找字符串。这是一个非获取匹配，也就是说，该匹配不需要获取供以后使用。例如'Windows (?!95|98|NT|2000)' 能匹配 "Windows 3.1" 中的 "Windows"，但不能匹配 "Windows 2000" 中的 "Windows"。预查不消耗字符，也就是说，在一个匹配发生后，在最后一次匹配之后立即开始下一次匹配的搜索，而不是从包含预查的字符之后开始。

x|y

匹配 x 或 y。例如，'z|food' 能匹配 "z" 或 "food"。'(z|f)ood' 则匹配 "zood" 或 "food"。

[xyz]

字符集合。匹配所包含的任意一个字符。例如， '[abc]' 可以匹配 "plain" 中的 'a'。

[^xyz]

负值字符集合。匹配未包含的任意字符。例如， '[^abc]' 可以匹配 "plain" 中的'p'。

[a-z]

字符范围。匹配指定范围内的任意字符。例如，'[a-z]' 可以匹配 'a' 到 'z' 范围内的任意小写字母字符。

[^a-z]

负值字符范围。匹配任何不在指定范围内的任意字符。例如，'[^a-z]' 可以匹配任何不在 'a' 到 'z' 范围内的任意字符。

\b

匹配一个单词边界，也就是指单词和空格间的位置。例如， 'er\b' 可以匹配"never" 中的 'er'，但不能匹配 "verb" 中的 'er'。

\B

匹配非单词边界。'er\B' 能匹配 "verb" 中的 'er'，但不能匹配 "never" 中的 'er'。

\cx

匹配由x指明的控制字符。例如， \cM 匹配一个 Control-M 或回车符。 x 的值必须为 A-Z 或 a-z 之一。否则，将 c 视为一个原义的 'c' 字符。

\d

匹配一个数字字符。等价于 [0-9]。

\D

匹配一个非数字字符。等价于 [^0-9]。

\f

匹配一个换页符。等价于 \x0c 和 \cL。

\n

匹配一个换行符。等价于 \x0a 和 \cJ。

\r

匹配一个回车符。等价于 \x0d 和 \cM。

\s

匹配任何空白字符，包括空格、制表符、换页符等等。等价于 [ \f\n\r\t\v]。

\S

匹配任何非空白字符。等价于 [^ \f\n\r\t\v]。

\t

匹配一个制表符。等价于 \x09 和 \cI。

\v

匹配一个垂直制表符。等价于 \x0b 和 \cK。

\w

匹配包括下划线的任何单词字符。等价于'[A-Za-z0-9_]'。

\W

匹配任何非单词字符。等价于 '[^A-Za-z0-9_]'。

\xn

匹配 n，其中 n 为十六进制转义值。十六进制转义值必须为确定的两个数字长。例如， '\x41' 匹配 "A"。'\x041' 则等价于 '\x04' & "1"。正则表达式中可以使用 ASCII 编码。.

\num

匹配 num，其中 num 是一个正整数。对所获取的匹配的引用。例如，'(.)\1' 匹配两个连续的相同字符。

\n

标识一个八进制转义值或一个后向引用。如果 \n 之前至少 n 个获取的子表达式，则 n 为后向引用。否则，如果 n 为八进制数字 (0-7)，则 n 为一个八进制转义值。

\nm

标识一个八进制转义值或一个后向引用。如果 \nm 之前至少有is preceded by at least nm 个获取得子表达式，则 nm 为后向引用。如果 \nm 之前至少有 n 个获取，则 n 为一个后跟文字 m 的后向引用。如果前面的条件都不满足，若 n 和 m 均为八进制数字 (0-7)，则 \nm 将匹配八进制转义值 nm。

\nml

如果 n 为八进制数字 (0-3)，且 m 和 l 均为八进制数字 (0-7)，则匹配八进制转义值 nml。

\un

匹配 n，其中 n 是一个用四个十六进制数字表示的 Unicode 字符。例如， \u00A9 匹配版权符号 (?)。

/*****************************************************************************************/

几乎所有重要问题都需要从无用数据中过滤出有用数据。了解大量的 UNIX? 命令行实用工具如何使用正则表达式 来去芜取精。
非常奇怪，直到今天我仍然能重复周六早上的经典歌曲“Conjunction Junction”。这是好事（看了太多电视）还是坏事（也许是我现在职业的先兆）仍然有待讨论。不管怎样，这首小调在欢快的节奏下传递了基本的信息。

我还没有为学习 UNIX 构想出与“Conjunction Junction”相似的作品，但是我会在未来的几个月里尝试亲手编写这样的歌曲。与此同时，趁着快乐回忆所带来的好心情，我们继续以 Schoolhouse 摇滚的传统学习方式攻克命令行。

现在开始上课。吐出嘴里的口香糖，回到您的座位上，然后拿出一根二号铅笔。还有您，Spicoli。

模仿秀

您可以将 UNIX 命令行看作是一句话：

可执行命令，如 cat 或 ls，是动词——操作。
命令的输出是名词——要查阅或使用的数据。
Shell 操作符，如 |（管道）或 >（重定向标准输出），是连词——用于连接句子。
例如，命令行：ls -A | wc -l 用于计算当前目录下的条目数（忽略特殊条目 . 和 ..），它包含两个句子。第一个句子 ls -A 是动词结构，列举当前目录下的内容，第二个句子 wc -l 是另一个动词结构，用于计算行数。第一个句子输出的结果作为第二个句子的输入，并由连接词（管道）连接这两个句子。

在本系列文章以及其他文章中展示的许多您可能已经学习过的命令行句式都具有这种句子结构。

但是，如果缺少了文法上的修饰语，命令行将显得不专业。当然，基本句子也能完成工作，但是这样显得不优美。（在此对高中英语演唱二人组 Rad 女士和 Perlstein 女士表示歉意。）解决更有趣的问题需要用到形容词。

几乎所有重要问题都需要从无用数据中过滤出有用数据。虽然属性的数量和种类会有所不同，但是每种方案都通过某种方式（形式或格式），隐式或显式地描述了它要查找并处理的信息，从而生成另外一种形式的其他信息。

在命令行中，正则表达式 的作用相当于形容词——一种描述或限定词。在应用到输出时，正则表达式可辨别相关数据和无关数据。

标点概述

让我们看一个示例问题。

grep 实用工具逐行过滤输入并寻找匹配。grep 的最简单应用是打印那些包含与某个模式匹配的文本的行。grep 可以查找具有固定顺序的字符组合，甚至可以通过使用 -i 选项来忽略大小写。

因此，假定文件 heroes.txt 包含以下行：

CatwomanBatmanThe TickSpider ManBlack CatBatgirlDanger GirlWonder WomanLuke CageThe PunisherAnt ManDead GirlAquamanSCUDSpider WomanBlackboltMartian Manhunter


命令行：

grep -i man heroes.txt


将生成：

CatwomanBatmanSpider ManWonder WomanAnt ManAquamanMartian Manhunter


其中 grep 扫描 heroes.txt 文件中的每一行并查找字母 m，后面紧跟 a，然后紧跟 n。除了必须保证相邻，这些字母可以出现在行的任何位置，甚至可以位于较大的单词中间。在不考虑大小写的情况下（-i 选项），Catwoman、Batman、Spider Man、Wonder Woman、Ant Man、Aquaman 和 Martian Manhunter 都包含字符串 man。

grep 实用工具包含其他可优化搜索的内置选项。例如，-w 选项限制于匹配整个单词，因此 grep -i -w man 将排除 Catwoman 和 Batman（举例来说）。

该工具还有一个优秀的功能，可以排除而不是包括所有匹配的搜索结果。使用 -v 选项来排除 匹配的行。例如：

grep -v -i 'spider' heroes.txt


将打印除了包含字符串 spider 之外的所有行。

CatwomanBatmanThe TickBlack CatBatgirlDanger GirlWonder WomanLuke CageThe PunisherAnt ManDead GirlAquamanSCUDBlackboltMartian Manhunter


但是，对于以下这些情况，您该如何处理？只希望得到那些开头为“Bat”的单词；或者以“bat”、“Bat”、“cat”或“Cat”开头的单词？或者希望知道有多少漫画复仇者的名字以“man”结束。在这些实例中，类似于上述三个示例的简单字符串搜索将无法满足要求，因为这些搜索不区分位置。

位置、位置、位置和备选项

正则表达式可以 过滤特定的位置，例如行的开始或结束，以及单词的开始和结束。正则表达式（通常简写为 regex）还可以描述：备选项（您可将其称为“this”或“that”）；固定长度、可变长度或不定长度的重复；范围（例如，“a-m 之间的任意字母”）；还有字符的类别或种类（“可打印字符”或“标点符号”），以及其他技术。

表 1 显示了一些常用的正则表达式操作符。您可以连接表 1 中显示的元素（以及其他操作符）并加以组合使用，从而构建（非常）复杂的正则表达式。


表 1. 常用的正则表达式操作符
操作符 用途
.（句号） 匹配任意单个字符。
^（脱字号） 匹配出现在行首或字符串开始位置的空字符串。
$（美元符号） 匹配出现在行末的空字符串。
A  匹配大写字母 A。
a  匹配小写字母 a。
\d  匹配任意一位数字。
\D  匹配任意单个非数字字符。
\w  匹配任意单个字母数字字符，同义词是 [:alnum:]。
[A-E]  匹配任意大写的 A、B、C、D 或 E。
[^A-E]  匹配除 A、B、C、D 和 E 之外的任意字符。
X?  匹配出现零次或一次的大写字母 X。
X*  匹配零个或任意个大写 X。
X+  匹配一个或多个字母 X。
X{n}  精确匹配 n 个字母 X。
X{n,m}  匹配最少 n 个并且不超过 m 个字母 X。如果省略 m，表达式将尝试匹配最少 n 个 X。
(abc|def)+  匹配一连串的（最少一个） abc 或 def；abc 和 def 将匹配。

以下是一些使用 grep 作为搜索工具的正则表达式示例。许多其他 UNIX 工具，包括交互式编辑器 vi 和 Emacs、流编辑器 sed 和 awk，以及所有现代编程语言都支持正则表达式。在您学会正则表达式的语法（也许相当晦涩）之后，就可以将您的专业知识灵活运用到不同的工具、编程语言和操作系统。

查找以“Bat”开头的名称

要查找以“Bat”开头的名称，请使用：

grep -E '^Bat'


可以使用 -E 选项来指定正则表达式。^（脱字号）字符匹配行首或字符串的开头，这是一个出现在每行或每个字符串开头字符之前的假想字符。字母 B、a 和 t 只具有字面含义并且仅匹配那些特定的字符。因此，命令 grep -E '^Bat' 将生成：

BatmanBatgirl


由于许多 regex 操作符也为 Shell 所使用（其中一些具有不同的用途，另外一些则有类似的用途），因此一个好的习惯是使用单引号将命令行中的每个 regex 括起来，以保护 regex 操作符免遭 Shell 的误解。例如，*（星号）和 $（美元符号）都是 regex 操作符，并且对于您的 Shell 具有特殊的含义。

查找以“man”结尾的名称

要查找以“man”结尾的名称，可以使用 regex man$ 来匹配序列 m、a 和 n，并且后面紧接与 regex 操作符 $ 匹配的行（字符串）。

查找空行

基于 ^ 和 $ 的作用，您可以使用 regex ^$ 来查找空行（相当于在开始之后立即结束的行）。

备选项或集合操作符

要查找以“bat”、“Bat”、“cat”或“Cat”开头的单词，可以使用以下两个技巧。首先是备选项，如果备选项中的任意 模式匹配，都会产生匹配的结果。例如，命令：

grep -E '^(bat|Bat|cat|Cat)' heroes.txt


可实现这一技巧。regex 操作符 |（竖线）表示备选项，因此 this|that 匹配字符串 this 或字符串 that。因此，^(bat|Bat|cat|Cat) 表示“行首紧跟 bat、Bat、cat 或 Cat之一。”当然，可以使用 grep -i 来简化该 regex，这样可以忽略大小写，从而将命令简化为：

grep -i -E '^(bat|cat)' heroes.txt


匹配“bat”、“Bat”、“cat”或“Cat”的另一个方法是使用 [ ]（方括号）集合 操作符。如果将一组字符放在一个集合中，则可以匹配那些字符中的任意一个。（您可以将集合 看作是字符备选项的简写法。）

例如，命令行：

grep -E '^[bcBC]at' heroes.txt


与以下命令生成的结果相同：

grep -E '^(bat|Bat|cat|Cat)' heroes.txt

找到匹配行的上一行内容

grep -E 'HKEY_|Autodesk' cc.txt |grep -A1 'Autodesk'|grep HKEY

找到匹配行的下一行内容

grep -E 'HKEY_|Autodesk' cc.txt |grep -B1 'Autodesk'|grep HKEY|grep -V 'Autodesk'

您可以再次使用 -i 将 regex 简化为 ^[bc]at。

而且，还可以使用 -（连字符）操作符在集合中指定包含的字符范围。例如，用户名通常以字母开头。假定要在提交给您的服务器的 Web 表格中验证这样的用户名，可以使用类似于 ^[A-Za-z] 的 regex。此 regex 表示“字符串的开头后紧跟任意大写字母 (A-Z) 或任意小写字母 (a-z)。”顺便说明一下，[A-z] 与 [A-Za-z] 作用相同。

还可以在集合中混合使用范围和单个字符。regex [A-MXYZ] 将匹配任意大写的 A-M、X、Y 和 Z。

并且，如果希望反转集合（即排除集合中的任意字符），可以使用特殊集合 [^ ] 并包含要排除的范围或字符。以下是反转集合的示例。要查找所有名称中包含 at 的超级英雄，并排除 Dark Knight 和 Batman，请键入：

grep -i -E '[^b]at' heroes.txt


此命令生成：

CatwomanBlack Cat


由于某些集合需要经常使用，所以设计出简化符号以代替大量字符。例如，集合 [A-z0-9_] 十分常用，因此可以简写为 \w。与此类似，操作符 \W 是集合 [^A-z0-9_] 的简写。还可以使用符号 [:alnum:] 代替 \w，使用 [^[:alnum:]] 代替 \W。

顺便说明一下，\w（以及同义词 [:alnum:]）是特定于区域的，而 [A-z0-9_] 即表示字母 A-z、数字 0-9 和下划线。如果要开发国际化应用程序，请使用区域特定的格式以使代码可以在许多区域之间移植。

跟我一起重复：重复，重复，重复

到目前为止，已经介绍了字面值、位置和两种备选项操作符。仅使用这些内容，就可以匹配大多数具有可预测 长度的模式。现在回到用户名，通过以下 regex 命令可以确保每个用户名以字母开头并紧跟恰好七个字母或数字：

[a-z][a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9][a-z0-9]


但是这样有点笨拙。而且，它只匹配恰好八个字符的用户名。它不会匹配三到八个字符之间的名称，这通常也是有效的用户名。

正则表达式还可以包括重复修饰符。重复修饰符可以指定数量，如没有、一个、多个、一个或多个，零或一个、五到十个，以及恰好三个。重复修饰符必须与其他模式组合，修饰符本身没有含义。

例如，regex：

^[A-z][A-z0-9]{2,7}$


可以实现前面描述的用户名过滤功能。用户名 是以字母开头，后面紧跟至少两个，但不超过七个字母或数字的字符串，并且紧跟字符串结尾。

此处的位置定位点非常重要。如果没有两个位置操作符，则会错误地接受任意长度的用户名。为什么呢？请考虑 regex：

^[A-z][A-z0-9]{2,7}


此命令辨别：字符串是否以字母开头并紧跟二到七个字母？但是它未提到终止条件。因此，字符串 samuelclemens 满足条件，但是它的长度显然超出了有效用户名的范围。与此类似，省略开始定位点 ^，或同时省略两个定位点将分别匹配以类似 munster1313 结束或包含该字符串的字符串。如果必须匹配特定的长度，请记得在要求的模式的开头和结尾分别加上分隔符。

以下是其他一些示例：

可以使用 {2,} 查找两次或多次重复。regex ^G[o]{2,}gle 匹配 Google、Gooogle、Goooogle 等等。
重复修饰符 ?、+ 和 * 分别查找零次或一次、一次或多次，以及零次或多次重复。（例如，您可以将 ? 看作是 {0,1} 的简写法。）
regex boys? 匹配 boy 或 boys；regex Goo?gle 匹配 Gogle 或 Google。

regex Goo+gle 匹配 Google、Gooogle、Goooogle 等等。

construct Goo*gle 匹配 Gogle、Google、Gooogle 等等。

可以将重复修饰符应用到单个字符（如上所示），还可以应用到更复杂的组合。使用 ( 和 ) 圆括号（就像数学中的用法）将修饰符应用到子表达式。下面是一个示例：给定文本文件 test.txt： The rain in Spain falls mainly on the the plain.It was the best of of times;it was the worst of times.


命令 grep -i -E '(\b(of|the)\W+){2,}' test.txt 将生成：

on the the plain.It was the best of of times;


regex 操作符 \b 匹配单词边界 或 (\W\w|\w\W)。该 regex 表示“一连串完整单词‘the’或‘of’后面紧跟非文字字符。”您可能会提出疑问，为什么 \W+ 是必需的：\b 是位于单词开头或结尾的空字符串。在单词之间必须包括这一（或这些）字符，否则该 regex 将无法找到匹配。
捕获需要注意的内容

查找文本是常见的问题，但是更常见的问题则是希望在找到文本之后将其提取出来。换句话说，您希望去粗取精。

正则表达式通过捕获 来提取信息。如果希望将需要的文本与其他内容分开，请使用圆括号将模式括起来。实际上，您已经使用圆括号收集术语；在默认情况下，圆括号自动进行捕获。

要查看捕获，请切换到 Perl。（grep 实用工具不支持捕获，因为其目标是打印包含模式的行。）

以下命令：

perl -n -e '/^The\s+(.*)$/ && print "$1\n"' heroes.txt


将打印：

TickPunisher


使用命令 perl -e 可以直接从命令行运行 Perl 程序。perl -n 命令针对输入文件的每一行运行一次程序。命令的 regex 部分，即位于斜杠之间的文本（/）表示“匹配字符串的开头，然后字母‘T’、‘h’、‘e’后紧跟一个或多个空格字符 \s+，然后捕获直到字符串结尾的所有字符。

Perl 捕获内容被放在以 $1 开头的特殊 Perl 变量中。Perl 程序的其余部分打印捕获的内容。

每个嵌套的括号对，从左开始算起，每个左圆括号加一，放在下一个特殊的数字变量中。例如：

perl -n -e '/^(\w)+-(\w+)$/ && print "$1 $2"'


将生成：

Spider ManAnt ManSpider Woman


捕获感兴趣的文本仅仅是隔靴搔痒。如果能够准确确定材料，就可以使用其他材料改变其外观。类似于 vi 和 Emacs 的编辑器将模式匹配与替换组合，从而将查找和替换文本组合成一步操作。还可以使用模式、替换和 sed 从命令行更改文本。

丰富的主题

正则表达式非常强大；可供使用的操作符的数量庞大，种类繁多。它包含如此丰富的信息和实践知识，我们在这里所能列举的实属凤毛麟角。

幸运的是，有以下三种优秀的正则表达式理论来源可供使用：

如果在您的系统上有 Perl，可以参阅 Perl Regular Expression man 页面（键入 perldoc perlre）。它会提供 regex 的精彩介绍，并包含许多有用的示例。许多编程语言都已采用 Perl 兼容的正则表达式 (PCRE)，因此您在此 man 页面读到的内容已被直接转换到 PHP、Python、Java? 和 Ruby 编程语言，以及许多其他最新工具。
Jeffrey Friedl 编著的《正则表达式》（第三版）被认为是 regex 用法方面的圣经。该书细致、准确、清晰、务实地说明了匹配的工作方式、所有的 regex 操作符、多数优先性（限制 + 和 * 匹配字符的数量），以及更多内容。此外，Friedl 的书还包括一些令人惊叹的正则表达式，可以准确地匹配完全限定的电子邮件地址和其他 Request for Comments (RFC) 特定的字符串。
Nathan Good 编著的 Regular Expression Recipes 一书提供了针对许多常见数据处理和过滤问题的有用的解决方案。如果需要提取邮政编码、电话号码或引用的字符串，请尝试 Nathan 的解决方案。
在命令行中，可以采用许多方法使用正则表达式。几乎每个处理文本的命令都支持某种形式的正则表达式。大多数 Shell 命令语法还或多或少地扩展正则表达式以匹配文件名（尽管操作符的功能可能有所不同）。

例如，键入 ls [a-c] 以查找名为 a、b 或 c 的文件。键入 ls [a-c]* 以查找以 a、b 或 c 开头的所有文件名。此处的 * 在 Shell 中不像 grep 的解释器那样修饰 [a-c]，* 被解释为 .*。? 操作符在 Shell 中也可以工作，但是被解释为 .，即匹配任意单个字符。

查看您最喜欢的实用工具或 Shell 的文档以确定哪些 regex 操作符受支持，以及操作符可能具有的独特性。
#######################################################################################

加密代码：
echo "gtalk@gmail.com" |base64 -i
得到：Z3RhbGtAZ21haWwuY29tCg==

解密代码：
echo "Z3RhbGtAZ21haWwuY29tCg==" |base64 -d
得到：gtalk@gmail.com

#######################################################################################
Lamp  环境搭建

下载文件mysql,apache,php，请到下面网址下载相应软件
http://www.apache.org
http://www.php.net
http://www.mysql.com

第一步：安装apache
进入安装目录，依次执行下面命令：
解压源码包
# tar -zxf httpd-2.0.55.tar.gz
进入安装目录
# cd httpd-2.0.55
配置apache安装信息,　配置安装后目录，模块动态配置，允许重写重配置
# ./configure --prefix=/data1/apache2 --enable-modules=so --enable-rewrite --enable-deflate --enable-cache --enable-mem-cache

#将工作模式设置为worker模式或prefork模式，默认为prefork
--with-mpm=prefork
--with-mpm=worker
执行make安装
# make; make install


第二步：配置apache
修改httpd.conf文件
//ServerName 修改主机名称，若无dns,则用IP替代
ServerName 192.168.36.163:80

//DocumentRoot　修改文档路径，就是要放置目标网页的地方
DocumentRoot "/var/www/html"
<Directory "/var/www/html">

//DirectoryIndex　修改默认的首页名称
DirectoryIndex index.html index.php index.htm

第三步：安装Nginx
./configure \
--user=apache \
--group=apache \
--prefix=/data1/nginx \
--with-http_stub_status_module \
--with-http_ssl_module \
--with-http_sub_module \
--with-md5=/usr/lib \
--with-sha1=/usr/lib \
--with-http_gzip_static_module

第四步：安装PHP

进入安装目录，依次执行下面命令：
解压源码包
# tar -zxf php-5.0.5.tar.gz
进入安装目录
# cd php-5.05

#####安装PHP------支持fastcgi

###支持Nginx的编译
gzip -cd php-5.2.17-fpm-0.5.14.diff.gz | patch -d php-5.2.17 -p1 #为PHP打FPM补丁
cd
./configure --prefix=/data1/php5 --with-apxs2=/data1/apache2/bin/apxs --with-mysql=/data1/mysql5 --with-mysqli=/data1/mysql5/bin/mysql_config --with-jpeg-dir --with-libxml-dir --with-png-dir --with-freetype-dir --with-zlib-dir --enable-soap --enable-mbstring=all --enable-sockets --with-iconv --with-gd --with-curl --enable-ftp --enable-gd-native-ttf --enable-zip --enable-xml --with-pdo-sqlite --enable-inline-optimization --enable-mbregex --with-xmlrpc --with-curlwrappers --with-openssl --enable-fpm --enable-fastcgi --enable-force-cgi-redirect


###支持apache的编译
./configure --prefix=/data1/php5 --with-config-file-path=/data1/php5/etc --with-apxs2=/data1/apache2/bin/apxs --with-mysql=/data1/mysql5 --with-mysqli=/data1/mysql5/bin/mysql_config --with-pdo-mysql=/data1/mysql5 --with-sqlite --with-pdo-sqlite --with-iconv-dir --with-freetype-dir --with-jpeg-dir --with-png-dir --with-gd --with-zlib --with-libxml-dir --with-curl --with-curlwrappers --with-openssl --with-xmlrpc --with-ldap --with-ldap-sasl --enable-xml --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --enable-mbregex --enable-mbstring --enable-gd-native-ttf --enable-ftp --enable-pcntl --enable-sockets --enable-zip --enable-soap --enable-pdo --disable-debug

###江苏118服务器编译php参数
./configure --prefix=/data1/php5 --with-mysql --with-mysqli --enable-fpm --enable-fastcgi --enable-force-cgi-redirect --with-libxml-dir --with-png-dir --with-freetype-dir --with-zlib-dir --enable-soap --enable-mbstring=all --enable-sockets --with-iconv=/usr/local/libiconv --with-gd --with-curl --enable-ftp --enable-gd-native-ttf --enable-zip --enable-xml --with-pdo-sqlite --enable-inline-optimization --enable-mbregex --with-xmlrpc --with-curlwrappers --with-openssl --disable-cli --with-mcrypt --with-mhash

配置php安装信息,　配置安装后目录，模块动态配置，允许重写重配置
# ./configure --prefix=/usr/local/php --with-apxs2=/usr/local/apache/bin/apxs --with-mysql=/usr/local/mysql/ --with-curl=/usr/local/curl --enable-ftp --with-libxml-dir=/usr/local/libxml2 --with-expat-dir=/usr/lib --enable-soap --with-xsl=/usr/local/libxslt --enable-xslt --with-gd=/usr/local/gd2/ --with-jpeg-dir=/usr/local/jpeg6/ --with-zlib-dir=/usr/lib --with-png --with-freetype-dir=/usr/local/freetype --enable-mbstring
其中./configure 后的
--prefix=/usr/local/php
--with-apxs2=/usr/local/apache/bin/apxs
--with-mysql=/usr/local/mysql/
--with-libxml-dir
--enable-mbstring
--enable-fastcgi     #如果需要开启nginx支持PHP  需开启此选项
是必要的选项

--with-gd=/usr/local/gd2/
--with-jpeg-dir=/usr/local/jpeg6/
--with-png
--with-zlib-dir=/usr/lib
--with-freetype-dir=/usr/local/freetype
这是让PHP支持GD库的配置选项


#./configure --prefix=/data1/php5 --with-config-file-path=/usr/local/etc --enable-suhosin --enable-fpm --enable-fastcgi --enable-force-cgi-redirect --disable-rpath --enable-discard-path --with-mysql=/data1/mysql5 --with-mysqli=/data1/mysql5/bin/mysql_config --with-pdo-mysql=/data1/mysql5 --with-sqlite --with-pdo-sqlite --with-iconv-dir=/usr/local --with-freetype-dir --with-jpeg-dir --with-png-dir --with-gd --with-zlib --with-libxml-dir --with-curl --with-curlwrappers --with-openssl --with-mhash --with-xmlrpc --with-mcrypt --with-ldap --with-ldap-sasl --enable-xml --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --enable-mbregex --enable-mbstring --enable-gd-native-ttf --enable-ftp --enable-pcntl --enable-sockets --enable-zip --enable-soap --enable-pdo --disable-debug --disable-ipv6

执行make安装
# make; make install



#######################################################################
Centos  yum install php 5.2 的方法

    安装相应的GPG key

# rpm --import http://www.jasonlitka.com/media/RPM-GPG-KEY-jlitka

    新建一个repo

# /etc/yum.repos.d/utterramblings.repo

    把以下内容添加进去，保存退出就OK了

[utterramblings]
#  name=Jason's Utter Ramblings Repo
baseurl=http://www.jasonlitka.com/media/EL$releasever/$basearch/
enabled=1
gpgcheck=1
gpgkey=http://www.jasonlitka.com/media/RPM-GPG-KEY-jlitka



yum install php

    安装出来的就是 php5.2

#######################################################################
用TCPDUMP捕获的TCP包的一般输出信息是：
src > dst: flags data-seqno ack window urgent options
src > dst:表明从源地址到目的地址, flags是TCP包中的标志信息,S 是SYN标志, F (FIN), P (PUSH) , R (RST) "." (没有标记); data-seqno是数据包中的数据的顺序号, ack是下次期望的顺序号, window是接收缓存的窗口大小, urgent表明数据包中是否有紧急指针. Options是选项.
D,UDP包的输出信息


#######################################################################
显示年份：cal
显示月份：date
更改属性：chmod
更改档案拥有者：chown
更改所属群组：chgrp
将文件存放倒某一目录：tar     cvf：存取；tvf浏览；xvf取出    格式：tar cvf ye.tar *.*

tar -zxvf  *.tar.gz  *   解压缩*文件
tar -czvf  *.tar.gz  /    压缩为*文件  / 后边跟路径

压缩文件：gzip
解压缩文件：gzip -d
查看linux系统位数：getconf LONG_BIT


查看挂载的磁盘：vi /etc/fstab
挂载硬盘：mount /dev/hd*1
格式化磁盘：mkfs.ext3 -L /data2 /dev/sdb1
卸载目录：umount /*

查看系统中分区占用的大小:df  (-h 详细)
查看每个文件所占用的大小:du
查看该目录下占用硬盘空间：du -k
                        du -sm / -sh
查看登陆用户个数：who | wc -l


查看DNS服务器地址:more /etc/resolv.conf



rpm的管理：
安装：rpm -ivh bash.rpm
升级：rpm -Uvh bash.rpm
验证：rpm -v bash
移除：rpm -e bash
查询：rpm -qa bash
重建：rpm --rebuilddb



系统登陆：login
系统注销：logout
关机：shutdown（仅限于root管理员权限）
显示文件：ls
新建文件：touch
创建目录（文件夹）：mkdir
删除目录（文件夹）：rmdir
进入目录：cd
退出目录：cd ..
复制文件：cp
移动文件：mv
创建文件：touch
删除文件：rm    （“rm －rf *”全部删除）
查看当前登录用户：whoami
通配符：
A：* ：任何字符和字符串。
B：? ：一个任意字符
C：[abc...] :[]内的任意一个字符。[abc]表示a、b、c任一个字符；有时候也表示范围，如[a-x],表示a到x的任一
个字符；[1-9]表示1到9的任一数字。
D：[!abc...]：和上面的相反，表示除[]内的字符外的任意一个字符
显示当前所在目录：pwd
增加用户：useradd
设置密码：passwd
搜索文件：locate
更新数据库：updatedb
显示文件内容：cat（比较小的文件）
显示文件内容：more（可以显示大文件，空格下翻页，Q键退出；但无法上翻页）
显示文件内容：less（可以显示大文件，PageUp上翻页，Q键退出；PageDown下翻页）
显示文件开头10行：head
显示文件末尾10行：tail

命令编辑：vi 可加文件名    a字符前    i字符后   A行尾   I行首
保存并退出： ：wq
不保存退出： ：q!
保存：w
保存为文件名：w name
显示行数：命令下  输入  set nu

####
sshd.conf 中開放 root 登陸即可以
PermitRootLogin yes 就可以了
####
sendmail 常用命令：
查看队列：mailq
添加用户命令：useradd -s /bin/false 用户  ----表示创建的用户禁止登录
useradd -s /bin/false bzhang             ----表示创建用户并禁止登录
echo "b_zhang" | passwd bzhang --stdin   ----表示为创建的用户设置密码
切换root权限：su -
查看账户以及权限：cat /etc/passwd
查看进程：ps -eaf|grep(more) **(sendmail)
查看监听端口：netstat -nalp|grep **(sendmail)
启动/停止/重启 sendmail进程：/etc/init.d/sendmail start/stop/restart
   :make -C /etc/mail

配置sendmail
修改/etc/mail/sendmail.mc文件：
　　    第42行和43行，把最前面的dnl删除，变成:
　　    TRUST_AUTH_MECH('EXTERNAL DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl
　　    define('confAUTH_MECHANISMS', 'EXTERNAL GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl
　　    第84 行DAEMON_OPTIONS('Port=smtp,Addr=127.0.0.1, Name=MTA')dnl把里面的127.0.0.1改成0.0.0.0，
        把mc文件编译成sendmail的配置,运行m4 sendmail.mc > sendmail.cf

编辑pop3的文件命令：vi /etc/dovecot.conf

编译sendmail.mc  :make –C /etc/mail (C是大写)

查看日志：/var/log/maillog

邮件客户端发送邮件无法通过认证，启用chkconfig saslauthd on    ####注意sendmail

强制处理队列中邮件：mail -oq(M)    M可以指定用户名

创建队列  cd /var/spool/mqueue/     mkdir q1 q2 q3 q4 q5


用户别名管理，组管理：  /etc/aliases  编辑完毕后  执行  newaliases
######################################################################################
#rsync -参数 用户名@同步服务器的IP::rsyncd.conf中那个方括号里的内容 本地存放路径
rsync -avzP 123.tar.gz jcui@192.168.0.9:/home/jcui    等同于SCP  但保留原文件创建的时间及权限。
说明： 　　
-a 参数，相当于-rlptgoD，-r 是递归 -l 是链接文件，意思是拷贝链接文件；-p 表示保持文件原有权限；-t 保持文件原有时间；-g 保持文件原有用户组；-o 保持文件原有属主；-D 相当于块设备文件； 　　
-z 传输时压缩； 　　
-P 传输进度； 　　
-v 传输时的进度等信息，和-P有点关系，自己试试。可以看文档；
-u --update 仅仅进行更新，也就是跳过所有已经存在于DST，并且文件时间晚于要备份的文件。(不覆盖更新的文件)




rsync是一个功能非常强大的工具，其命令也有很多功能特色选项，我们下面就对它的选项一一进行分析说明。
Rsync的命令格式可以为以下六种：
　　rsync [OPTION]... SRC DEST
　　rsync [OPTION]... SRC [USER@]HOST:DEST
　　rsync [OPTION]... [USER@]HOST:SRC DEST
　　rsync [OPTION]... [USER@]HOST::SRC DEST
　　rsync [OPTION]... SRC [USER@]HOST::DEST
　　rsync [OPTION]... rsync://[USER@]HOST[:PORT]/SRC [DEST]
　　对应于以上六种命令格式，rsync有六种不同的工作模式：
　　1)拷贝本地文件。当SRC和DES路径信息都不包含有单个冒号":"分隔符时就启动这种工作模式。如：rsync -a /data /backup
　　2)使用一个远程shell程序(如rsh、ssh)来实现将本地机器的内容拷贝到远程机器。当DST路径地址包含单个冒号":"分隔符时启动该模式。如：rsync -avz *.c foo:src
　　3)使用一个远程shell程序(如rsh、ssh)来实现将远程机器的内容拷贝到本地机器。当SRC地址路径包含单个冒号":"分隔符时启动该模式。如：rsync -avz foo:src/bar /data
　　4)从远程rsync服务器中拷贝文件到本地机。当SRC路径信息包含"::"分隔符时启动该模式。如：rsync -av root@172.16.78.192::www /databack
　　5)从本地机器拷贝文件到远程rsync服务器中。当DST路径信息包含"::"分隔符时启动该模式。如：rsync -av /databack root@172.16.78.192::www
　　6)列远程机的文件列表。这类似于rsync传输，不过只要在命令中省略掉本地机信息即可。如：rsync -v rsync://172.16.78.192/www
rsync参数的具体解释如下：
-v, --verbose 详细模式输出
-q, --quiet 精简输出模式
-c, --checksum 打开校验开关，强制对文件传输进行校验
-a, --archive 归档模式，表示以递归方式传输文件，并保持所有文件属性，等于-rlptgoD
-r, --recursive 对子目录以递归模式处理
-R, --relative 使用相对路径信息
-b, --backup 创建备份，也就是对于目的已经存在有同样的文件名时，将老的文件重新命名为~filename。可以使用--suffix选项来指定不同的备份文件前缀。
--backup-dir 将备份文件(如~filename)存放在在目录下。
-suffix=SUFFIX 定义备份文件前缀
-u, --update 仅仅进行更新，也就是跳过所有已经存在于DST，并且文件时间晚于要备份的文件。(不覆盖更新的文件)
-l, --links 保留软链结
-L, --copy-links 想对待常规文件一样处理软链结
--copy-unsafe-links 仅仅拷贝指向SRC路径目录树以外的链结
--safe-links 忽略指向SRC路径目录树以外的链结
-H, --hard-links 保留硬链结
-p, --perms 保持文件权限
-o, --owner 保持文件属主信息
-g, --group 保持文件属组信息
-D, --devices 保持设备文件信息
-t, --times 保持文件时间信息
-S, --sparse 对稀疏文件进行特殊处理以节省DST的空间
-n, --dry-run现实哪些文件将被传输
-W, --whole-file 拷贝文件，不进行增量检测
-x, --one-file-system 不要跨越文件系统边界
-B, --block-size=SIZE 检验算法使用的块尺寸，默认是700字节
-e, --rsh=COMMAND 指定使用rsh、ssh方式进行数据同步
--rsync-path=PATH 指定远程服务器上的rsync命令所在路径信息
-C, --cvs-exclude 使用和CVS一样的方法自动忽略文件，用来排除那些不希望传输的文件
--existing 仅仅更新那些已经存在于DST的文件，而不备份那些新创建的文件
--delete 删除那些DST中SRC没有的文件
--delete-excluded 同样删除接收端那些被该选项指定排除的文件
--delete-after 传输结束以后再删除
--ignore-errors 及时出现IO错误也进行删除
--max-delete=NUM 最多删除NUM个文件
--partial 保留那些因故没有完全传输的文件，以是加快随后的再次传输
--force 强制删除目录，即使不为空
--numeric-ids 不将数字的用户和组ID匹配为用户名和组名
--timeout=TIME IP超时时间，单位为秒
-I, --ignore-times 不跳过那些有同样的时间和长度的文件
--size-only 当决定是否要备份文件时，仅仅察看文件大小而不考虑文件时间
--modify-window=NUM 决定文件是否时间相同时使用的时间戳窗口，默认为0
-T --temp-dir=DIR 在DIR中创建临时文件
--compare-dest=DIR 同样比较DIR中的文件来决定是否需要备份
-P 等同于 --partial
--progress 显示备份过程
-z, --compress 对备份的文件在传输时进行压缩处理
--exclude=PATTERN 指定排除不需要传输的文件模式
--include=PATTERN 指定不排除而需要传输的文件模式
--exclude-from=FILE 排除FILE中指定模式的文件
--include-from=FILE 不排除FILE指定模式匹配的文件
--version 打印版本信息
--address 绑定到特定的地址
--config=FILE 指定其他的配置文件，不使用默认的rsyncd.conf文件
--port=PORT 指定其他的rsync服务端口
--blocking-io 对远程shell使用阻塞IO
-stats 给出某些文件的传输状态
--progress 在传输时现实传输过程
--log-format=formAT 指定日志文件格式
--password-file=FILE 从FILE中得到密码
--bwlimit=KBPS 限制I/O带宽，KBytes per second
-h, --help 显示帮助信息

一般都使用azv选项

######################################################################################


CVS  常用命令

CVS的路径：/data1/repository/projects
CVS的权限路径：/data1/repository/projects/acl
CVS的权限赋予：setfacl --set-file=acl/**  **     ----**表示所存在的项目
CVS的权限添加：/data1/repository/projects/acl  vi读取  ----对CVS人员赋予项目的权限
删除CVS中被锁的文件:find ./ -name "*rfl*"   #删除CVS中被锁的文件



#!/bin/bash

#!/bin/sh
i=1
while [ $i -le 50 ]
do
echo "$i" >>a.log
i=$(($i+1 ))
#sleep 10
done

#######################################################################################
#Linux 批量修改照片大小的方法
for img in `find ./ -name "*.[jJ][pP][gG]"`
do
convert -resize 85%*85% $img $img-resized;
rm $img;
mv $img-resized $img
echo $img
done
#######################################################################################

#seq命令使用
-f, --format=FORMAT      use printf style floating-point FORMAT (default: %g)
-s, --separator=STRING   use STRING to separate numbers (default: \n)
-w, --equal-width        equalize width by padding with leading zeroes


sed 参数:
PATT:模式空间,处理文件的输入行,处理文件的空间.最多保存8192字节.
HOLD:保留空间,用来保存已经处理的输入行,最多保存8192字节,默认有一个空行.

h: 将模式空间里的内容,复制到保留空间里,覆盖原来的内容
H: 将模式空间里的内容,追加到保留空间里,保留原来的内容
g: 将保留空间里的内容,复制到模式空间里,覆盖原来的内容
G: 将保留空间里的内容,追加到模式空间留,保留原来的内容
n: 对匹配行的下一行进程处理
x: 交换 模式空间和保留空间的内容

#seq -f"%3g" 9 11
9
10
11
% 后面指定数字的位数 默认是"%g", 
"%3g"那么数字位数不足部分是空格

#seq -f "str%03g" 9 11
str009
str010
str011

seq -w 98 101
098
099
100
101

seq -s" " -f"str%03g" 9 11
str009 str010 str011

例如一次制做10 個名dir001 , dir002 .. dir010 的目錄，它便很有用途,我們可以
這樣下一個命令便可了
seq -f 'dir%03g' 1 10 | xargs mkdir
或
mkdir $(seq -f 'dir%03g' 1 10)

seq -f "%03g" 1 10|xargs echo

#######################################################################################

apache常用命令：

默认主页文件存放路径：  /var/www/html/             *代表文件名  或者程序名
查看DNS 解析设置文件：    /etc/resolv.conf
httpd进程号查看路径：    /var/run/httpd.pid
httpd的配置文件路径：   /etc/httpd/conf/httpd.conf
查看某程序服务状态：  chkconfig --list|grep *
登录文件路径（日志）：   /var/log/httpd/

samba常用命令：



samba配置文件路径：/etc/samba/smb.conf     配置Share Definitions 下的参数

创建smb用户:    smbpasswd -a 用户


Samba显示中文乱码,添加下面的内容到smb.conf中
client code page = 936
dos charset = cp936
unix charset = cp936

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
远程批处理命令

#!/usr/bin/expect
foreach IP {
61.152.114.188
61.152.114.185
.............
} {
#循环，可以多台相同密码的服务器同事处理
spawn ssh username@$IP
expect {
"*(yes/no)*" { send "yes\r"}
"password:" { send "123456\r" }
}            #SSH第一次远程登录服务器
expect "username"
send "su -\r"        #SSH普通用户名密码登录
expect "Password:"
send "123456\r"        #SSH的root用户名密码登录
expect -timeout 1
expect "root"
send "route add -net 10.1.1.0 netmask 255.255.255.0 gw 10.1.1.1\r"
	  route add -net 114.251.0.0/16 gw 58.83.171.161 dev eth1
}
#输入要执行的命令，这儿是加条路由。

编辑/etc/iproute2/rt_tables，添加下面一行，定义一个叫做bgp2_table的路由表：
252 bgp2_table

下面向bgp2_table的路由表里添加一条default规则，使用bgp2的网关：(IP使用双线的网关)
ip route add net 58.83.171.160 netmask 255.255.255.224 dev eth1 table bgp2_table

ip route add 58.83.171.160/27 dev eth1 table bgp2_table
ip route add 211.151.99.64/27 dev eth0 table bgp2_table
ip route add 10.10.20.0/24 dev eth1 table bgp2_table

ip route add default via 58.83.171.161 dev eth1 table bgp2_table

下面指定所有从bgp2的ip发出的包，都使用bgp2_table的路由表：(IP使用双线的本地IP)
ip rule add from 58.83.171.166 table bgp2_table


#查看路由表
ip route list table bgp2_table
#查看路由规则
ip rule list


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# If you need to share a system created directory (系统创建目录)you can use one of the
# following (read-only/read-write):
# setsebool -P samba_export_all_ro on
# or
# setsebool -P samba_export_all_rw on

# If you want to use the useradd/groupadd family of binaries please run:
# setsebool -P samba_domain_controller on
#
# If you want to share home directories via samba please run:
# setsebool -P samba_enable_home_dirs on





启动项：chkconfig --level 3 * off/on           *代表文件名  或者程序名
查看某程序是否运行：/etc/init.d/* status

查看磁盘容量：df -h
查看目录下文件所占用的容量： du - sm *|more




压缩文档 ：
? *.Z compress 程序压缩的档案；
? *.bz2 bzip2 程序压缩的档案；
? *.gz gzip 程序压缩的档案；
? *.tar tar 程序打包的数据，并没有压缩过；
? *.tar.gz tar 程序打包的档案，其中并且经过 gzip 的压缩！




    /：根目录，系统中所有的目录都是从根目录开始。

    /bin: 存放常用命令。

    /boot: 引导核心的程序目录

    /dev:  外部设备名

    /etc:  (etcetera)系统管理所要的配置文件和子目录

    /home :存放用户主目录的地方，一般是/home/用户名。其他目录有ftp、httpd、samba等。

    /lib: (library)系统基本的动态链接库

    /lost+found

    /opt :optional(可以选择的)

    /proc： 虚拟系统，是由系统初起时内存中产生的

    /root：超级用户默认的主目录；

    /sbin：系统管理员使用的系统管理程序；

    /tmp： 存放各程序执行时所产生的临时文件；

    /usr： 占空间最大的目录，用户的很多应用程序和文件几乎全在这个目录中；

    /var：存放一些系统记录文件和配置文件；






ssh远程软件  中文显示乱码   修改 /etc/sysconfig/i18n文件、

LANG="zh_CN.GBK"
SUPPORTED="zh_CN.UTF-8:zh_CN:zh:en_US.UTF-8:en_US:en"
SYSFONT="lat0-sun16"





修改如何读取第二个端口为3307的数据库  路径为/opt/www/libraries/joomla/database/database


     72                 // connect to the server
     73                 $hostPort = $host .':3307';
     74                 if (!($this->_resource = mysql_connect( $hostPort, $user, $password, true ))) {
     75                         $this->_errorNum = 2;
     76                         $this->_errorMsg = 'Could not connect to MySQL' . mysql_error();
     77                         return;







下载ZendOptimizer-3.3：

http://downloads.phpchina.com/zend/optimizer/3.3.0/ZendOptimizer-3.3.0-linux-glibc21-i386.tar.gz

安装：

# tar zxvf ZendOptimizer-3.0.1-linux-glibc21-i386.tar.gz
# cd ZendOptimizer-3.0.1-linux-glibc21-i386
# ./install.sh

根据提示输入PHP.ini文件的位置（我的是/opt/php/etc目录下),接下来就是输入apachectl的位置，以便重起服务器（我的是/opt/apache/bin/apachectl）
# ln -s /usr/local/Zend/etc/php.ini /usr/local/php/lib/php.ini
注意配置好PHP.ini文件的路径和Apache的Apachectl文件的路径(如果按照上面的安装顺序和配置,安装ZendOptimizer-3.3时什么都不用改动.

如果ZendOptimizer-3.3安装成功,phpinfo()会出现



########################3
mount 命令用法

在决定将设备挂接之前，先要查看一下计算机是不是有个/mnt的空目录，该目录就是专门用来当作挂载点(Mount
Point)的目录。建议在/mnt里建几个/mnt/cdrom、/mnt/floppy、/mnt/mo等目录，当作目录的专用挂载点。举例而言，如
要挂载下列5个设备，其执行指令可能如下 (假设都是Linux的ext2系统，如果是Windows XX请将ext2改成vfat)：

软盘 ===>mount －t ext2 /dev/fd0 /mnt/floppy
cdrom ===>mount －t iso9660 /dev/hdc /mnt/cdrom
SCSI cdrom ===>mount －t iso9660 /dev/sdb /mnt/scdrom
SCSI cdr ===>mount －t iso9660 /dev/sdc /mnt/scdr

####格式化磁盘
mkfs.ext3 -L /data3 /dev/hda3    -L参数 卷标



解决只读文件 无法写入的问题

mount -n -o remount,rw /

#####dd命令

dd if=/dev/zero of=hello.txt bs=4000M count=2   //创建一个4G的文件 名字为hello.txt


df命令

df [options]
3.主要参数
－s：对每个Names参数只给出占用的数据块总数。
－a：递归地显示指定目录中各文件及子目录中各文件占用的数据块数。若既不指定－s，也不指定－a，则只显示Names中的每一个目录及其中的各子目录所占的磁盘块数。
－k：以1024字节为单位列出磁盘空间使用情况。
－x：跳过在不同文件系统上的目录不予统计。
－l：计算所有的文件大小，对硬链接文件则计算多次。
－i：显示inode信息而非块使用量。
－h：以容易理解的格式印出文件系统大小，例如136KB、254MB、21GB。
－P：使用POSIX输出格式。
－T：显示文件系统类型。





Mysql 常用命令


create database name; 创建数据库
create tables name ;
use databasename; 选择数据库
drop database name 直接删除数据库，不提醒
show tables; 显示表
describe tablename; 表的详细描述
select 中加上distinct去除重复字段
mysqladmin drop databasename 删除数据库前，有提示。
select version(),current_date;显示当前mysql版本和当前日期


mysql -uroot -p --socket=/data1/mysql5/data/mysql.sock -A
select host,user,password from user;    //查看权限
show  slave status\G;                   //验证主从复制
show  prosesslist;                      //验证主从复制




2、修改mysql中root的密码：

shell>mysql -u root -p

mysql> update user set password=password(”xueok654123″) where user=’root’;

mysql> flush privileges //刷新数据库

mysql>use dbname； 打开数据库：

mysql>show databases; 显示所有数据库

mysql>show tables; 显示数据库mysql中所有的表：先use mysql；然后

mysql>describe user; 显示表mysql数据库中user表的列信息）；

3、grant

创建一个可以从任何地方连接服务器的一个完全的超级用户，但是必须使用一个口令something做这个

mysql> grant all privileges on *.* to user@localhost identified by ’something’ with

增加新用户

格式：grant select on 数据库.* to 用户名@登录主机 identified by “密码”

GRANT ALL PRIVILEGES ON *.* TO monty@localhost IDENTIFIED BY ’something’ WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON *.* TO monty@”%” IDENTIFIED BY ’something’ WITH GRANT OPTION;

添加授权：

grant all on *.* to sglog@'%' identified by 'stVaD66a';    针对sglog用户 使其对所有数据库有权限。
grant all on *.* to sglog@localhost identified by 'stVaD66a';  针对sglog用户 使其对所有数据库有权限。


删除授权：

mysql> revoke all privileges on *.* from root@”%”;

mysql> delete from user where user=”root” and host=”%”;

mysql> flush privileges;

创建一个用户custom在特定客户端it363.com登录，可访问特定数据库fangchandb

mysql >grant select, insert, update, delete, create,drop on fangchandb.* to custom@ it363.com identified by ‘ passwd’

重命名表:

mysql > alter table t1 rename t2;

4、mysqldump

备份数据库

shell> mysqldump -h host -u root -p dbname >dbname_backup.sql

恢复数据库

shell> mysqladmin -h myhost -u root -p create dbname

shell> mysqldump -h host -u root -p dbname < dbname_backup.sql

如果只想卸出建表指令，则命令如下：

shell> mysqladmin -u root -p -d databasename > a.sql

如果只想卸出插入数据的sql命令，而不需要建表命令，则命令如下：

shell> mysqladmin -u root -p -t databasename > a.sql

那么如果我只想要数据，而不想要什么sql命令时，应该如何操作呢？

　　 mysqldump -T./ phptest driver

其中，只有指定了-T参数才可以卸出纯文本文件，表示卸出数据的目录，./表示当前目录，即与mysqldump同一目录。如果不指定driver 表，则将卸出整个数据库的数据。每个表会生成两个文件，一个为.sql文件，包含建表执行。另一个为.txt文件，只包含数据，且没有sql指令。

5、可将查询存储在一个文件中并告诉mysql从文件中读取查询而不是等待键盘输入。可利用外壳程序键入重定向实用程序来完成这项工作。例如，如果在文件my_file.sql 中存放有查

询，可如下执行这些查询：

例如，如果您想将建表语句提前写在sql.txt中:

mysql > mysql -h myhost -u root -p database < sql.txt


-------------------------------------------------------------------------------------------------------


    chkconfig --list [name]
    chkconfig --add name
    chkconfig --del name
    chkconfig [--level levels] name
    chkconfig [--level levels] name

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
编译安装imageMagic

./configure  --with-magick-home=/usr/local/ImageMagick --enable-share --enable-static --with-java-home=/usr/lib/jdk1.6.0_16


mkdir /usr/local/jpeg
mkdir /usr/local/jpeg/include
mkdir /usr/local/jpeg/lib
mkdir /usr/local/jpeg/bin
mkdir /usr/local/jpeg/man
mkdir /usr/local/jpeg/man/man1

./configure --prefix=/data1/imagic/jpeg --enable-shared --enable-static
./configure --prefix=/usr/local/jpeg --enable-shared --enable-static



./convert -geometry 600x200 /home/jcui/123.jpg /home/jcui/753.jpg

./configure  --with-magick-home=/usr/local/ImageMagick --enable-share --enable-static --with-java-home=/usr/lib/jdk1.5.0_06/

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++linux面试题++++++++++++++++++++++++++++++++++++++
1. Linux内核引导时，从文件 /etc/fstab 中读取要加载的文件系统。
2. 某文件的权限为：drw-r--r--，用数值形式表示该权限，则该八进制数为： 644 ，该文件属性是 目录
3. 前台起动的进程使用 Ctrl+c 终止.
4. 安装Linux系统对硬盘分区时，必须有两种分区类型： 文件系统分区 和 交换分区 。
5. 编写的Shell程序运行前必须赋予该脚本文件 执行 权限。
6. 唯一标识每一个用户的是用户 ID 和用户名。
7. RIP 协议是最为普遍的一种内部协议，一般称为动态路由选择协议。
8. DHCP可以实现动态 IP 地址分配。
9. Ping命令可以测试网络中本机系统是否能到达 一台远程主机 ，所以常常用于测试网络的 连通性.
10.vi编辑器具有两种工作模式： 命令模式 和 输入模式 。
11.可以用ls –al命令来观察文件的权限，每个文件的权限都用10位表示，并分为四段，其中第一段占 1 位，表示 文件类型 ，第二段占3位，表示 文件所有者 对该文件的权限。
12.在Linux系统中，用来存放系统所需要的配置文件和子目录的目录是 /etc .
13.结束后台进程的命令是 kill 。
14.将前一个命令的标准输出作为后一个命令的标准输入，称之为 管道.
15.为脚本程序指定执行权的命令及参数是 chmod a+x filename 。
16.进行远程登录的命令是 telnet 。
17.Apache服务器进程配置文件是 httpd.conf 。
18.创建一个没有登录权限用户的命令是：useradd -s /bin/false

1.Linux文件权限一共10位长度，分成四段，第三段表示的内容是 C 。
2.局域网的网络地址192.168.1.0/24，局域网络连接其它网络的网关地址是192.168.1.1。主机192.168.1.20访问172.16.1.0/24网络时，其路由设置正确的是 B .
3.在shell中变量的赋值有四种方法，其中，采用name=12的方法称 A 。
4.配置Apache 1.3.19服务器需要修改的配置文件为___A______
5.若一台计算机的内存为128MB，则交换分区的大小通常是 C 。
6.当我们与某远程网络连接不上时，就需要跟踪路由查看，以便了解在网络的什么位置出现了问题，满足该目的的命令是 C 。
7.用ls –al 命令列出下面的文件列表， D 文件是符号连接文件。
8.在重新启动Linux系统的同时把内存中的信息写入硬盘，应使用 D 命令实现。
9.在vi编辑器中的命令模式下，删除当前光标处的字符使用 A 命令。
10.对文件进行归档的命令为 D 。
11.crontab文件由六个域组成，每个域之间用空格分割，其排列如下： B 。
12.某文件的组外成员的权限为只读；所有者有全部权限；组内的权限为读与写，则该文件的权限为 D 。
13.下列对shell变量FRUIT操作，正确的是： C 。
14.在给定文件中查找与设定条件相符字符串的命令为： A .
15.从后台启动进程，应在命令的结尾加上符号 A 。

1.
2.#!/bin/sh
i=1
while [ $i -le 50 ]
do
userdel -r stud${i}
i=$(($i+1 ))
done

######################################################################
Ruby的安装

yum install -y gcc zlib zlib-devel

wget ftp://ftp.ruby-lang.org/pub/ruby/ruby-1.8.7-p334.tar.gz
tar xvf ruby-1.8.7-p334.tar.gz
cd ruby-1.8.7-p334
./configure --enable-pthread
make
make install

######################################################################
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
cat /var/log/messege
snmpd报错如下：

Oct 10 10:55:32 newcms kernel: audit(1255143332.811:282836): avc:  denied  { getattr } for  pid=27148 comm="snmpd" name="/" dev=sda2 ino=2 scontext=system_u:system_r:snmpd_t tcontext=system_u:object_r:file_t tclass=dir

到网上查了一下原来是SElinux 搞的鬼
vi /etc/selinux/config
SELINUX=disabled

由于是线上系统不能重启
setenforce 1 设置SELinux 成为enforcing模式
setenforce 0 设置SELinux 成为permissive模式

运行
setenforce 0
看了一下日志没有没有问题了。


######################################################################

每10行读取文件的脚本shell

#!/bin/sh
line=`cat /data1/sanguo_135.sql|wc -l`
i=1
while [ $i -le $line ]
do
a=$i
let b=$i+10
sed -n ''"$a"','"$b"'p' /data1/sanguo_135.sql
##在这里加入你分析的话
i=$(($i+10))
done

######################################################################

现在有这么个数据，格式如下：
日期  姓名  机型
2012-1-3	背叛裁决	Android
2012-1-3	背叛裁决	NokiaN73
2012-1-3	背叛裁决	NokiaS60V3
2012-1-3	能爱媚之恋	SEK790
2012-1-3	萃华股份金条王子	SEK790
2012-1-4	18708023705	Nokia5800
2012-1-4	18708023705	NokiaS60V3
2012-1-4	19964024	iPhone
2012-1-4	19964024	IPhone4
2012-1-4	19964024	Nokia5800
2012-1-4	19964024	NokiaN73


我如何操作 可以得到这么个结果

日期  姓名  机型1  机型2 机型 3 。。。
2012-1-3	背叛裁决	Android  NokiaN73  NokiaS60V3
2012-1-3	能爱媚之恋	SEK790
2012-1-3	萃华股份金条王子	SEK790
2012-1-4	18708023705	Nokia5800 NokiaS60V3
2012-1-4	19964024	iPhone IPhone4 Nokia5800 NokiaN73

就是 把相同的日期与姓名的

sort -k2,2 aaa.txt |awk '{v=$1" "$2;a[v]=a[v]$3" "}END{for (i in a)print i,a[i]}'|sort

awk '{$1="";$2="";$3="";print}' aaa.txt    //把第一例、第二例、第三例都排除在外打印其他的


先按照第二列排序，然后定义变量v，v的内容就是第一列空格第二列，然后把这个变量v写到数组a里去，数组a赋值第三列加个空格
然后for循环，只要找到第二列也就是v一样的，就把第三列加空格写到a里去
然后就是打印出来再按照第一列时间排下序方便你看了



如何把一行竖排的数据转换成横排？

awk '{printf("%s,",$1)}' filename

awk 查找hello关键字出现的次数
awk '{for(i=1;i<=NF;i++)if($i~/hello/){n++}}END{print n}' test.txt
文件内容如下: test.txt
hello world
hello hello world
hi Tim
Hi Tim, hello Tim
The world is hello
hello
hello

awk 把一行变成一列输出
awk  '{for(i=1;i<=NF;i++) a[i,NR]=$i}END{for(i=1;i<=NF;i++) {for(j=1;j<=NR;j++) printf a[i,j] " ";print ""}}'

#gsub,sub使用

awk 'BEGIN{info="this is a test2010test!";gsub(/[0-9]+/,"!",info);print info}'
this is a test!test!

info='this is a test2010test!'
awk 'BEGIN{info="'"$info"'";gsub(/[0-9]+/,"!",info);print info}'
this is a test!test!

#查找字符串（index使用）

awk 'BEGIN{info="this is a test2010test!";print index(info,"test")?"ok":"no found";}'
ok

#查找所在eth所在域,并打印

dmesg |grep eth|grep addr|awk '/eth/ {for(i=1;i<=NF;i++) if($i ~/eth/) print $i,$NF}'

#转换数字为用时时长

echo "a 3885 b" |awk '$2<60{$2=$2"秒";print $0;next}$2>=60&&$2<3600{$2=int($2/60)"分"$2%60"秒";print $0;next}$2>=3600&&$2<86400{$2=int($2/3600)"时"int($2%3600/60)"分"$2%60"秒";print $0;next}$2>86400{$2=int($2/86400)"天"int($2%86400/3600)"时"int($2%3600/60)"分"$2%60"秒";print $0}'
a 1时4分45秒 b

#########数组

#数组定义
a=(1 2 3 4 5)  echo $a   结果为1

#数组读取与赋值
echo ${#a[@]}  结果为5    #得到长度
echo ${a[*]}   结果为1 2 3 4 5  #得到值

1.数组定义

[chengmo@centos5 ~]$ a=(1 2 3 4 5)
[chengmo@centos5 ~]$ echo $a
1

一对括号表示是数组，数组元素用“空格”符号分割开。

2.数组读取与赋值
得到长度：
[chengmo@centos5 ~]$ echo ${#a[@]}
5
用${#数组名[@或*]} 可以得到数组长度
读取：
[chengmo@centos5 ~]$ echo ${a[2]}
3
[chengmo@centos5 ~]$ echo ${a[*]}
1 2 3 4 5

用${数组名[下标]} 下标是从0开始  下标是：*或者@ 得到整个数组内容
赋值:
[chengmo@centos5 ~]$ a[1]=100
[chengmo@centos5 ~]$ echo ${a[*]}
1 100 3 4 5

[chengmo@centos5 ~]$ a[5]=100
[chengmo@centos5 ~]$ echo ${a[*]}
1 100 3 4 5 100

直接通过 数组名[下标] 就可以对其进行引用赋值，如果下标不存在，自动添加新一个数组元素
删除:
[chengmo@centos5 ~]$ a=(1 2 3 4 5)
[chengmo@centos5 ~]$ unset a
[chengmo@centos5 ~]$ echo ${a[*]}
[chengmo@centos5 ~]$ a=(1 2 3 4 5)
[chengmo@centos5 ~]$ unset a[1]
[chengmo@centos5 ~]$ echo ${a[*]}
1 3 4 5
[chengmo@centos5 ~]$ echo ${#a[@]}
4
[chengmo@centos5 ~]$ a=(1 2 3 4 5)
[chengmo@centos5 ~]$ a[5]=6
[chengmo@centos5 ~]$ echo ${a[*]}
1 2 3 4 5 6

直接通过：unset 数组[下标] 可以清除相应的元素，不带下标，清除整个数据。


3.特殊使用
分片:
[chengmo@centos5 ~]$ a=(1 2 3 4 5)
[chengmo@centos5 ~]$ echo ${a[@]:0:3}
1 2 3
[chengmo@centos5 ~]$ echo ${a[@]:1:4}
2 3 4 5
[chengmo@centos5 ~]$ c=(${a[@]:1:4})
[chengmo@centos5 ~]$ echo ${#c[@]}
4
[chengmo@centos5 ~]$ echo ${c[*]}
2 3 4 5

直接通过 ${数组名[@或*]:起始位置:长度} 切片原先数组，返回是字符串，中间用“空格”分开，因此如果加上”()”，将得到切片数组，上面例子：c 就是一个新数据。
替换:
[chengmo@centos5 ~]$ a=(1 2 3 4 5)
[chengmo@centos5 ~]$ echo ${a[@]/3/100}
1 2 100 4 5
[chengmo@centos5 ~]$ echo ${a[@]}
1 2 3 4 5
[chengmo@centos5 ~]$ a=(${a[@]/3/100})
[chengmo@centos5 ~]$ echo ${a[@]}
1 2 100 4 5

调用方法是：${数组名[@或*]/查找字符/替换字符} 该操作不会改变原先数组内容，如果需要修改，可以看上面例子，重新定义数据。

##########################################################################
sort

  -b   忽略每行前面开始出的空格字符。
  -c   检查文件是否已经按照顺序排序。
  -d   排序时，处理英文字母、数字及空格字符外，忽略其他的字符。
  -f   排序时，将小写字母视为大写字母。
  -i   排序时，除了040至176之间的ASCII字符外，忽略其他的字符。
  -m   将几个排序好的文件进行合并。
  -M   将前面3个字母依照月份的缩写进行排序。
  -n   依照数值的大小排序。
  -o<输出文件>   将排序后的结果存入指定的文件。
  -r   以相反的顺序来排序。
  -t<分隔字符>   指定排序时所用的栏位分隔字符。
  +<起始栏位>-<结束栏位>   以指定的栏位来排序，范围由起始栏位到结束栏位的前一栏位。
  --help   显示帮助。
  --version   显示版本信息

##########################################################################
sed

文件内容  aa.log

AllowUser jcui hwang lighthu
name pip18_93
server 10.10.10.41
IPADDR=192.168.0.4

1.在匹配AllowUser行尾添加用户 yang.liu
sed -i '/AllowUser/ s/$/ yang.liu/' aa.log

2.在匹配jcui的关键字前加入用户 yang.liu
sed -i 's/jcui/yhzhao &/' aa.log

3.在匹配jcui的关键字后加入用户 yang.liu
sed -i 's/jcui/& quanzhou.li/' aa.log

4.删除空行
sed -i '/^$/d' aa.log

5.将文本中的去掉空字符(前面有空字符,后面有空字符),如下ipaa.txt
   123.com
     asd.asdom.com
   asd.comasdasda
sed -i -r 's/ +$//g' ipaa.txt  |  sed -i -r 's/^ +//g' ipaa.txt

##############################################################################
SSH2信任关系建立

1.本机创建密钥文件：
	ssh-keygen

2.创建本地私钥认证文件
	echo "Idkey id_2048_a" >identification

3.复制SSH密钥到目标主机，开启无密码SSH登录
ssh-copy-id user@host

2.上传本机用户公钥文件到远程服务器并重命名(以主机名)
	scp id_2048_a.pub remote:/home/xxx/.ssh2/host1.pub
3.远程服务器创建密钥文件
	ssh-keygen
4.远程服务器创建密钥公钥认证文件
	echo "Key host1.pub">authorization
5.远程登陆测试

6.其他：
	ssh-keygen -e -f id_rsa.pub > id_rsa_2.pub   将ssh的公钥转化成ssh2公钥
	用于ssh的客户端访问ssh2的服务端
##############################################################################
#linux使用netmask计算掩码及反向掩码
wget http://mirrors.sohu.com/ubuntu/pool/universe/n/netmask/netmask_2.3.12.tar.gz
      tar xf netmask_2.3.12.tar.gz
      cd netmask-2.3.12
      ./configure
      make
      make install

    2、安装完成以后，先来看一下帮助文档：
    # netmaks -h
      This is netmask, an address netmask generation utility
      Usage: netmask spec [spec ...]
        -h, --help                    Print a summary of the options
        -v, --version                 Print the version number
        -d, --debug                   Print status/progress information
        -s, --standard                Output address/netmask pairs
           转换到标准的 ip地址/子网掩码
         -c, --cidr                    Output CIDR format address lists
           转换到CIDR格式
         -i, --cisco                   Output Cisco style address lists
           转换到Cisco反向子网掩码
         -r, --range                   Output ip address ranges
           转换到IP地址范围
         -x, --hex                     Output address/netmask pairs in hex
           转换到16进制
         -o, --octal                   Output address/netmask pairs in octal
           转换到8进制
         -b, --binary                  Output address/netmask pairs in binary
           转换到2进制
         -n, --nodns                   Disable DNS lookups for addresses
      Definitions:
        a spec can be any of:
        netmask命令接受的ip地址格式 :
          address              单独IP
          address:address      开始IP:结束IP
          address:+address     开始IP:+IP个数
          address/mask         IP/掩码
##############################################################################

#数组

awk 'BEGIN { while (num < 10 ) printf "dir%03d\n", ++num ; exit}' | xargs mkdir

在当前目录下创建dir001 - dir010 目录

判断字符串为空的方法有三种：
if [ "$str" =  "" ]
if [ x"$str" = x ]
if [ -z "$str" ]
二、其他类型的数组
arr=(123 34 3 5) echo $arr，输出123，在这里等同于echo ${arr[0]};
echo ${arr[1]},输出34，注意格式，除了首地址，必须要加上{},否则会出错
三、数组的长度和遍历
length=${#array[@]}----数组的长度，这里的长度是最大下标
echo ${array[@]}-------输出数组全部元素
array[1]=5--------------向数组的某个元素赋值和标c的语法一样
echo ${array[@]:1:2}---输出的是array[0]和array[1]的值
echo ${array[@]:2}-----输出数组第三个元素以后的值
echo ${array[@]::2}-----输出数组下标小于2的值
$ echo ${#array[3]} ----取得元素3的长度
unset array--------------清除array
array= ------------------清空array，赋给array空值


###############################################################################
一、修改snmp日志级别方法
vi /etc/sysconfig/snmpd.options
取消一下行的#注释并做以下修改：
重启snmp服务 日志消失
snmp的日志等级分为7个等级
0 或 ! —— LOG_EMERG
1 或 a —— LOG_ALERT
2 或 c —— LOG_CRIT
3 或 e —— LOG_ERR
4 或 w —— LOG_WARNING
5 或 n —— LOG_NOTICE
6 或 i —— LOG_INFO
7 或 d —— LOG_DEBUG


snmp 获取服务器信息的方法，在linux服务器上直接执行

snmpbulkwalk/snmpbulkget/snmpbulkgetnext

    命令     版本     IP              团体名称         信息代码
snmpbulkwalk -v 2c 211.151.99.93 -c MIS@pipSEC .1.3.6.1.2.1.25.4.2.1.8

关闭snmpd日志输出到message的方法

vim /etc/init.d/snmpd
找到OPTIONS="-Lsd -Lf /dev/null -p /var/run/snmpd.pid -a" 修改为如下内容:
OPTIONS="-LS 0-4 d -Lf /dev/null -p /var/run/snmpd.pid -a"
然后重启snmpd服务
###############################################################################
解答：.描述linux系统从开机到登陆界面的启动过程（记时2分钟）

简述：
1.开机BIOS自检
2.MBR引导
3.grub引导菜单
4.加载内核kernel
5.启动init进程
6.读取inittab文件，执行rc.sysinit,rc等脚本
7.启动mingetty，进入系统登陆界面


解答： 描述linux运行级别0-6的各自含义（记时1分钟）
中文：
0：关机
1：单用户模式
2：无网络支持的多用户模式
3：有网络支持的多用户模式
4：保留，未使用
5：有网络支持有X-Window支持的多用户模式
6：重新引导系统，即重启

#################################################################################
iftop  网络流量监控工具
wget http://www.ex-parrot.com/~pdw/iftop/download/iftop-0.17.tar.gz
tar xzvfp iftop-0.17.tar.gz
cd iftop-0.17
./configure
make
make install

#################################################################################
我想找出b文件中 不包含a文件的记录 怎么做？
比如：
b.txt
1
2
3
a
a.txt
a
b
c
那我想得到c文件
1
2
3

执行方法：comm -23 b.txt a.txt
###################################################################################
1
3
4
7
12
如何用awk计算下一行减去上一行
awk '{a[NR]=$1}END{for (i=1;i<=NR;i++){print a[i]-a[i-1]}}'
awk '{b=a;a=$1; if(NR>1){print a-b}}'
###################################################################################
awk 'ORS=NR%5'
sed '5~5'
sed '1～2d' 删除基数行
seq 10| sed -e{1,5}'s/./a/'

######################################################################################################################################################################
######################################################################################################################################################################
#############################################################################雪松#####################################################################################
######################################################################################################################################################################
######################################################################################################################################################################
	shell技巧实例手册

不定期更新，更新下载地址：
http://hi.baidu.com/quanzhou722/item/f4a4f3c9eb37f02d46d5c0d9

==================================
1文件管理   2软件管理   3系统管理
4服务管理   5网络管理   6磁盘管理
7用户管理   8脚本相关   9服务配置
==================================

----------------------------------
		1文件管理
----------------------------------

创建空白文件
touch

不提示删除非空目录
rm -rf 目录名
(-r:递归删除 -f强制)

##################################

	恢复rm删除的文件(ext3)

查看磁盘分区格式
df -T

卸载挂载
umount /data/

ext3grep /dev/sdb1 --ls --inode 2
记录信息继续查找目录下文件inode信息
ext3grep /dev/sdb1 --ls --inode 131081  #  此处是inode
记录下inode信息开始恢复目录
ext3grep /dev/sdb1 --restore-inode 49153

##################################

windows文本转linux文本
dos2unix

linux文本转windows文本
unix2dos

查看编码
yum install -y enca
enca filename

转换编码
iconv -f gbk -t utf8 原.txt > 新.txt

查看md5值
md5sum

硬链接
ln

符号连接
ln -s

查看连接真实目录
readlink -f /data

查看上下翻页且显示行号
cat file | nl |less
q退出

结束状态
ctrl+z

查看文件开头内容
head

查看文件结尾内容
tail -f   #  监视日志文件

检查文件类型
file

重命名
rename source_pattern target_pattern source_files

更改默认权限
umask

删除重复的行
uniq

重复的行出现次数
uniq -c

只显示不重复行
uniq -u

将两个文件合并用tab键分隔开
paste a b

将两个文件合并指定'+'符号隔开
paste -d'+' a b

将多行数据合并到一行用tab键隔开
paste -s a

设置隐藏属性
chattr [+-=] [ASacdistu] 文件或目录

给口令文件设置不可改变位
chattr +i /etc/passwd

向下分面器
more

搜索
locate 字符串

查看行数
wc -l

实时某个目录下查看最新改动过的文件
watch -d -n 1 'df; ls -FlAt /path'

快速备份一个文件
cp filename{,.bak}

将行中的字符逆序排列
rev

行和行比较匹配
comm -12 2 3

从一个或多个文件中连接行
paste -s  #整个文件合并成一行
paste file1 file2  #合并两个文件行

##################################

	sort

-t   指定排序时所用的栏位分隔字符
-n   依照数值的大小排序
-r   以相反的顺序来排序
-f   排序时，将小写字母视为大写字母
-d   排序时，处理英文字母、数字及空格字符外，忽略其他的字符
-c   检查文件是否已经按照顺序排序
-b   忽略每行前面开始处的空格字符
-M   前面3个字母依照月份的缩写进行排序
-k   指定域
-m   将几个排序好的文件进行合并
+<起始栏位>-<结束栏位>   以指定的栏位来排序，范围由起始栏位到结束栏位的前一栏位。
-o   将排序后的结果存入指定的文
n表示进行排序，r表示逆序

按数字排序
sort -n

按数字倒叙
sort -nr

过滤重复行
sort -u

将两个文件内容整合到一起
sort -m a.txt c.txt

第二域相同，将从第三域进行升降处理
sort -n -t' ' -k 2 -k 3 a.txt

以:为分割域的第三域进行倒叙排列
sort -n -t':' -k 3r a.txt

从第三个字母起进行排序
sort -k 1.3 a.txt

以第二域进行排序，如果遇到重复的，就删除
sort -t" " -k 2n -u  a.txt

##################################

配置编辑器
gconf-editor

vi 配置文件
vi /etc/vimrc

打开文件定位到24行
vi +24 /etc/passwd

打开行号
:set nu

取消行号
:set nonu

跳转到200
200G

取消高亮
:nohl

设置自动缩进
:set autoindent

查看文本格式
set ff

改为unix格式
set binary

向前翻页
ctrl+ U

向后翻页
ctrl+ D

全部替换
g/字符1/s//字符2/g
%s/字符1/字符2/g

文档加密
X

打开多个文件
vim file1 file2
:n   #编辑下一个文件
:2n  #编辑下二个文件
:N   #编辑前一个文件
:rew #回到首文件

可视模式(行)
v
v = #自动格式化代码

可视模式
Ctrl+v
Ctrl+v I # ESC   #批量注释
Ctrl+v s ESC     #批量取消注释

垂直分屏
vim -O2 file1 file2

水平分屏
vim -on file1 file2

上下分割打开新文件
sp filename

左右分割打开新文件
vsp filename

上下分割当前打开的文件
Ctrl+W s

左右分割当前打开的文件
Ctrl+W v

关闭当前窗口
Ctrl+W c

把光标移到右边的屏
Ctrl+W l

把光标移到左边的屏中
Ctrl+W h

把光标移到上边的屏中
Ctrl+W k

把光标移到下边的屏中
Ctrl+W j

把光标移到下一个的屏中
Ctrl+W w

向右移动
Ctrl+W L

向下移动
Ctrl+W J

向左移动
Ctrl+W H

向上移动
Ctrl+W K

让所有的屏都有一样的高度
Ctrl+W =

增加高度
Ctrl+W +

减少高度
Ctrl+W -

#  普通用户打开文档不能保存
#  tee是一个把stdin保存到文件的小工具,而%,是vim当中一个只读寄存器的名字,总保存着当前编辑文件的文件路径
:w !sudo tee %

##################################

按文件名查找
find /etc -name http

查找某一类型文件
find . -type f

按照文件权限查找
find / -perm

按照文件属主查找
find / -user

按照文件所属的组来查找文件
find / -group

文件使用时间在N天以内
find / -atime -n

文件使用时间在N天以前
find / -atime +n

文件内容改变时间在N天以内
find / -mtime -n

文件内容改变时间在N天以前
find / -mtime +n

文件状态改变时间在N天前
find / -ctime +n

文件状态改变时间在N天内
find / -ctime -n

#  linux文件无创建时间
#  Access 使用时间
#  Modify 内容修改时间
#  Change 状态改变时间(权限、属主)
#  时间默认以24小时为单位,当前时间到向前24小时为0天,向前48-72小时为2天
#  -and 且 匹配两个条件 参数可以确定时间范围 -mtime +2 -and -mtime -4
#  -or 或 匹配任意一个条件

查找文件长度大于1M字节的文件
find / -size +1000000c -print

按名字查找文件传递给-exec后命令
find /etc -name "passwd*" -exec grep "xuesong" {} \;

查找文件名,不取路径
find . -name 't*' -exec basename {} \;

批量改名(查找err 替换为 ERR {}文件)
find . -type f -name "err*" -exec  rename err ERR {} \;

查找任意一个关键字
find 路径 -name *name1* -or -name *name2*

##################################

====================================================================


----------------------------------
		2软件管理
----------------------------------

解包tar
tar xvf 1.tar -C 目录

打包tar
tar -cvf 1.tar *

查看tar
tar tvf 1.tar

给tar追加文件
tar -rvf 1.tar 文件名

解包gz
tar zxvpf gz.tar.gz -C 放到指定目录 包中的目录

打包gz
tar zcvpf gz.tar.gz *

查看gz
tar ztvpf gz.tar.gz

解压bzip2
bzip2  -dv 1.tar.bz2

解压gzip到tar
gzip -dv 1.tar.gz

压缩tar到gz
gzip -v 1.tar

bzip2压缩
bzip2 -v 1.tar

查看bzip2
bzcat

rpm安装
rpm -ivh

卸载
rpm -e lynx

强制卸载
rpm -e lynx --nodeps

测试
rpm --test lynx

查看所有安装的rpm包
rpm -qa

查找包是否安装
rpm -qa | grep http

软件包路径
rpm -ql

软件包配置文档
rpm -qc

升级包
rpm -Uvh

解压zip
unzip zip.zip

压缩zip
zip zip.zip *

rar3.6下载地址
http://www.rarsoft.com/rar/rarlinux-3.6.0.tar.gz

压缩文件为rar包
rar a rar.rar *.jpg

解压rar包
unrar x rar.rar

7z压缩
7z a 7z.7z *

7z解压
7z e 7z.7z

查看压缩包中文件字符行
zgrep 字符 1.gz

打包/home, /etc ，但排除 /home/dmtsai
tar --exclude /home/dmtsai -zcvf myfile.tar.gz /home/* /etc

在 /home 当中，比 2005/06/01 新的文件才备份
tar -N "2005/06/01" -zcvf home.tar.gz /home

打包目录中包括连接目录
tar -zcvfh home.tar.gz /home

下载
wgetrc
wget -P 路径 http地址

文本上网
lynx

制作镜像
cp -v  /dev/dvd  /software/rhel4.6.iso9660

清除编译结果
make clean

源码安装
./configure --help |less
./configure  --prefix=/usr/local/
make
make install

perl程序编译
perl Makefile.PL
make
make test
make install

python程序编译
python file.py

编译c程序
gcc -g hello.c -o hello

====================================================================

----------------------------------
		3系统管理
----------------------------------


终端锁屏 Ctrl+S

解锁屏 Ctrl+Q

给其它用户发消息
wall

PS1环境变量控制提示显示
PS1='[\u@ \H \w \A \@#]\$'
PS1='[\u@\h \W]\$'

开机启动模式(3为多用户命令)
vi /etc/inittab
禁止 ctrl + alt + del 关闭计算机
#ca::ctrlaltdel:/sbin/shutdown -t3 -r now

查找命令的目录
whereis

查看当前要执行的命令所在的路径
which

命令后台运行
命令 &

将前台放入后台(暂停)
ctrl+z

查看后台运行程序
jobs

启动后台暂停进程
bg 2

调回后台进程
fg 2

后台运行不受shell退出影响
nohup cmd &

清空整个屏幕
clear

重新初始化屏幕
reset

历时命令默认1000条
history

让history命令显示具体时间
HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

清除记录命令
history  -c
cat /root/.bash_history

查看登陆过的用户信息
last
last -n user
who /var/log/wtmp

列出登录系统失败的用户相关信息
lastb -a
/var/log/btmp

防火墙日志
tail -f /var/log/messages

ssh日志
tail -f /var/log/secure

随机生成密码
mkpasswd
-l位数 -C大小 -c小写 -d数字 -s特殊字符
mkpasswd -l 8  -C 2 -c 2 -d 4 -s 0

当前在线用户
who
w

查看当前用户名
whoami

查看登陆用户名
logname

显示月历
cal

查看服务器启动时间
uptime

设日期
date -s 20091112

设时间
date -s 18:30:50

同步时间
/usr/sbin/ntpdate stdtime.gov.hk
#保存到硬件
/sbin/hwclock -w

7天前日期
`date -d "7 days ago" +%Y%m%d`

5分钟前时间
date -d "5 minute ago" +%H:%M

一个月前
date -d "1 month ago" +%Y%m%d

日期格式转换
date +%Y-%m-%d -d '20110902'

日期和时间
date +%Y-%m-%d_%X

换算成秒计算(1970年至今的秒数)
date -d "2012-08-13 14:00:23" +%s

将时间戳换算成日期
date -d "@1363867952" +%Y-%m-%d-%T
date -d "1970-01-01 UTC 1363867952 seconds" +%Y-%m-%d-%T

格式化系统启动时间(多少秒前)
date -d "`awk -F. '{print $1}' /proc/uptime` second ago" +"%Y-%m-%d %H:%M:%S"

查看时间
hwclock

账户影子文件
/etc/shadow

列出所有语系
locale -a

修改语言
LANG=en

修改编码
vi /etc/sysconfig/i18n
utf-8 <---> GBK

强制字符集
export LC_ALL=C

查询静态主机名
vi /etc/hosts

修改最大打开文件数(等同最大连接数)
ulimit -65536

进程打开最大文件数
#如果/etc/security/limits.d/有配置文件，将会覆盖/etc/security/limits.conf里的配置
#即/etc/security/limits.d/的配置文件里就不要有同样的参量设置
/etc/security/limits.conf
#最大打开文件数
#nofile可以被理解为是文件句柄数 文件描述符 还有socket数
* soft nofile 65535
* hard nofile 65535
#最大进程数
* soft nproc 65536
* hard nproc 65536

/etc/security/limits.d/90-nproc.conf
#centos6.3的最大进程数
* soft nproc 65536
* hard nproc 65536

查看
ulimit -a

grub开机启动项添加
/etc/grub.conf
title ms-dos
rootnoverify (hd0,0)
chainloader +1

别名
alias

监测命令
watch

查看Linux版本信息
uname -a
cat /proc/version
cat /etc/issue
lsb_release -a

查看cpu信息
more /proc/cpuinfo

查看cpu型号和逻辑核心数
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c

cpu运行的位数
getconf LONG_BIT

物理cpu个数
cat /proc/cpuinfo | grep physical | uniq -c

结果大于0支持64位
cat /proc/cpuinfo | grep flags | grep ' lm ' | wc -l

查看cpu是否支持虚拟化
cat /proc/cpuinfo|grep flags
pae支持半虚拟化  Intel VT 支持全虚拟化

查看内存信息
more /proc/meminfo

查看全面硬件信息
dmidecode

查看服务器型号
dmidecode | grep "Product Name"

查看内存插槽
dmidecode | grep -P -A5 "Memory\s+Device" | grep Size | grep -v Range

查看软raid信息
cat /proc/mdstat

查看Dell硬raid信息(IBM、HP需要官方检测工具)
cat /proc/scsi/scsi

查看硬件信息
lspci

查看是否支持raid
lspci|grep RAID

查看网卡型号
lspci -vvv |grep Ethernet

查看驱动模块
lspci -vvv |grep Kernel|grep driver

查看驱动版本(驱动模块)
modinfo tg2

查看网卡网速流量
sar -n DEV 1 10

查看网卡驱动版本
ethtool -i em1

显示开机信息
dmesg

进程树
pstree

每隔一秒报告系统性能信息9次
vmstat 1 9

把180号进程的优先级加1
renice +1 180

终止某个PID进程
kill -9 PID

指定三天后下午5:00执行/bin/ls
at 5pm + 3 days /bin/ls

编辑周期任务
crontab -e
分钟  小时    天  月  星期   命令或脚本
1,30  1-3/2   *   *   *      命令或脚本

直接将命令写入周期任务
echo "40 7 * * 2 /root/sh">>/var/spool/cron/root

查看自动周期性任务
crontab -l

删除自动周期性任务
crontab -r

禁止或允许用户使用周期任务
cron.deny和cron.allow

启动自动周期性服务
service crond start|stop|restart

是否打开了某个端口
netstat -anlp | grep 端口号

sudo命令权限添加
visudo
用户  别名(可用all)=NOPASSWD:命令1，命令2
wangming linuxfan=NOPASSWD:/sbin/apache start,/sbin/apache restart
UserName ALL=(ALL) ALL

制作补丁
diff suzu.c suzu2.c  > sz.patch

安装补丁
patch suzu.c < sz.patch

显示打开指定文件的所有进程
lsof 文件

查看端口的进程
lsof -i:32768

显示消耗内存最多的10个运行中的进程，以内存使用量排序.cpu +3
ps aux |grep -v USER | sort -nk +4 | tail

查看内核模块
lsmod

动态链接库管理命令
ldconfig

yum扩展源
http://download.fedoraproject.org/pub/epel
wget http://download.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm
rpm -Uvh epel-release-5-4.noarch.rpm

升级所有包版本,依赖关系，系统版本内核都升级
yum -y update

升级指定的软件包
yum -y update 软件包名

不改变软件设置更新软件，系统版本升级，内核不改变
yum -y upgrade

yum搜索相关包
yum search mail

会改变配置文件,改变旧的依赖关系，改变系统版本
dist-upgrade

编辑启动项
/boot/grub/grub.conf

开机启动脚本顺序
/etc/profile
/etc/profile.d/*.sb
~/bash_profile
~/.bashrc
/etc/bashrc

使TCP SYN Cookie 保护生效  # "SYN Attack"是一种拒绝服务的攻击方式
echo 1 > /proc/sys/net/ipv4/tcp_syncookies

查看selinux状态
sestatus -v

查看selinux模式
getenforce

设置selinux为宽容模式(可避免阻止一些操作)
setenforce 0

关闭selinux
vi /etc/selinux/config
SELINUX=enfoceing
把其修改为：
SELINUX=disabled

在selinux中注册端口类型
semanage port -a -t http_port_t -p tcp 8000

查看selinux端口限制规则
semanage port -l

修改内核参数/etc/sysctl.conf，让/etc/rc.d/rc.sysinit读取生效
sysctl –p

查看剩余内存
free -m
#-/+ buffers/cache:       6458       1649
#6458M为真实使用内存  1649M为真实剩余内存(剩余内存+缓存+缓冲器)
#linux会利用所有的剩余内存作为缓存，所以要保证linux运行速度，就需要保证内存的缓存大小

查看Linux系统当前单个共享内存段的最大值
ipcs -a

查看cpu等状态
sar

查看加载库文件
lsof |grep /lib

--------------------------------------------------------------------

	top

前五行是系统整体的统计信息。
第一行是任务队列信息，同 uptime 命令的执行结果。其内容如下：
01:06:48 当前时间
up 1:22 系统运行时间，格式为时:分
1 user 当前登录用户数
load average: 0.06, 0.60, 0.48 系统负载，即任务队列的平均长度。
三个数值分别为 1分钟、5分钟、15分钟前到现在的平均值。

第二、三行为进程和CPU的信息。当有多个CPU时，这些内容可能会超过两行。内容如下：
Tasks: 29 total 进程总数
1 running 正在运行的进程数
28 sleeping 睡眠的进程数
0 stopped 停止的进程数
0 zombie 僵尸进程数
Cpu(s): 0.3% us 用户空间占用CPU百分比
1.0% sy 内核空间占用CPU百分比
0.0% ni 用户进程空间内改变过优先级的进程占用CPU百分比
98.7% id 空闲CPU百分比
0.0% wa 等待输入输出的CPU时间百分比
0.0% hi
0.0% si

最后两行为内存信息。内容如下：

Mem: 191272k total 物理内存总量
173656k used 使用的物理内存总量
17616k free 空闲内存总量
22052k buffers 用作内核缓存的内存量
Swap: 192772k total 交换区总量
0k used 使用的交换区总量
192772k free 空闲交换区总量
123988k cached 缓冲的交换区总量。
内存中的内容被换出到交换区，而后又被换入到内存，但使用过的交换区尚未被覆盖，
该数值即为这些内容已存在于内存中的交换区的大小。
相应的内存再次被换出时可不必再对交换区写入。

进程信息区
统计信息区域的下方显示了各个进程的详细信息。首先来认识一下各列的含义。

序号 列名 含义
a PID 进程id
b PPID 父进程id
c RUSER Real user name
d UID 进程所有者的用户id
e USER 进程所有者的用户名
f GROUP 进程所有者的组名
g TTY 启动进程的终端名。不是从终端启动的进程则显示为 ?
h PR 优先级
i NI nice值。负值表示高优先级，正值表示低优先级
j P 最后使用的CPU，仅在多CPU环境下有意义
k %CPU 上次更新到现在的CPU时间占用百分比
l TIME 进程使用的CPU时间总计，单位秒
m TIME+ 进程使用的CPU时间总计，单位1/100秒
n %MEM 进程使用的物理内存百分比
o VIRT 进程使用的虚拟内存总量，单位kb。VIRT=SWAP+RES
p SWAP 进程使用的虚拟内存中，被换出的大小，单位kb。
q RES 进程使用的、未被换出的物理内存大小，单位kb。RES=CODE+DATA
r CODE 可执行代码占用的物理内存大小，单位kb
s DATA 可执行代码以外的部分(数据段+栈)占用的物理内存大小，单位kb
t SHR 共享内存大小，单位kb
u nFLT 页面错误次数
v nDRT 最后一次写入到现在，被修改过的页面数。
w S 进程状态。
D=不可中断的睡眠状态
R=运行
S=睡眠
T=跟踪/停止
Z=僵尸进程
x COMMAND 命令名/命令行
y WCHAN 若该进程在睡眠，则显示睡眠中的系统函数名
z Flags 任务标志，参考 sched.h
##################################

	iptables

内建三个表：nat mangle 和 filter
filter预设规则表，有INPUT、FORWARD 和 OUTPUT 三个规则链

INPUT 进入
FORWARD 转发
OUTPUT 出去
ACCEPT 将封包放行
REJECT 拦阻该封包
DROP 丢弃封包不予处理

-A	在所选择的链(INPUT等)末添加一条或更多规则
-D  删除一条
-E  修改
-p	tcp、udp、icmp	0相当于所有all	!取反
-P  设置缺省策略(与所有链都不匹配强制使用此策略)
-s	IP/掩码	(IP/24)	主机名、网络名和清楚的IP地址 !取反
-j	目标跳转，立即决定包的命运的专用内建目标
-i	进入的（网络）接口 [名称] eth0
-o	输出接口[名称]
-m	模块
--sport  源端口
--dport  目标端口

##################################

	常用实例

#配置文件
vi /etc/sysconfig/iptables
#将防火墙中的规则条目清除掉
iptables -F
#注意:iptables -P INPUT ACCEPT
#导入防火墙规则
iptables-restore <规则文件
#保存防火墙设置
/etc/init.d/iptables save
#重启防火墙服务
/etc/init.d/iptables restart
#查看规则
iptables -L -n
iptables -L -n --line-numbers
#从某个规则链中删除一条规则
iptables -D INPUT --dport 80 -j DROP
iptables -D INPUT 8
#取代现行规则
iptables -R INPUT 8 -s 192.168.0.1 -j DROP
#插入一条规则
iptables -I INPUT 8 --dport 80 -j ACCEPT
#查看转发
iptables -t nat -nL
#在内核里打开ip转发功能
echo 1 > /proc/sys/net/ipv4/ip_forward
#添加网段转发(原IP网段经过哪个网卡IP出去)
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.0.0.0/255.0.0.0 -o eth0 -j SNAT --to 192.168.10.158
#端口映射(内网需要添加默认网关，并且网关开启转发)
#route add -net 10.10.20.0 netmask 255.255.255.0 gw 10.10.20.111
iptables -t nat -A PREROUTING -d 192.168.10.158  -p tcp --dport 9999 -j DNAT --to 10.10.20.55:22

#允许在IP访问指定端口
iptables -A INPUT -s 192.168.62.1 -p tcp --dport 22 -j ACCEPT
#禁止使用某端口
iptables -A INPUT -p tcp --dport 22 -j DROP
iptables -A INPUT -p tcp --dport 31 -j REJECT
#禁止QQ端口
iptables -D FORWARD -p udp --dport 8000 -j REJECT
#禁止icmp端口
#除192.168.62.1外，禁止其它人ping我的主机
iptables -A INPUT -i eth0 -s 192.168.62.1/32 -p icmp -m icmp --icmp-type 8 -j ACCEPT
iptables -A INPUT -i eth0 -p icmp -m icmp --icmp-type 8 -j DROP
#其它情况不允许
iptables -A INPUT -i eth0 -j DROP
#禁止指定IP访问
iptables -A INPUT -p tcp -s IP -j DROP
#禁止指定IP访问端口
iptables -A INPUT -p tcp -s IP --dport port -j DROP
#阻止所有没有经过你系统授权的TCP连接
iptables -t filter -A INPUT -i eth0 -p tcp --syn -j DROP
#IP包流量限制
iptables -A INPUT -f -m limit --limit 100/s --limit-burst 100 -j ACCEPT
iptables -A INPUT -i eth0 -p icmp -j DROP
#列出某规则链中的所有规则
iptables -L INPUT
#删除某个规则链 ,不加规则链，清除所有非内建的
iptables -X allowed
#将封包计数器归零
iptables -Z INPUT
#定义新的规则链
iptables -N allowed
#定义过滤政策
iptables -P INPUT DROP
#修改某自订规则链的名称
iptables -E allowed disallowed
#比对通讯协议类型是否相符
#-p ! tcp 排除tcp以外的udp、icmp。-p all所有类型
iptables -A INPUT -p tcp
#比对封包的来源 IP
#192.168.0.0/24  ! 反向对比
iptables -A INPUT -s 192.168.1.1
#比对封包的目的地 IP
iptables -A INPUT -d 192.168.1.1
#比对封包是从哪片网卡进入
#eth+表示所有的网卡
iptables -A INPUT -i eth0
#比对封包要从哪片网卡送出
iptables -A FORWARD -o eth0
#比对某段时间内封包的平均流量
#例子是用来比对：每小时平均流量是否超过一次 3 个封包。 除了每小时平均次外，也可以每秒钟、每分钟或每天平均一次，默认值为每小时平均一次，参数如后： /second、 /minute、/day。 除了进行封数量的比对外，设定这个参数也会在条件达成时，暂停封包的比对动作，以避免因骇客使用洪水攻击法，导致服务被阻断。
iptables -A INPUT -m limit --limit 3/hour
#比对瞬间大量封包的数量
#例子是用来比对一次同时涌入的封包是否超过 5 个(这是默认值)，超过此上限的封包将被直接丢弃。使用效果同上。
iptables -A INPUT -m limit --limit-burst 5
#比对来自本机的封包
#是否为某特定使用者所产生的，这样可以避免服务器使用root或其它身分将敏感数据传送出，可以降低系统被骇的损失。可惜这个功能无法比对出来自其它主机的封包。
iptables -A OUTPUT -m owner --uid-owner 500
#比对来自本机的封包
iptables -A OUTPUT -m owner --gid-owner 0
iptables -A OUTPUT -m owner --pid-owner 78
iptables -A OUTPUT -m owner --sid-owner 100
#用来比对联机状态
iptables -A INPUT -m state --state RELATED,ESTABLISHED
联机状态共有四种：INVALID、ESTABLISHED、NEW 和 RELATED。
#-j参数指定进行的处理动作，处理动作包括：ACCEPT、REJECT、DROP、REDIRECT、MASQUERADE、LOG、DNAT、SNAT、MIRROR、QUEUE、RETURN、MARK,说明：
iptables -A FORWARD -p TCP --dport 22 -j REJECT --reject-with tcp-reset
#可以传送的封包有几个选择：ICMP port-unreachable、ICMP echo-reply 或是tcp-reset
REDIRECT 将封包重新导向到另一个端口(PNAT)
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 8080
MASQUERADE 改写封包来源 IP 为防火墙 NIC IP
iptables -t nat -A POSTROUTING -p TCP -j MASQUERADE --to-ports 1024-31000
LOG 将封包相关讯息纪录在 /var/log 中
iptables -A INPUT -p tcp -j LOG --log-prefix "INPUT packets"
SNAT 改写封包来源 IP 为某特定 IP 或 IP 范围
iptables -t nat -A POSTROUTING -p tcp-o eth0 -j SNAT --to-source 194.236.50.155-194.236.50.160:1024-32000
DNAT 改写封包目的地 IP 为某特定 IP 或 IP 范围
iptables -t nat -A PREROUTING -p tcp -d 15.45.23.67 --dport 80 -j DNAT --to-destination 192.168.1.1-192.168.1.10:80-100
MIRROR 镜射封包
QUEUE 中断过滤程序
RETURN 结束在目前规则炼中的过滤程序
MARK 将封包标上某个代号
可防御cc攻击(未测试)
iptables -A INPUT -p tcp -m tcp --dport 80 -m state --state NEW -m recent --update --seconds 5 --hitcount 20 --rttl --name WEB --rsource -j DROP
##################################
	iptables配置实例
#允许某段IP访问任何端口
iptables -A INPUT -s 192.168.0.3/24 -p tcp -j ACCEPT
#设定预设规则 (拒绝所有的数据包，再允许需要的,如只做WEB服务器.还是推荐三个链都是DROP)
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
#(注:意直接设置这三条完已经掉线了)
#开启22端口
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
#如果OUTPUT 设置成DROP的，要写上下面一条
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
#(注:,不写导致无法SSH.其他的端口一样,OUTPUT设置成DROP的话,也要添加一条链)
#如果开启了web服务器,OUTPUT设置成DROP的话,同样也要添加一条链
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT
#做WEB服务器,开启80端口 ,其他同理
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
#做邮件服务器,开启25,110端口
iptables -A INPUT -p tcp --dport 110 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
#允许icmp包通过,允许ping
iptables -A OUTPUT -p icmp -j ACCEPT (OUTPUT设置成DROP的话)
iptables -A INPUT -p icmp -j ACCEPT  (INPUT设置成DROP的话)
#允许loopback!(不然会导致DNS无法正常关闭等问题)
IPTABLES -A INPUT -i lo -p all -j ACCEPT (如果是INPUT DROP)
IPTABLES -A OUTPUT -o lo -p all -j ACCEPT(如果是OUTPUT DROP)

##################################

	iptables配置实例文件

# Generated by iptables-save v1.2.11 on Fri Feb  9 12:10:37 2007
*filter
:INPUT ACCEPT [637:58967]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [5091:1301533]
#允许的IP或IP段访问
-A INPUT -s 127.0.0.1 -p tcp -j ACCEPT
-A INPUT -s 192.168.0.0/255.255.0.0 -p tcp -j ACCEPT
#开放对外开放端口
-A INPUT -p tcp --dport 80 -j ACCEPT
#指定某端口针对IP开放
-A INPUT -s 192.168.10.37 -p tcp --dport 22 -j ACCEPT
#拒绝所有协议(INPUT允许)
-A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,URG RST -j DROP
# 允许已建立的或相关连的通行
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#拒绝ping
-A INPUT -p tcp -m tcp -j REJECT --reject-with icmp-port-unreachable
COMMIT
# Completed on Fri Feb  9 12:10:37 2007

====================================================================



----------------------------------
		4服务管理
----------------------------------
启动sendmail服务
./sendmail start
/etc/init.d/sendmail start

关闭sendmail服务
./sendmail stop

查看sendmail服务当前状态
./sendmail status

发送邮件
echo 内容| /bin/mail -s "标题" 收件箱
"`echo "内容"|iconv -f utf8 -t gbk`" | /bin/mail -s "`echo "标题"|iconv -f utf8 -t gbk`" 收件箱

打开服务列表 需要打*
ntsysv

让某个服务不自动启动 35指的是运行级别
chkconfig --level 35   httpd   off

让某个服务自动启动
chkconfig --level 35   httpd   on

查看所有服务的启动状态
chkconfig --list

查看某个服务的启动状态
chkconfig --list |grep httpd

查看服务的状态
chkconfig –-list [服务名称]

设置非独立服务启状态
chkconfig 服务名 on|off|set

开启mysql后台运行
/usr/local/mysql/bin/mysqld_safe --user=mysql &

开机启动执行
vi /etc/rc.d/rc.local

开机启动和关机关闭服务连接
/etc/rc.d/rc3.d/S55sshd
#  S开机start  K关机stop  55级别 后跟服务名
ln -s -f /usr/local/httpd/bin/apachectl /etc/rc.d/rc3.d/S15httpd

====================================================================

----------------------------------
		5网络管理
----------------------------------

##################################
本机网络配置文件
vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE=eth0
BOOTPROTO=none
BROADCAST=192.168.1.255
HWADDR=00:0C:29:3F:E1:EA
IPADDR=192.168.1.55
NETMASK=255.255.255.0
NETWORK=192.168.1.0
ONBOOT=yes
TYPE=Ethernet
GATEWAY=192.168.1.1
##################################
增加逻辑IP地址
ifconfig eth0:0 192.168.1.221 netmask 255.255.255.0

查看路由表
route
netstat –r

添加默认路由
route add default  gw 192.168.1.1  dev eth0

添加静态路由网关
route add -net 172.16.0.0 netmask 255.255.0.0 gw 10.39.111.254

删除静态路由网关
route del -net 172.16.0.0 netmask 255.255.0.0 gw 10.39.111.254

##################################
切分线路(有程序判断进入IP线路，设置服务器路由规则控制返回)
vi /etc/iproute2/rt_tables
#添加一条策略
252   bgp2  #注意策略的序号顺序
ip route add default via 第二个出口上线IP(非默认网关) dev eth1 table bgp2
ip route add from 本机第二个ip table bgp2
#查看
ip route list table 252
ip rule list
#成功后将语句添加开机启动

策略静态路由
route add -net 10.10.0.0 netmask 255.255.0.0 dev eth1

##################################

设置DNS
vi /etc/resolv.conf

禁用网卡
ifconfig eth0 down

启用网卡
ifconfig eth0 up
ifup eth0:0 up

测试跳数
traceroute www.baidu.com  (linux)
tracert www.baidu.com (windows)

根据IP和主机最大数计算掩码
ipcalc -m "$ip" -p "$num"

用 wget 的递归方式下载整个网站
wget --random-wait -r -p -e robots=off -U Mozilla www.example.com

通过 DNS 来读取 Wikipedia 的hacker词条
dig +short txt hacker.wp.dg.cx
host -t txt hacker.wp.dg.cx

rz   ssh小文件上传
sz   ssh小文件下载

从linux ssh登录另一台linux
ssh -p 22 wang@192.168.1.209

利用ssh操作远程主机
ssh -p 22 root@192.168.1.209 环境变量中脚本

把本地文件拷贝到远程主机
scp -P 22 文件 root@ip:/目录

ssh连接不提示yes
ssh -o StrictHostKeyChecking=no 192.168.70.130

把远程指定文件拷贝到本地
scp root@192.168.1.209:远程目录 本地目录

同步目录
rsync -avzP /backup name@192.168.10.1:/backup

切换用户登录远程发送邮件
su - user -c "ssh user@192.168.1.1 \"echo -e aa |mail -s test mail@163.com\""

通过 SSH 挂载远程主机上的文件夹
sshfs name@server:/path/to/folder /path/to/mount/point

卸载的话使用 fusermount 命令
fusermount -u /path/to/mount/point

用DIFF对比远程文件跟本地文件
ssh user@host cat /path/to/remotefile | diff /path/to/localfile -

用SSH创建端口转发通道
ssh -N -L2001:remotehost:80 user@somemachine

嵌套使用SSH
ssh -t host_A ssh host_B

密钥信任
ssh-keygen –t rsa
vi 用户/.ssh/authorized_keys

远程关掉一台WINDOWS机器
net rpc shutdown -I IP_ADDRESS -U username%password

禁ping
echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all

抓包
tcpdump tcp port 22

查看监听
netstat -anlp
-a     显示所有连接中的Socket
-t     显示TCP连接
-u     显示UDP连接
-n     显示所有已建立的有效连接

SNMP监视远程主机的磁盘空间
snmpdf -v 1 -c public localhost

SNMP获取192.168.6.53的所有开放端口状态
snmpnetstat -v 2c -c public -a 192.168.6.53

解析域名IP
nslookup www.moon.com

##################################

ftp上传
ftp -i -v -n $HOST << END
user $USERNAME $PASSWORD
bin
cd /ftp
mkdir data
cd data
mput *.tar.gz
bye
END

##################################

先ping在扫描主机开放端口
nmap -PT 192.168.1.1-111

扫描出系统内核版本
nmap -O 192.168.1.1

扫描端口的软件版本
nmap -sV 192.168.1.1-111

半开扫描(通常不会记录日志)
nmap -sS 192.168.1.1-111

不支持windows的扫描(判断是否是windows)
nmap -sF 192.168.1.1-111
nmap -sX 192.168.1.1-111
nmap -sN 192.168.1.1-111

不ping直接扫描
nmap -P0 192.168.1.1-111

详细信息
nmap -d 192.168.1.1-111

无法找出真正扫描主机(隐藏IP)
nmap -D 192.168.1.1-111

端口范围
nmap -p 20-30,139,60000-
表示：扫描20到30号端口，139号端口以及所有大于60000的端口

组合扫描(不ping、软件版本、内核版本、详细信息)
nmap -P0 -sV -O -v 192.168.30.251

##################################

====================================================================

----------------------------------
		6磁盘管理
----------------------------------

查看硬盘容量
df -Ph

查看磁盘分区格式
df -T

查看inode节点
#如果inode用满后无法创建文件
df -i

修改只读文件系统为读写
mount -o remount,rw /

查看卷标
e2label /dev/sda5

创建卷标
e2label /dev/sda5 new-label

NTFS添加卷标
ntfslabel -v /dev/sda8 new-label

ext2分区转ext3分区
tune2fs -j /dev/sda

格式化分区
mkfs -t ext3  /dev/hda3

指定索引块大小
mke2fs -b 2048 /dev/sda5

对文件系统修复
fsck -y /dev/sda6

查看超级块的信息
dumpe2fs -h /dev/sda5

查看当前系统支持文件系统
cat /proc/filesystems

检测硬盘状态
smartctl -H /dev/sda

检测硬盘信息
smartctl -i /dev/sda

检测所有信息
smartctl -a /dev/sda

检测目录下所有文件大小
du -h 目录

显示当前目录中子目录的大小
du -h --max-depth=1
du -sh *

检查磁盘扇区是否存在坏块
badblocks -v /dev/sdb1

挂载光驱
mount -t iso9660 /dev/dvd  /mnt

挂载镜像文件
mount -o loop  /software/rhel4.6.iso   /mnt/

关闭swap
swapoff -a

开启swap
swapon -a

##################################

	创建swap文件方法
1) 创建一个足够大的文件
    dd if=/dev/zero of=/swap bs=1024 count=4096000
    (count的值等于1024 x 你想要的文件大小, 4096000是4G)

2) 把这个文件变成swap文件.
    mkswap /swap

3) 启用这个swap文件
    swapon /swap

4) 在每次开机的时候自动加载swap文件, 需要在 /etc/fstab 文件中增加一行
    /swap swap swap defaults 0 0

5) 查看swap
    cat /proc/swaps

##################################

磁盘grub开机引导项添加
/etc/grub.conf
title ms-dos
rootnoverify (hd0,0)
chainloader +1

##################################

建立软RAID1
两块硬盘分区一样，分别新建分区文件类型为software RAID
创建两个就点击raid合并为RAID1，这里的挂载点为正常linux目录
查看raid工作状态
cat /proc/mdstat
两个盘都加grub引导
查看
cat /boot/grub/grub.conf
grub
root (hd0,0)
setup (hd0)
root (hd1,0)
setup (hd1)
修改grub启动项配置文件
vi /boot/grub/grub.conf
复制title CentOS到最后的四行
在下面粘贴修改为刚才新加的引导(hd1,0)
查看分区
sfdisk -d /dev/hda
导出A盘分区列表
sfdisk -d /dev/hda > fq.hda
将分区列表导入到新加的硬盘
sfdisk /dev/hdb < fq.hda
恢复新挂载的硬盘分区
mdadm /dev/md1 -a /dev/hdb5
# raid5可利用lvm扩容

##################################

挂载大容量磁盘步骤
1.
parted /dev/sdb
2.
(parted) mklabel GPT    输入yes
3.(parted) mkpart
4.分区名称？  []? sdb1
5.文件系统类型？  [ext2]?  ext4
6.起始点？ 0
7.结束点？ -1
8.(parted) p
9.quit
10.mkfs.ext4 -L /data3 /dev/sdb1


	新硬盘挂载
fdisk /dev/sdc
p	#  打印分区
d 	#  删除分区
n	#  创建分区，（一块硬盘最多4个主分区，扩展占一个主分区位置。p主分区 e扩展）
w	#  保存退出
mkfs -t ext3 -L 卷标  /dev/sdc1		#  格式化相应分区
mount /dev/sdc1  /mnt		#  挂载

添加开机挂载分区
vi /etc/fstab
用卷标挂载
LABEL=/data            /data                   ext3    defaults        1 2
用真实分区挂载
/dev/sdb1              /data4                  ext3    defaults        1 2

/dev/sdb2              /data4                  ext3    noatime,defaults        1 2

第一个数字"1"该选项被"dump"命令使用来检查一个文件系统应该以多快频率进行转储，若不需要转储就设置该字段为0
第二个数字"2"该字段被fsck命令用来决定在启动时需要被扫描的文件系统的顺序，根文件系统"/"对应该字段的值应该为1，其他文件系统应该为2。若该文件系统无需在启动时扫描则设置该字段为0
当以noatime选项加载（mount）文件系统时，对文件的读取不会更新文件属性中的atime信息。设置noatime的重要性是消除了文件系统对文件的写操作，文件只是简单地被系统读取。由于写操作相对读来说要更消耗系统资源，所以这样设置可以明显提高服务器的性能。注意wtime信息仍然有效，任何时候文件被写，该信息仍被更新。

##################################

	释放进程占用磁盘空间
lsof |grep delete
#列出进程后，查看文件是否存在，不存在则kill掉此进程

##################################

raid0 raid1 raid5 原理与区别
raid0至少2块硬盘。吞吐量大 性能好 同时读写，但损坏一个就完蛋
raid1至少2块硬盘。相当于 一个镜像，一个存储。安全性比较高。但是性能比0弱
raid5至少3块硬盘。一个做校验，2个做存储，坏了一个能恢复。

##################################

====================================================================

----------------------------------
		7用户管理
----------------------------------

建立用户
useradd xuesong

修改密码
passwd 用户
echo "xuesong" | passwd xuesong --stdin

恢复密码
在linux出现grub后，在安装的系统上面按"e"，然后出现grub的配置文件，按键盘移动光标到第二行"Ker……"，再按"e"，然后在这一行的结尾加上：空格 single或者空格1回车，然后按"b"重启，就进入了"单用户模式"。

查找用户显示信息
finger

添加组
groupadd

修改文件拥有者(R递归)
chown -R

修改所有者用户中包含点"."
chown y\.li:mysql

设置用户文件和目录的文件创建缺省屏蔽值
umask

特殊权限
s或 S （SUID）：对应数值4
s或 S （SGID）：对应数值2
t或 T ：对应数值1
大S：代表拥有root权限，但是没有执行权限
小s：拥有特权且拥有执行权限，这个文件可以访问系统任何root用户可以访问的资源
T或T（Sticky）：/tmp和 /var/tmp目录供所有用户暂时存取文件，亦即每位用户皆拥有完整的权限进入该目录，去浏览、删除和移动文件。

修改用户组
chgrp

修改用户名
usermod -l 新用户名 老用户名

修改用户所属组
usermod -g user group

修改用户家目录
usermod -d 目录 -m 用户

将用户添加到附加组
usermod -G group user

从组中删除用户
gpasswd -d user group

删除帐号及家目录
userdel -r

指定组并不允许登录的用户(false更为严格,nologin允许使用服务)
useradd -g www -M  -s /bin/false  www
useradd -g www -M  -s /sbin/nologin  www

切换用户执行
su - user -c "
#命令1
"

====================================================================

----------------------------------
		8脚本相关
----------------------------------

##################################

	正则表达式

^ 	行首定位
$ 	行为定位
. 	匹配除换行符以外的任意字符
*	匹配0或多个重复字符
+ 	重复一次或更多次
? 	重复零次或一次
#perl中最小匹配  .*? 表示最小匹配
[]	匹配一组中任意一个字符
[^]	匹配不在指定组内的字符
\	用来转义元字符
\<	词首定位符(支持vi和grep)
\<love
\>	  词尾定位符(支持vi和grep)
love\>
x\{m\}     重复出现m次
x\{m,\}    重复出现至少m次
x\{m,n\}   重复出现至少m次不超过n次
X? 	匹配出现零次或一次的大写字母 X
X+ 	匹配一个或多个字母 X
()   括号内的字符为一组
(abc|def)+ 	匹配一连串的（最少一个） abc 或 def；abc 和 def 将匹配

元字符
\d 	匹配任意一位数字
\D 	匹配任意单个非数字字符
\w 	匹配任意单个字母数字下划线字符，同义词是 [:alnum:]
\W  匹配非数字型的字符

字符类:空白字符
\s 	匹配任意的空白符
\S  匹配非空白字符
\b 	匹配单词的开始或结束
\n  匹配换行符
\r  匹配回车符
\t  匹配制表符
\b  匹配退格符
\0  匹配空值字符

字符类:锚定字符
\b  匹配字边界(不在[]中时)
\B  匹配非字边界
\A  匹配字符串开头
\Z  匹配字符串或行的末尾
\z  只匹配字符串末尾
\G  匹配前一次m//g离开之处

[[:alpha:]]  代表所有字母不论大小写
[[:lower:]]  表示小写字母
[[:upper:]]  表示大写字母
[[:digit:]]  表示数字字符
[[:digit:][:lower:]]  表示数字字符加小写字母

捕获
(exp)              匹配exp,并捕获文本到自动命名的组里
(?<name>exp)       匹配exp,并捕获文本到名称为name的组里，也可以写成(?'name'exp)
(?:exp)            匹配exp,不捕获匹配的文本，也不给此分组分配组号
零宽断言
(?=exp)            匹配exp前面的位置
(?<=exp)           匹配exp后面的位置
(?!exp)            匹配后面跟的不是exp的位置
(?<!exp)           匹配前面不是exp的位置
注释
(?#comment)	     不对正则表达式的处理产生任何影响，用于注释


##################################

	基本流程结构

if [ $a == $b ]
then
echo "等于"
else
echo "不等于"
fi
##################################
case $xs in
0) echo "0" ;;
1) echo "1" ;;
*) echo "其他" ;;
esac
##################################
num=1
# while true  等同   while :
while [ $num -lt 10 ]
do
echo $num
((num=$num+2))
done
##################################
grep a  a.txt | while read a
do
    echo $a
done
##################################
w=`awk -F ":" '{print $1}' c`
for d in $w
do
	$d
done
##################################
for ((i=0;i<${#o[*]};i++))
do
echo ${o[$i]}
done
##################################
until循环#  当command不为0时
until command
do
	body
done
##################################
流程控制
break N     #  跳出几层循环
continue N  #  跳出几层循环，循环次数不变
continue    #  重新循环次数不变
##################################

	变量

将 变量A 赋值为字串
A="a b c def"
A=`命令`
间接调用
eval a=\$$a
将 变量A 定义为組数
A=(a b c def)
set a1 a2 a3 a4
$1  $2  $*
在子shell中运行
(a=bbk)

	定义变量类型

declare或者typeset
-r 只读(readonly一样)
-i 整形
-a 数组
-f 函数
-x export
declare -i n=0

env                   #  查看环境变量
env | grep "name"     #  查看定义的环境变量
set                   #  查看环境变量和本地变量
read name             #  输入变量
readonly name         #  把name这个变量设置为只读变量,不允许再次设置
readonly              #  查看系统存在的只读文件
export name           #  变量name由本地升为环境
export name="RedHat"  #  直接定义name为环境变量
export Stat$nu=2222   #  变量引用变量赋值
unset name            #  变量清除
export -n name        #  去掉只读变量
shift                 #  用于移动位置变量,调整位置变量,使$3的值赋给$2.$2的值赋予$1
name + 0              #  将字符串转换为数字
number " "            #  将数字转换成字符串

	常用系统变量

$0   #  脚本启动名(包括路径)
$n   #  第n个参数,n=1,2,…9
$*   #  所有参数列表(不包括脚本本身)
$@   #  所有参数列表(独立字符串)
$#   #  参数个数(不包括脚本本身)
$$   #  当前程式的PID
$!   #  执行上一个指令的PID
$?   #  执行上一个指令的返回值
basename $0 #  从文件名中去掉路径和扩展名
dirname     #  取路径


	变量引用技巧 ${}

${name:+value}        #  如果设置了name,就把value显示,未设置则为空
${name:-value}        #  如果设置了name,就显示它,未设置就显示value
${name:?value}        #  未设置提示用户错误信息value 
${name:=value}        #  如未设置就把value设置并显示<写入本地中>
${#A}                 #  可得到变量中字节
${#A[*]}              #  数组个数
${A[*]}               #  数组所有元素
${A[@]}               #  数组所有元素(标准)
${A[2]}               #  脚本的一个参数或数组第三位
${A:4:9}              #  取变量中第4位到后面9位
${A/www/http}         #  取变量并且替换每行第一个关键字
${A//www/http}        #  取变量并且全部替换每行关键字

定义了一个变量为：
file=/dir1/dir2/dir3/my.file.txt
${file#*/}     #  去掉第一条 / 及其左边的字串：dir1/dir2/dir3/my.file.txt
${file##*/}    #  去掉最后一条 / 及其左边的字串：my.file.txt
${file#*.}     #  去掉第一个 .  及其左边的字串：file.txt
${file##*.}    #  去掉最后一个 .  及其左边的字串：txt
${file%/*}     #  去掉最后条 / 及其右边的字串：/dir1/dir2/dir3
${file%%/*}    #  去掉第一条 / 及其右边的字串：(空值)
${file%.*}     #  去掉最后一个 .  及其右边的字串：/dir1/dir2/dir3/my.file
${file%%.*}    #  去掉第一个 .  及其右边的字串：/dir1/dir2/dir3/my
#   # 是去掉左边(在键盘上 # 在 $ 之左边)
#   % 是去掉右边(在键盘上 % 在 $ 之右边)
#   单一符号是最小匹配﹔两个符号是最大匹配

##################################

	test条件判断

#  符号 [ ] 等同  test

expression为字符串操作

-n str   #  字符串str是否不为空
-z str   #  字符串str是否为空

expression为文件操作

-a     #  并且，两条件为真
-b     #  是否块文件
-p     #  文件是否为一个命名管道
-c     #  是否字符文件
-r     #  文件是否可读
-d     #  是否一个目录
-s     #  文件的长度是否不为零
-e     #  文件是否存在
-S     #  是否为套接字文件
-f     #  是否普通文件
-x     #  文件是否可执行，则为真
-g     #  是否设置了文件的 SGID 位
-u     #  是否设置了文件的 SUID 位
-G     #  文件是否存在且归该组所有
-w     #  文件是否可写，则为真
-k     #  文件是否设置了的粘贴位
-t fd  #  fd 是否是个和终端相连的打开的文件描述符（fd 默认为 1）
-o     #  或，一个条件为真
-O     #  文件是否存在且归该用户所有
!      #  取反

expression为整数操作

expr1 -a expr2   #  如果 expr1 和 expr2 评估为真，则为真
expr1 -o expr2   #  如果 expr1 或 expr2 评估为真，则为真

两值比较

整数	 字符串
-lt      <         #  小于
-gt      >         #  大于
-le      <=        #  小于或等于
-ge      >=        #  大于或等于
-eq      ==        #  等于
-ne      !=        #  不等于

判断大小,0为真,1为假
test 10 -lt 5
echo $?
1
判断字符串长度是否为0
test -n "hello"
0

##################################

	重定向

#  标准输出 stdout 和 标准错误 stderr  标准输入stdin
cmd 1> fiel              #  把 标准输出 重定向到 file 文件中
cmd > file 2>&1          #  把 标准输出 和 标准错误 一起重定向到 file 文件中
cmd 2> file              #  把 标准错误 重定向到 file 文件中
cmd 2>> file             #  把 标准错误 重定向到 file 文件中(追加)
cmd >> file 2>&1         #  把 标准输出 和 标准错误 一起重定向到 file 文件中(追加)
cmd < file >file2        #  cmd 命令以 file 文件作为 stdin(标准输入)，以 file2 文件作为 标准输出
cat <>file               #  以读写的方式打开 file
cmd < file cmd           #  命令以 file 文件作为 stdin
cmd << delimiter
cmd; #从 stdin 中读入，直至遇到 delimiter 分界符
delimiter

>&n    #  使用系统调用 dup (2) 复制文件描述符 n 并把结果用作标准输出
<&n    #  标准输入复制自文件描述符 n
<&-    #  关闭标准输入（键盘）
>&-    #  关闭标准输出
n<&-   #  表示将 n 号输入关闭
n>&-   #  表示将 n 号输出关闭

##################################

	运算符

$[]等同于$(())  #  $[]表示形式告诉shell求中括号中的表达式的值
~var            #  按位取反运算符,把var中所有的二进制为1的变为0,为0的变为1
var\<<str       #  左移运算符,把var中的二进制位向左移动str位,忽略最左端移出的各位,最右端的各位上补上0值,每做一次按位左移就有var乘2
var>>str        #  右移运算符,把var中所有的二进制位向右移动str位,忽略最右移出的各位,最左的各位上补0,每次做一次右移就有实现var除以2
var&str         #  与比较运算符,var和str对应位,对于每个二进制来说,如果二都为1,结果为1.否则为0
var^str         #  异或运算符,比较var和str对应位,对于二进制来说如果二者互补,结果为1,否则为0
var|str         #  或运算符,比较var和str的对应位,对于每个二进制来说,如二都该位有一个1或都是1,结果为1,否则为0

	运算符的优先级
级别      运算符                                  说明
1      =,+=,-=,/=,%=,*=,&=,^=,|=,<<=,>>==     #  赋值运算符
2         ||                                  #  逻辑或 前面不成功执行
3         &&                                  #  逻辑与 前面成功后执行
4         |                                   #  按位或
5         ^                                   #  按异位与
6         &                                   #  按位与
7         ==,!=                               #  等于/不等于
8         <=,>=,<,>                           #  大于或等于/小于或等于/大于/小于
9        \<<,>>                               #  按位左移/按位右移 (无转意符号)
10        +,-                                 #  加减
11        *,/,%                               #  乘,除,取余
12        ! ,~                                #  逻辑非,按位取反或补码
13        -,+                                 #  正负

##################################

	数学运算

$(( )) 整数运算符号大致有这些：
+ - * / **：分別为 "加、減、乘、除、密运算"
& | ^ !：分別为 "AND、OR、XOR、NOT" 运算
% ：余数运算

运算
let
let x=16/4
let x=5**5

手工命令行计数器
expr
SUM=`expr 2 \* 3`

计算字串长度
expr length "bkeep zbb"

抓取字串
expr substr "bkeep zbb" 4 9

抓取第一个字符数字串出现的位置
expr index "bkeep zbb" e

整数运算
expr 14 % 9
expr 30 / 3 / 2   #  运算符号有空格

增量计数(加循环即可)
LOOP=0
LOOP=`expr $LOOP + 1`

数值测试(如果试图计算非整数，则会返回错误)
rr=3.4
expr $rr + 1
expr: non-numeric argument
rr=5
expr $rr + 1
6

模式匹配(可以使用expr通过指定冒号选项计算字符串中字符数)
.* 意即任何字符重复0次或多次
expr bkeep.doc : '.*'

在expr中可以使用字符串匹配操作，这里使用模式抽取.doc文件附属名
expr bkeep.doc : '\(.*\).doc'

次方计算
echo "m^n"|bc

从1加到1000
seq 1 1000 |tr "\n" "+"|sed 's/+$/\n/'|bc
seq -s '+' 1000 |bc

##################################

	grep用法

-c 显示匹配到得行的数目，不显示内容
-h 不显示文件名
-i 忽略大小写
-l 只列出匹配行所在文件的文件名
-n 在每一行中加上相对行号
-s 无声操作只显示报错，检查退出状态
-v 反向查找
-e 使用正则表达式
-A3 打印匹配行和下三行
-w  精确匹配
-wc 精确匹配次数
-o  查询所有匹配字段
-P  使用perl正则表达式
grep可用于if判断，找到$?为then

过滤关键字符行
grep -v "a" txt

精确匹配字符串
grep -w 'a\>' txt

大小写敏感
grep -i "a" txt

同时匹配大小写
grep  "a[bB]" txt

查找0-9重复三次的所在行
grep '[0-9]\{3\}' txt

任意条件匹配
grep -E "word1|word2|word3"   file

同时匹配三个
grep word1 file | grep word2 |grep word3

零宽断言匹配
echo "I'm singing while you're dancing" |grep -Po '\b\w+(?=ing\b)'
sing
danc

零宽断言截取字符串
echo quan@163.com |grep -Po '(?<=@.).*(?=.$)'
63.co

取出false前面的字母
echo '["check_mem",ok],["check_hardware",false],["check_filesystem",false]' |grep -Po '[^"]+(?=",false)'
echo '["check_mem",ok],["check_hardware",false],["check_filesystem",false]' |grep -Po '\w+",false'|grep -Po '^\w+'

取出d前面数字 # ?为最小匹配
echo 'Rx Optical Power: -5.01dBm, Tx Optical Power: -2.41dBm' |grep -Po '(?<=:).*?(?=d)'
echo 'Rx Optical Power: -5.01dBm, Tx Optical Power: -2.41dBm' | grep -Po '[-0-9.]+'

##################################

	tr用法

-c 用字符串1中字符集的补集替换此字符集，要求字符集为ASCII
-d 删除字符串1中所有输入字符
-s 删除所有重复出现字符序列，只保留第一个:即将重复出现字符串压缩为一个字符串

[a-z] a-z内的字符组成的字符串
[A-Z] A-Z内的字符组成的字符串
[0-9] 数字串
\octal 一个三位的八进制数，对应有效的ASCII字符
[O*n] 表示字符O重复出现指定次数n。因此[O*2]匹配OO的字符串
tr中特定控制字符的不同表达方式
速记符含义八进制方式
\a Ctrl-G  铃声\007
\b Ctrl-H  退格符\010
\f Ctrl-L  走行换页\014
\n Ctrl-J  新行\012
\r Ctrl-M  回车\015
\t Ctrl-I  tab键\011
\v Ctrl-X  \030

将所有大写转换成小写字母
tr A-Z a-z

将空格替换为换行
tr " " "\n"

删除空行
tr -s "[\012]" < plan.txt
tr -s ["\n"] < plan.txt

删除文件中的^M，并代之以换行
tr -s "[\015]" "[\n]" < file
tr -s "[\r]" "[\n]" < file

替换passwd文件中所有冒号，代之以tab键
tr -s "[:]" "[\011]" < /etc/passwd
tr -s "[:]" "[\t]" < /etc/passwd

增加显示路径可读性
echo $PATH | tr ":" "\n"

tr在vi内使用，在tr前加处理行范围和感叹号('$'表示最后一行)
1,$!tr -d '\t'

Mac -> UNIX
tr "\r" "\n"<macfile > unixfile

UNIX -> Mac
tr "\n" "\r"<unixfile > macfile

DOS -> UNIX
Microsoft DOS/Windows 约定，文本的每行以回车字符(\r)并后跟换行符(\n)结束
tr -d "\r"<dosfile > unixfile

UNIX -> DOS：在这种情况下，需要用awk，因为tr不能插入两个字符来替换一个字符
awk '{ print $0"\r" }'<unixfile > dosfile

##################################

	seq用法

-s 选项主要改变输出的分格符, 预设是 \n
-w 等位补全，就是宽度相等，不足的前面补 0
-f 格式化输出，就是指定打印的格式
不指定起始数值，则默认为 1

列出10-100
seq 10 100

倒叙列出
seq 1 10 |tac

创建dir1-10
seq -f 'dir%g' 1 10 | xargs mkdir

创建dir001-010
seq -f 'dir%03g' 1 10 | xargs mkdir

从90加到100
seq -s '+' 90 100 |bc



##################################

	awk用法

默认是执行print $0
1为真 打印$0
0为假 不打印

\b   退格
\f   换页
\n   换行
\r   回车
\t   制表符Tab
\c   代表任一其他字符
-F   改变FS值(分隔符)

~    域匹配
==   变量匹配
!~   匹配不包含
=    赋值
!=   不等于
+=   叠加

[:alnum:]    字母数字字符
[:alpha:]    字母字符
[:cntrl:]    控制字符
[:digit:]    数字字符
[:graph:]    非空白字符(非空格、控制字符等)
[:lower:]    小写字母
[:print:]    与[:graph:]相似，但是包含空格字符
[:punct:]    标点字符
[:space:]    所有的空白字符(换行符、空格、制表符)
[:upper:]    大写字母
[:xdigit:]   十六进制的数字(0-9a-fA-F)


内建变量
$n            当前记录的第 n 个字段，字段间由 FS 分隔
$0            完整的输入记录
ARGC          命令行参数的数目
ARGIND        命令行中当前文件的位置 ( 从 0 开始算 )
ARGV          包含命令行参数的数组
CONVFMT       数字转换格式 ( 默认值为 %.6g)
ENVIRON       环境变量关联数组
ERRNO         最后一个系统错误的描述
FIELDWIDTHS   字段宽度列表 ( 用空格键分隔 )
FILENAME      当前文件名
FNR           同 NR ，但相对于当前文件
FS            字段分隔符 ( 默认是任何空格 )
IGNORECASE    如果为真（即非 0 值），则进行忽略大小写的匹配
NF            当前记录中的字段数(列)
NR            当前行数
OFMT          数字的输出格式 ( 默认值是 %.6g)
OFS           输出字段分隔符 ( 默认值是一个空格 )
ORS           输出记录分隔符 ( 默认值是一个换行符 )
RLENGTH       由 match 函数所匹配的字符串的长度
RS            记录分隔符 ( 默认是一个换行符 )
RSTART        由 match 函数所匹配的字符串的第一个位置
SUBSEP        数组下标分隔符 ( 默认值是 /034)
BEGIN         先处理(可不加文件参数)
END           结束时处理

内置函数
gsub(r,s) 在整个$0中用s替代r
gsub(r,s,t) 在整个t中用s替代r
index(s,t) 返回s中字符串t的第一位置
length(s) 返回s长度
match(s,r) 测试s是否包含匹配r的字符串
split(s,a,fs) 在fs上将s分成序列a
sprint(fmt,exp) 返回经fmt格式化后的exp
sub(r,s) 用$0中最左边最长的子串代替s
substr(s,p) 返回字符串s中从p开始的后缀部分
substr(s,p,n) 返回字符串s中从p开始长度为n的后缀部分

[[:digit:][:lower:]]    数字和小写字母(占一个字符)
-F"[ ]+|[%]+"  已多个空格或多个%为分隔符
[a-z]+         多个小写字母
[a-Z]          代表所有大小写字母(aAbB...zZ)
[a-z]          代表所有大小写字母(ab...z)

打印匹配到得行
awk '/Tom/' 文件

匹配两内容之一
echo aada:aba|awk '/d/||/b/{print}'
echo aada:abaa|awk -F: '$1~/d/||$2~/b/{print}'

同时匹配两内容
echo aada:aaba|awk '/d/&&/b/{print}'
echo +null:null  |awk -F: '$1!~"^+"&&$2!="null"{print $0}'

第一个域匹配正则
echo Maaa asdas|awk '$1~/^[a-Z][a-Z][a-Z][a-Z]$/{print }'

如果第三个字段值小于4000才打印
awk '$3 <4000' 文件

匹配Tom开头的行 打印第一个字段
awk '/^Tom/{print $1}'

显示所有第一个字段不是以ly结尾的行
awk '$1 !~ /ly$/' 文件

条件判断(如果$1大于$2,max值为为$1,否则为$2)
awk '{max=($1 > $2) ? $1 : $2; print max}' 文件
awk '{print ($1>$2)?"第一排"$1:"第二排"$2}' e.txt
(括号代表if语句判断 "?"代表then ":"代表else)

算术运算(第三个字段和第四个字段乘积大于500则显示)
awk '$3 * $4 > 500' 文件

打印tom到suz之间的行
awk '/tom/,/suz/' 文件

去掉前三列
awk '{$1="";$2="";$3="";print}' a.sh

将date值赋给d，并将d设置为数组mon，打印mon数组中第2个元素
awk 'BEGIN{ "date" | getline d; split(d,mon) ; print mon[2]}' 文件

以空格、:、制表符Tab为分隔符
awk -F'[ :\t]' '{print $1,$2}'

取关键字下第几行
awk '/关键字/{a=NR+2}a==NR {print}'

awk中引用变量
a=22aa &&echo 88:99:44|awk -F":" '{print $1,"'"$a"'",$2,$3}'

列叠加
awk '{b[$1]=b[$1]$2}END{for(i in b){print i,b[i]}}'

当前行减上一行
awk '{a[NR]=$1}END{for (i=1;i<=NR;i++){print a[i]-a[i-1]}}'
awk '{b=a;a=$1; if(NR>1){print a-b}}'

指定类型(%d数字,%s字符)
/sbin/ifconfig |awk  '{printf("line %d,%s\n",NR,$0)}'
awk -v RS=# 'NF{for(i=1;i<=NF;i++)if($i) printf $i;print ""}' 文件

取本机IP
ifconfig|awk -v RS="Bcast:" '{print $NF}'|awk -F: '/addr/{print $2}'
/sbin/ifconfig |awk -v RS='inet addr:' '$1!="eth0"&&$1!="127.0.0.1"{print $1}'|awk '{printf"%s|",$0}'

awk加if判断
awk '{if ( $6 > 50) print $1 " Too high" ;\
else print "Range is OK"}' file
awk '{if ( $6 > 50) { count++;print $3 } \
else { x+5; print $2 } }' file

awk加循环
awk '{i = 1; while ( i <= NF ) { print NF, $i ; i++ } }' file
awk '{ for ( i = 1; i <= NF; i++ ) print NF,$i }' file

提取时间，空格不固定
ll | awk -F'[ ]+|[ ][ ]+' '/^$/{print $8}'

查看磁盘空间
df -|awk -F"[ ]+|%" '$5>14{print $5}'
df -h |awk 'NR!=1{if ( NF == 6 ) {print $5} else if ( NF == 5) {print $4} }'
df -h|awk 'NR!=1 && /%/{sub(/%/,"");print $(NF-1)}'
#将磁盘分区整理成一行
df -P
df -h|sed '1d;/ /!N;s/\n//;s/ \+/ /;'

取出第四列等于90的第五列
awk '$4==90{print $5}'

打印所有以模式no或so开头的行
awk '/^(no|so)/' test

排列打印
awk 'END{printf "%-10s%-10s\n%-10s%-10s\n%-10s%-10s\n","server","name","123","12345","234","1234"}' txt
awk 'BEGIN{printf "|%-10s|%-10s|\n|%-10s|%-10s|\n|%-10s|%-10s|\n","server","name","123","12345","234","1234"}'
awk 'BEGIN{
print "   *** 开 始 ***   ";
print "+-----------------+";
printf "|%-5s|%-5s|%-5s|\n","id","name","ip";
}
$1!=1 && NF==4{printf "|%-5s|%-5s|%-5s|\n",$1,$2,$3" "$11}
END{
print "+-----------------+";
print "   *** 结 束 ***   "
}' txt

awk中计算(求余数)
echo list|awk '{ i=($1%100);if ( $i >= 0 ) {print $0,$i}}'

sub匹配第一次出现的符合模式的字符串，相当于 sed 's///'
awk '{sub(/Mac/,"Macintosh",$0);print}' urfile
#用Macintosh替换Mac

gsub匹配所有的符合模式的字符串，相当于 sed 's///g'
awk '{gsub(/Mac/,"MacIntosh",$1); print}' file
#第一个域内用Macintosh替换Mac

匹配字符串(index使用)
awk 'BEGIN{info="this is a test2010test!";print index(info,"test")?"ok":"no found";}'

正则表达式匹配查找(match使用)
awk 'BEGIN{info="this is a test2010test!";print match(info,/[0-9]+/)?"ok":"no found";}'

截取字符串(substr使用)
awk 'BEGIN{info="this is a test2010test!";print substr(info,4,10);}'

字符串分割(split使用)
awk 'BEGIN{info="this is a test";split(info,tA," ");print length(tA);for(k in tA){print k,tA[k];}}'

两文件匹配
awk 'BEGIN{printf "what is your name?";getline name < "/dev/tty" } $1 ~name {print "FOUND" name " on line ", NR "."} END{print "see you," name "."}' test

只打印匹配替换后的行
awk 'gsub(/liu/,"aaaa",$1){print $0}'

处理sql语句
cat 1.txt|awk -F" # " '{print "insert into user (user,password,email)values(""'\''"$1"'\'\,'""'\''"$2"'\'\,'""'\''"$3"'\'\)\;'"}' >>insert_1.txt

引用外部变量
awk '{print "'"$a"'","'"$b"'"}'

字符串位数
awk 'length($1)=="4"{print $1}'

执行系统命令
awk '{if($2>3){system ("touch "$1)}}'

累加一组数字
awk '{a+=$1}END{print a}'

END块里面处理数组内容
awk -F: '{name[x++]=$1};END{for(i=0;i<NR;i++)print i,name[i]}' data

将$1的值叠加后赋给sum
awk 'sum+=$1{print sum}' <<EOF
1 11 111
2 22 222
8 33 333
10 44 444
EOF

加入END只打印最后的结果
awk '{sum2+=$2;count=count+1}END{print sum2,sum2/count}' <<EOF
1324236000: 4.8726625090e+06 1.4806911317e+07
1324236300: 3.1952608823e+05 1.3144868085e+07
1324236600: 5.0792587262e+05 1.4931600767e+07
EOF
#结果中第一个值是$2的总和 第二个值是$3的总和 第三个值是$2总和除个数（平均值） 第四个值是$3总和除个数（平均值）
#e+06 是科学计数法，表示乘以10的6次方

awk '{sum2+=$2;count=count+1}END{print sum2,sum2/count}' <<EOF
1: 3 30
2: 6 60
3: 9 90
EOF


列求和
cat txt |awk '{a+=$1}END{print a}'

列求平均值
cat txt |awk '{a+=$1}END{print a/NR}'

列求最大值
cat txt |awk 'BEGIN{a=0}{if ($1>a) a=$1 fi}END{print a}'
#设定一个变量开始为0，遇到比该数大的值，就赋值给该变量，直到结束

求最小值
cat txt |awk 'BEGIN{a=11111}{if ($1<a) a=$1 fi}END{print a}'

判断$1是否整除(awk中定义变量引用时不能带 $ )
cat txt |awk '{ i=$1%10;if ( i == 0 ) {print i}}'

打印前4列和后4列
awk '{for(i=1;i<=4;i++)printf $i""FS; for(y=10;y<=13;y++)  printf $y""FS;print ""}'

将多行转多列
awk  '{for(i=1;i<=NF;i++) a[i,NR]=$i}END{for(i=1;i<=NF;i++) {for(j=1;j<=NR;j++) printf a[i,j] " ";print ""}}'  txt
sed ':a;N;$ s/\n/ /g;ba' txt

加行号
awk '{print NR" "$0}'

将1替换成a，并且只在行中未出现字串mysql的情况下替换
awk '{if(!/mysql/)gsub(/1/,"a");print $0}'

查找字符串并将匹配行的上一行显示出来，但并不显示匹配行
awk '/regexp/{print A}{A=$0}'

查找字符串并将匹配行的下一行显示出来，但并不显示匹配行
awk '{if(A)print;A=0}/regexp/{A=1}'

获取随机数
awk 'BEGIN{srand();fr=int(100*rand());print fr;}'

文件的内容是这样的：
1
111
ab_cd
2
222
ef
_gh
3
333
ij
_kl
4
444
mn_op

我想变为这样，遇到下划线开头的要和上一行连接起来：
1 111 ab_cd
2 222 ef_gh
3 333 ij_kl
4 444 mn_op

awk '!(++i%3){s=s" "$0;while(getline>0){if($0~/^_/){s=s""$0}else{y=$0;break}}print s;s=y;i=length(y)?1:0;next}{s=length(s)?s" "$0:$0}' txt
sed -n '1h;1!H;/^[a-z]/{n;/^_/{H;g};/^_/!x;s#\n_#_#g;s#\n# #gp}' txt

老男孩awk经典题:
分析图片服务日志，把日志（每个图片访问次数*图片大小的总和）排行，也就是计算每个url的总访问大小
说明：本题生产环境应用：这个功能可以用于IDC网站流量带宽很高，然后通过分析服务器日志哪些元素占用流量过大，进而进行优化或裁剪该图片，压缩js等措施。
本题需要输出三个指标： 【被访问次数】    【访问次数*单个被访问文件大小】   【文件名（带URL）】
测试数据
59.33.26.105 - - [08/Dec/2010:15:43:56 +0800] "GET /static/images/photos/2.jpg HTTP/1.1" 200 11299

awk '{array_num[$7]++;array_size[$7]+=$10}END{for(i in array_num) {print array_num[i]" "array_size[i]" "i}}'

##################################
awk练习题

姓       字符数

wang     4
cui      3
zhao     4
liu      3
liu      3
chang    5
li       2

注：以下题目均用awk实现。

1 通过第一个域找出字符长度为4的
2 当第二列值大于3时，创建空白文件，文件名为当前行第一个域$1 (touch $1)
3 将文档中 liu 字符串替换为 hong
4 求第二列的和
5 求第二列的平均值
6 求第二列中的最大值
7 将第一列过滤重复后，列出每一项，每一项的出现次数，每一项的大小总和


字符串长度
awk 'length($1)=="4"{print $1}'

执行系统命令
awk '{if($2>3){system ("touch "$1)}}'

gsub(/r/,"s",域) 在指定域(默认$0)中用s替代r  (sed 's///g')
awk '{gsub(/liu/,"hong",$1);print $0}' a.txt

列求和
awk '{a+=$2}END{print a}'

列求平均值
awk '{a+=$2}END{print a/NR}'
awk '{a+=$2;b++}END{print a,a/b}'

列求最大值
awk 'BEGIN{a=0}{if($2>a) a=$2 }END{print a}'

将第一列过滤重复列出每一项，每一项的出现次数，每一项的大小总和
awk '{a[$1]++;b[$1]+=$2}END{for(i in a){print i,a[i],b[i]}}'

显示第52行
awk '{if(NR==52){print;exit}}'

从第3行开始，每7行显示一次
awk '{if(NR==3)F=1}{if(F){i++;if(i%7==1)print}}'

##################################
显示空行分割各段的行数
18546794  3101700  50
18546794  3101700  50
18549436  3102149  50

18559007  3111524  50
18559007  3111524  50

18560294  3114215  50

awk '{if(NF<1){print i;i=0} else {i++;print $0}}' aa.txt

##################################

	sed用法
先读取资料、存入模式空间、对其进行编辑、再输出、再用下一行替换模式空间内容
调试工具sedsed (参数 -d)
http://aurelio.net/sedsed/sedsed-1.0

-n 	 输出由编辑指令控制(取消默认的输出,必须与编辑指令一起配合)
-i   直接对文件操作
-e   多重编辑 #修改文件先加 -i

b   跳过匹配的行
p   打印
d   删除
s   替换
g   配合s全部替换
i   行前插入
a   行后插入
r   读
y   转换
q   退出

\(..\)  保存..作为标签1(\1)
&   代表查找的串内容
*   前导符
$   最后一行
.*  匹配任意多个字符

模式空间(两行两行处理) 模式匹配的范围，一般而言，模式空间是输入文本中某一行，但是可以通过使用N函数把多于一行读入模式空间。
暂存空间里默认存储一个空行

n 读入下一行(覆盖上一行)
h 把模式空间里的行拷贝到暂存空间
H 把模式空间里的行追加到暂存空间
g 用暂存空间的内容替换模式空间的行
G 把暂存空间的内容追加到模式空间的行后
x 将暂存空间的内容于模式空间里的当前行互换
！ 对其前面的要匹配的范围取反
多输入行：提供跨越输入中的行的模式匹配
D 删除当前模式空间中直到并包含第一个换行符的所有字符(/.*/匹配模式空间中所有内容，匹配到就执行D,没匹配到就结束D)
N 追加下一个输入行到模式空间后面并在第二者间嵌入一个换行符，改变当前行号码,模式匹配可以延伸跨域这个内嵌换行
p 打印模式空间中的直到并包含第一个换行的所有字符


标签函数
: lable 建立命令标记，配合b，t函数使用跳转
b lable 分支到脚本中带有标记的地方，如果分支不存在则分支到脚本的末尾。
t labe  判断分支，从最后一行开始，条件一旦满足或者T,t命令，将导致分支到带有标号的命令出，或者到脚本末尾。与b函数不同在于t在执行跳转前会先检查其前一个替换命令是否成功，如成功，则执行跳转。



sed命令替换并打印出替换行( -i改变文本)
sed -n -e "{s/文本(正则表达式)/替换的文本/p}"

打印并删除正则表达式的那部分内容
sed -n -e "{s/^ *[0-9]*//p}"

删除匹配行
sed -i "/^$f/d" a

删除匹配行到末尾
sed -i '/ppppppppppp/,$d' incl

直接对文本替换
sed -i "s/=/:/" c

找到pearls开头在行尾加j
sed -i "/^pearls/s/$/j/" ab.txt

标签(保存\(mar\)作为标签1)
sed -n 's/\(mar\)got/\1ianne/p' 文件
echo "margot"|sed -n 's/\(mar\).*\(t\)/\1\2/p'
sed -e 's/^\([a-zA-Z]\+\) \([a-zA-Z]\+\)\(.*\)/\2 \1\3/g' file

在以[0-9][0-9]结尾的行后加5
sed 's/[0-9][0-9]$/&5' 文件

打印从第5行到以no开头行之间的所有行
sed -n '5,/^no/p' 文件

匹配字符替换
echo abcd|sed 'y/bd/BE/'

匹配1和3行替换
seq 10| sed -e{1,3}'s/./a/'

修改west和east之间的所有行，在结尾处加*VACA*
sed '/west/,/east/s/$/*VACA*/' 文件

多重编辑(先删除1-3行，在将1替换成2)
sed -i -e '1,3d' -e 's/1/2/' 文件

找到含suan的行，在后面加上读入的文件内容
sed '/suan/r 读入文件' 文件

找到含no的行，写入到指定文件中
sed -n '/no/w 写入文件' 文件

取出第一组数字，并且忽略掉开头的0
sed  's/[^1-9]*\([0-9]\+\).*/\1/'

打印1和3之间的行
sed '/1/,/3/p' file

取出指定行
sed -n '1p' 文件

在第5行之前插入行
sed '5i\aaa' file

在第5行之后抽入行
sed '5a\aaa' file

在匹配行前插入一行
echo a|sed -e '/a/i\b'

在匹配行后插入一行
echo a|sed -e '/a/a\b'
echo a|sed 's/a/&\nb/g'

引用外部变量
sed -n ''$a',10p'
sed -n ""$a",10p"

取用户家目录(匹配不为/的字符和匹配:到结尾的字符全部删除)
sed -n '{s/^[^\/]*//;s/\:.*//;p}' /etc/passwd

将换行符转换为换行
echo abcd\\nabcde |sed 's/\\n/@/g' |tr '@' '\n'

删除掉@后面所有字符，和空行
sed -e 's/@.*//g' -e '/^$/d'

将几行合并成一行
echo $(cat file)|sed 's/ //g'

取一列最大值
cat tmp|awk '{print $1}'|sort -n|sed -n '$p'

查找属主权限为7的文件
ls -l|sed -n '/^.rwx.*/p'

在a前面加#号
echo a|sed -e 's/a/#&/g'

非#号开头的行替换字符
sed '/^#/b;y/y/P/' 2

倒叙排列
seq 1 10|sed '1!G;h;$!d'

在每一行后面增加两空行
sed 'G;G'

在输出的文本中每一行后面将有且只有一空行。
sed '/^$/d;G'

删除所有偶数行
sed 'n;d'

在匹配式样行之后插入一空行
sed '/regex/G'

在匹配式样行之前和之后各插入一空行
sed '/regex/{x;p;x;G;}'

为文件中的每一行进行编号(简单的左对齐方式)
sed = filename | sed 'N;s/\n/\t/'

对文件中的所有行编号（行号在左，文字右端对齐）
sed = filename | sed 'N;s/^/      /; s/ *\(.\{6,\}\)\n/\1   /'

计算行数(模拟 "wc -l")
sed  -n '$='

将每一行前导的"空白字符"(空格，制表符)删除,使之左对齐
sed 's/^[ \t]*//'

将每一行中的前导和拖尾的空白字符删除
sed 's/^[ \t]*//;s/[ \t]*$//'

只替换每一行中的第四个字串
sed 's/foo/bar/4'

替换每行最后一个字符串
sed 's/\(.*\)foo/\1bar/'

替换倒数第二个字符串
sed 's/\(.*\)foo\(.*foo\)/\1bar\2/'

只在行中出现字串"baz"的情况下将"foo"替换成"bar"
sed '/baz/s/foo/bar/g'

将"foo"替换成"bar"，并且只在行中未出现字串"baz"的情况下替换
sed '/baz/!s/foo/bar/g'

将每两行连接成一行
sed '$!N;s/\n//'

在每5行后增加一空白行
sed 'n;n;n;n;G;'

只打印行号为5的倍数
sed -n '5~5p'

倍数行执行替换
seq 1 30|sed  '5~5s/.*/a/'

显示文件中的前10行 (模拟head)
sed 10q

只显示不匹配正则表达式的行
sed  -n '/regexp/!p'
sed '/regexp/d'

查找字符串并将匹配行的上一行显示出来，但并不显示匹配行
sed  -n '/regexp/{g;1!p;};h'

查找字符串并将匹配行的下一行显示出来，但并不显示匹配行
sed  -n ' /regexp/{n;p;}'

从第3行开始，每7行显示一次
sed  -n '3,${p;n;n;n;n;n;n;}'

同时处理多个文件
echo -e "1\n2"|xargs -i -t sed 's/^/1/' {}

取所有IP
/sbin/ifconfig |sed 's/.*inet addr:\(.*\) Bca.*/\1/g' |sed -n '/eth/{n;p}'

文件内容第一行A第二行B:建立标签p1;两个替换函数(A替换成AA,B替换成BB)当A或者B达到10个以后调用b,返回
sed -e '{:p1;/A/s/A/AA/;/B/s/B/BB/;/[AB]\{10\}/b;b p1;}'

模仿rev功能
echo 123 |sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//;'
321
/\n/!G;         # 没有\n换行符，要执行G,因为保留空间中为空，所以在模式空间追加一空行
s/\(.\)\(.*\n\)/&\2\1/;     # 标签替换 &\n23\n1$ (关键在于& ,可以让后面//匹配到空行)
//D;            # D 命令会引起循环删除模式空间中的第一部分，如果删除后，模式空间中还有剩余行，则返回 D 之前的命令，重新执行，如果 D 后，模式空间中没有任何内容，则将退出。  //D 匹配空行执行D,如果上句s没有匹配到,//也无法匹配到空行, "//D;"命令结束
s/.//;          # D结束后,删除开头的 \n

标签函数t使用方法,替换[]里的空格
echo 'sd  f   f   [a    b      c    cddd    eee]' | sed ':n;s#\(\[[^ ]*\)  *#\1#;tn'

##################################

	图形dialog
默认将所有输出用 stderr 输出，不显示到屏幕
退出状态  0正确  1错误

窗体类型
--calendar          #日历
--checklist         #允许你显示一个选项列表，每个选项都可以被单独的选择 (复选框)
--form              #表单,允许您建立一个带标签的文本字段，并要求填写
--fselect           #提供一个路径，让你选择浏览的文件
--gauge             #显示一个表，呈现出完成的百分比，就是显示出进度条。
--infobox           #显示消息后，（没有等待响应）对话框立刻返回，但不清除屏幕(信息框)
--inputbox          #让用户输入文本(输入框)
--inputmenu         #提供一个可供用户编辑的菜单（可编辑的菜单框）
--menu              #显示一个列表供用户选择(菜单框)
--msgbox(message)   #显示一条消息,并要求用户选择一个确定按钮(消息框)
--password          #密码框，显示一个输入框，它隐藏文本
--pause             #显示一个表格用来显示一个指定的暂停期的状态
--radiolist         #提供一个菜单项目组，但是只有一个项目，可以选择(单选框)
--tailbox           #在一个滚动窗口文件中使用tail命令来显示文本
--tailboxbg         #跟tailbox类似，但是在background模式下操作
--textbox           #在带有滚动条的文本框中显示文件的内容  (文本框)
--timebox           #提供一个窗口，选择小时，分钟，秒
--yesno(yes/no)     #提供一个带有yes和no按钮的简单信息框

窗体参数
--separate-output          #对于chicklist组件,输出结果一次输出一行,得到结果不加引号
--ok-label "提交"          #确定按钮名称
--cancel-label "取消"      #取消按钮名称
--title "标题"             #标题名称
--stdout                   #将所有输出用 stdout 输出
--backtitle "上标"         #窗体上标
--no-shadow                #去掉窗体阴影
--menu "菜单名" 20 60 14   #菜单及窗口大小
--clear                    #完成后清屏操作
--no-cancel                #不显示取消项
--insecure                 #使用星号来代表每个字符
--begin <y> <x>            #指定对话框左上角在屏幕的上的做坐标
--timeout <秒>             #超时,返回的错误代码255,如果用户在指定的时间内没有给出相应动作,就按超时处理
--defaultno                #使选择默认为no
--default-item <str>       #设置在一份清单，表格或菜单中的默认项目。通常在框中的第一项是默认
--sleep 5                  #在处理完一个对话框后静止(延迟)的时间(秒)
--max-input size           #限制输入的字符串在给定的大小之内。如果没有指定，默认是2048
--keep-window              #退出时不清屏和重绘窗口。当几个组件在同一个程序中运行时，对于保留窗口内容很有用的

多选界面[方括号]
dialog --title "Check me" --checklist "Pick Numbers" 15 25 3 1 "one" "off" 2 "two" "on" 3 "three" "off" 2>tmp

多选界面(圆括号)
dialog --title "title" --radiolist "checklist" 20 60 14 tag1 "item1" on tag2 "item2" off

单选界面
dialog --title "title" --menu "MENU" 20 60 14 tag1 "item1" tag2 "item2"

进度条
dialog --title "Installation" --backtitle "Star Linux" --gauge "Linux Kernel"  10 60 50

选择yes/no
dialog --title "标题" --backtitle "Dialog" --yesno "说明" 20 60

公告
dialog --title "公告标题" --backtitle "Dialog" --msgbox "内容" 20 60

显示讯息后立即离开
dialog --title "hey" --backtitle "Dialog" --infobox "Is everything okay?" 10 60

输入对话框
dialog --title "hey" --backtitle "Dialog" --inputbox "Is okay?" 10 60 "yes"

显示文档内容
dialog --title "Array 30" --backtitle "All " --textbox /root/txt 20 75

多条输入对话框
dialog --title "Add a user" --form "Add a user" 12 40 4  "Username:" 1  1 "" 1  15  15  0  "Full name:" 2  1 "" 2  15  15  0

星号显示输入--insecure
dialog  --title  "Password"  --insecure  --passwordbox  "请输入密码"  10  35

选择日期
dialog --stdout --title "日历"  --calendar "请选择" 0 0 9 1 2010

选择内容赋给变量(使用标准输出)
a=`dialog --title "title"  --stdout --menu "MENU" 20 60 14 tag1 "item1" tag2 "item2"`

取到结果放到文件中(默认以标准错误输出结果)
dialog --title "title"  --stdout --menu "MENU" 20 60 14 tag1 "item1" tag2 "item2" 2>tmp

##################################

脚本头 # sh为当前系统默认shell,可指定为bash等
#!/bin/sh

执行过程
sh -x

检查语法
sh -n

临时文件定义
errtmp=/tmp/$$`date +%s%N`.errtmp
outtmp=/tmp/$$`date +%s%N`.outtmp
true > $outtmp

随机数
$RANDOM

进程号
$$

纳秒
date +%N

在当前bash环境下读取并执行FileName中的命令
source FileName   # 等同   . FileName

间隔睡眠5秒
sleep 5

在接收到信号后将要采取的行动
trap

当前目录
$PWD

之前一个目录的路径
$OLDPWD

返回上一个目录路径
cd -

重复打印
yes

自动回答y或者其他
yes |rm -i *

查看目录所有文件夹
ls -p /home

查看匹配完整路径
ls -d /home/

命令替换xargs
-t 先打印命令，然后再执行
-i 用每项替换 {}
#将前面的内容，作为后面命令的参数
find / -perm +7000 | xargs ls -l
seq 1 10 |xargs  -i date -d "{} days " +%Y-%m-%d

不换行执行下一句话
echo -n aa;echo bb

使转义生效
echo -e "s\tss\n\n\n"

取字符串中字元
echo $a | cut -c2-6

排列组合(括号内一个元素分别和其他括号内元素组合)
echo {a,b,c}{a,b,c}{a,b,c}

打印颜色
echo -e "\033[0;31mL\033[0;32mO\033[0;33mV\033[0;34mE\t\033[0;35mY\033[0;36mO\033[0;32mU"

二进制转10进制
echo $((2#11010))

打印10个字符
echo {1..10}
printf '%10s\n'|tr " " a

返回目录名
pwd | awk -F/ '{ print "目录名:" ,$2 }'

倒置读取文件  # 删除最后3行
tac file |sed 1,3d|tac

取最后3行
tail -3 file

替换上一条命令中的(foo)一个短语(bar)
^foo^bar^
!!:s/foo/bar/
!!:gs/foo/bar

##################################

	shell例子

判断参数是否为空-空退出并打印null
#!/bin/sh
echo $1
name=${1:?"null"}
echo $name

##################################

	循环数组
for ((i=0;i<${#o[*]};i++))
do
echo ${o[$i]}
done

##################################

	判断路径

if [ -d /root/Desktop/text/123 ];then
	echo "找到了123"
        if [ -d /root/Desktop/text ]
        then echo "找到了text"
        else echo "没找到text"
        fi
else echo "没找到123文件夹"
fi

##################################

	匹配替换密码

#!/bin/sh
cat mailpassword > temp.txt
sed -i "s/:/ = /" temp.txt
w=`awk -F " = " '{print $1}' temp.txt`
for d in $w
do
        grep -w $d svnpassword >/dev/null
        if [ $? -eq 0 ]
        then
	sed -i "/^$d/d" svnpassword
	grep "^$d" temp.txt >> svnpassword
#替换到转义就出问题
#sed -i "/^$d/c  $(grep "^$d" temp.txt)" svnpassword
        fi
done
rm temp.txt

##################################

	多行合并

将两行并为一行(去掉换行符)
sed '{N;s/\n//}' file

将4行合并为一行(可扩展)
awk '{if (NR%4==0){print $0} else {printf"%s ",$0}}' file
将所有行合并
awk '{printf"%s ",$0}'

##################################

找出出现次数最多
awk '{print $1}' file|sort |uniq -c|sort -k1r

##################################

	shift用法

./cs.sh 1 2 3
#!/bin/sh
until [ $# -eq 0 ]
do
echo "第一个参数为: $1 参数个数为: $#"
#shift 命令执行前变量 $1 的值在shift命令执行后不可用
shift
done

##################################

	给脚本加参数getopts

#!/bin/sh
while getopts :ab: name
do
case $name in
a)  aflag=1
        ;;
b)  bflag=1
bval=$OPTARG
        ;;
\?) echo "USAGE:`basename $0` [-a] [-b value]"
exit  1
        ;;
esac
done
if [ ! -z $aflag ] ; then
echo   "option -a specified"
echo  "$aflag"
echo "$OPTIND"
fi
if [ ! -z $bflag ] ; then
echo  "option -b specified"
echo  "$bflag"
echo  "$bval"
echo  "$OPTIND"
fi
echo "here  $OPTIND"
shift $(($OPTIND -1))
echo "$OPTIND"
echo " `shift $(($OPTIND -1))`  "

##################################

	判断脚本参数是否正确

./test.sh  -p 123 -P 3306 -h 127.0.0.1 -u root
#!/bin/sh
if [ $# -ne 8 ];then
echo "USAGE: $0 -u user -p passwd -P port -h host"
exit 1
fi

while getopts :u:p:P:h: name
do
case $name in
u)
mysql_user=$OPTARG
;;
p)
mysql_passwd=$OPTARG
;;
P)
mysql_port=$OPTARG
;;
h)
mysql_host=$OPTARG
;;
*)
echo "USAGE: $0 -u user -p passwd -P port -h host"
exit 1
;;
esac
done

if [ -z $mysql_user ] || [ -z $mysql_passwd ] || [ -z $mysql_port ] || [ -z $mysql_host ]
then
echo "USAGE: $0 -u user -p passwd -P port -h host"
exit 1
fi

echo $mysql_user $mysql_passwd $mysql_port  $mysql_host
#结果 root 123 3306 127.0.0.1

##################################

	dialog取值接值退出

outtmp=/tmp/outtmp
dialog --no-shadow --backtitle "雪松" --title "请选择" --ok-label "提交" --cancel-label "取消" --menu "请选择" 10 60 0 \
1		"[目录]" \
q		"[退出]" \
2> $outtmp
#判断提交取消
if [ $? == "1" ]
then
	break
	#continue
fi
#只判断退出
pt=`awk '{print}' $outtmp`
if [ $pt == q ]
then
break
fi
#判断操作
case $pt in
1)
#操作
;;
q)
exit #break
;;
esac

##################################

	dialog输入对话框加判断

while :
do
outtmp=/tmp/outtmp
dialog --title "雪松" --form "请输入" 20 60 10  "用户:" 1  2 "" 1  15  35  0 "ID:" 2  2 "" 2  15  35  0  "" 6  2 "" 6  0  0  0 "输入格式如下" 7  2 "" 7  0  0  0 "说明" 8  2 "" 8  0  0  0 2> $outtmp
yh=`sed -n '1p' $outtmp`
id=`sed -n '2p' $outtmp`
if echo $yh | grep -e '^[1-9][0-9]\{0,2\}' > /dev/null 2>&1
then
	if echo $id | grep -e '^[1-9][0-9]\{0,12\}' > /dev/null 2>&1
	then
		break
	else
		echo "您输入的不合法，请从新输入！"
	fi
else
	echo "您输入的不合法，请从新输入！"
fi
done

##################################

	打印表格

#!/bin/sh
clear
awk 'BEGIN{
print "+--------------------+--------------------+";
printf "|%-20s|%-20s|\n","Name","Number";
print "+--------------------+--------------------+";
}'
a=`grep "^[A-Z]" a.txt |sort +1 -n |awk '{print $1":"$2}'`
#cat a.txt |sort +1 -n |while read list
for list in $a
do
name=`echo $list |awk -F: '{print $1}'`
number=`echo $list |awk -F: '{print $2}'`
awk 'BEGIN{printf "|%-20s|%-20s|\n","'"$name"'","'"$number"'";
print "+--------------------+--------------------+";
}'
done
awk 'BEGIN{
print "              *** The End ***              "
print "                                           "
}'

##################################

	判断日期是否合法

#!/bin/sh
while read a
do
  if echo $a | grep -q "-" && date -d $a +%Y%m%d > /dev/null 2>&1
  then
	if echo $a | grep -e '^[0-9]\{4\}-[01][0-9]-[0-3][0-9]$'
	then
		break
	else
		echo "您输入的日期不合法，请从新输入！"
	fi
  else
    echo "您输入的日期不合法，请从新输入！"
  fi
done
echo "日期为$a"

##################################

	打印日期段所有日期

#!/bin/bash
qsrq=20010101
jsrq=20010227
n=0
>tmp
while :;do
current=$(date +%Y%m%d -d"$n day $qsrq")
if [[ $current == $jsrq ]];then
	echo $current >>tmp;break
else
	echo $current >>tmp
	((n++))
fi
done
rq=`awk 'NR==1{print}' tmp`

##################################

	打印提示
cat <<EOF
#内容
EOF

	登陆远程执行命令(特殊符号需要 \ 转义)
ssh root@ip << EOF
#执行命令
EOF

	登陆mysql执行命令
mysql -uroot -ppasswd -S mysql.sock --default-character-set=gbk -A<<EOF>outtmp
#mysql命令
EOF

##################################

	数学计算的小算法

#!/bin/sh
A=1
B=1
while [ $A -le 10 ]
do
SUM=`expr $A \* $B`
echo "$SUM"
if [ $A = 10 ]
then
B=`expr $B + 1`
A=1
fi
A=`expr $A + 1`
done

##################################

	竖行转横行(三种)

cat file|tr '\n' ' '
echo $(cat file)
#!/bin/sh
for i in `cat file`
do
      a=${a}" "${i}
done
echo $a

##################################根据IP地址段和主机数获取 IP地址段及掩码
# 访问地址  http://ftp.apnic.net/stats/apnic/

#!/bin/sh
grep 'apnic|CN|ipv4' delegated-apnic-latest | cut -f 4,5 -d '|' | tr '|' ' ' | while read ip cnt
do
mask=$(bc <<END | tail -1
pow=32;
define log2(x) {
if (x<=1) return (pow);
pow--;
return(log2(x/2));
}log2($cnt);
END
)
echo $ip/$mask';'>>ip.txt
done

###################################
	取用户的根目录

#! /bin/bash
while read name pass uid gid gecos home shell
do
echo $home
done < /etc/passwd

##################################

	把汉字转成encode格式：

echo 论坛 | tr -d "\n" | xxd -i | sed -e "s/ 0x/%/g" | tr -d " ,\n"
%c2%db%cc%b3
大写的：
echo 论坛 | tr -d "\n" | xxd -i | sed -e "s/ 0x/%/g" | tr -d " ,\n" | tr "[a-f]" "[A-F]"
%C2%DB%CC%B3

##################################

	把带有大写字母的文件名改为全部小写

#!/bin/bash
for f in *;do
mv $f `echo $f |tr "[A-Z]" "[a-z]"`
done
##################################

	查找连续多行，在不连续的行前插入

#/bin/bash
lastrow=null
i=0
cat incl|while read line
do
i=`expr $i + 1`
if echo "$lastrow" | grep "#include <[A-Z].h>"
then
	if echo "$line" | grep -v  "#include <[A-Z].h>"
	then
		sed -i ''$i'i\\/\/All header files are include' incl
		i=`expr $i + 1`
	fi
fi
lastrow="$line"
done

##################################

	查询数据库其它引擎

#/bin/bash
path1=/data/mysql/data/
dbpasswd=db123
#MyISAM或InnoDB
engine=InnoDB

if [ -d $path1 ];then

dir=`ls -p $path1 |awk '/\/$/'|awk -F'/' '{print $1}'`
	for db in $dir
	do
	number=`mysql -uroot -p$dbpasswd -A -S "$path1"mysql.sock -e "use ${db};show table status;" |grep -c $engine`
		if [ $number -ne 0 ];then
		echo "${db}"
		fi
	done
fi

##################################

	批量修改数据库引擎

#/bin/bash
for db in test test1 test3
do
tables=`mysql -uroot -pdb123 -A -S /data/mysql/data/mysql.sock -e "use $db;show tables;" |awk 'NR != 1{print}'`

for table in $tables
do
mysql -uroot -pdb123 -A -S /data/mysql/data/mysql.sock -e "use $db;alter table $table engine=MyISAM;"
done

done

##################################

	两日期间隔天数

D1=`date -d '20070409' +"%s"`
D2=`date -d '20070304 ' +"%s"`
D3=$(($D1 - $D2))
echo $(($D3/60/60/24))
##################################

交互登陆
#!/usr/bin/expect
#设置超时时间秒
set timeout 30
spawn ssh -l root 192.168.0.253
#判断关键字符
expect "password:"
#执行交互动作，与手工输入密码的动作等效。字符串结尾加"\r"
send "passwd\r"
#执行完成后保持交互状态，把控制权交给控制台
interact

#!/usr/bin/expect
spawn su
expect "口令"
send "TEST\r"
expect "#"
send "rm /root/sh/aaa\r"
expect "是否删除"
send "y\r"
#退出
expect eof

##################################

在同一位置打印字符
#!/bin/bash

echo -ne "\t"
for i in `seq -w 100 -1 1`
do
#关键\b退格
    echo -ne "$i\b\b\b";
    sleep 1;
done

##################################

多线程(同时执行a和b脚本,等a和b都执行完执行c)
#!/bin/bash
./a.sh &
./b.sh &
wait
./c.sh
##################################

#多线程处理文件
#!/bin/bash

test () {
	echo $a
	sleep 5
}

num=1
for a in `seq 1 30`
do
	if [ $num -eq 6 ];then
	echo "等待"
	wait
	num=1
	fi
test &
echo $!
let num=$num+1
done

##################################

====================================================================


----------------------------------
		9服务配置
----------------------------------

	samba

修改配置文
/etc/samba/smb.conf
[global]
workgroup = WORKGROUP
server string = sambaserver
security=share
hosts allow=网络主机
[file]
comment=home directories
path=/etc/samba/xuesong
public=yes
writable=yes
browseable=yes
重启
service smb restart
linux访问windows共享
smbclient -L //ip地址或计算机名

##################################

	DNS服务器

DNS主配置文件，moon.com域名，zone.moon.com域的配置文件
vi /etc/named.conf
zone "moon.com" IN {
     type master;
     file "zone.moon.com";
      allow-update { none; };
};
测试主配置文件
named-checkconf
新建域的配置文件zone.moon.com
vi /var/named/chroot/var/named/zone.moon.com
$TTL 86400
@         IN   SOA xs.   quanzhou722.163.com. (
                                                 20102014
                                                 3H
                                                 15M
                                                 1W
                                                 1D
                                                )
          IN  NS  xs.
          IN  MX 5 mail.
www       IN  A   192.168.1.209
ftp       IN  A   192.168.1.209
mail      IN  A   192.168.1.209
测试moon.com域配置文件
named-checkzone moon.com  /var/named/chroot/var/named/zone.moon.com
建立域配置文件的软连接
ln -s /var/named/chroot/var/named/zone.moon.com  /var/named/zone.moon.com
重启named服务
service named  restart
设置DNS
vi /etc/resolv.conf
测试解析是否成功
host www.moon.com
nslookup www.moon.com

##################################

	ftp配置

查看vsftp是否安装
rpm    -qa | grep vsftp
主配置文件
vi /etc/vsftpd/vsftpd.conf
启动 VSFTPD 服务
service vsftpd restart
查看21端口是否开放
netstat -atln |grep 21
1、匿名用户是否允许访问
anonymous_enable=YES
anon_mkdir_write_enable=YES
2、本地用户管理
local_enable=YES
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd.chroot_list
将用户添加到vsftpd.chroot_list文件中允许访问
cat /etc/passwd |grep ":5[0-9][0-9]:" | awk -F : '{print $1}' > /etc/vsftpd.chroot_list
3、虚拟用户管理
（1）要用到文件数据库db4
rpm -qa |grep db4
（2）将帐户放入文本：（奇数行）用户名 （偶数行）密码
vi zhanghu.dat
（3）生成帐户的文件数据库
db_load -T  -t hash  -f zhanghu.dat /etc/vsftpd/vsftpd_zhanghu.db
（4）修改文件数据库访问权限
chmod 600  /etc/vsftpd/vsftpd_zhanghu.db
（5）手工建立虚拟用户所需的PAM配置文件
vi /etc/pam.d/vsftpd.zhanghu
auth required /lib/security/pam_userdb.so  db=/etc/vsftpd/vsftpd_zhanghu
account required  /lib/security/pam_userdb.so db=/etc/vsftpd/vsftpd_zhanghu
（6）添加一个虚拟用户的入口帐户
useradd -d /var/ZhanDian -s /sbin/nologin XuNiRuKou
（7）在主配置文件中添加虚拟用户的配置内容
虚拟用户的新添加配置
chroot_local_user=YES
guest_enable=YES
guest_username=XuNiRuKou
pam_service_name=vsftpd.zhanghu
（8）在vsftpd.conf配置文件中指定用户配置文件的目录
user_config_dir=/etc/vsftpd/vsftpd_zhandian
（9）建立配置文件中指定用户配置文件的目录
mkdir /etc/vsftpd/vsftpd_zhandian
（10）因为入口帐户是一个本地帐户，所以要指定虚拟用户具有本地帐户的权限，才能读写 自己空间中的文件
虚拟用户就可以就拥有写权限
virtual_use_local_privs=YES
（11）
touch /etc/vsftpd/vsftpd_zhandian/xuesong
echo "local_root=/var/ZhanDian/xuesong" >> /etc/vsftpd/vsftpd_zhandian/xuesong
（12）
mkdir /var/ZhanDian/xuesong
（13）
chown -R XuNiRuKou:XuNiRuKou /var/ZhanDian/
（14）重启服务
/etc/init.d/vsftpd restart
（15）客户端虚拟账号测试


建立用户脚本。最好在加上判断用户名是否存在
#!/bin/sh
echo 请输入用户名
read y
echo $y >> zhanghu.dat
echo 请输入密码
read m
echo $m >> zhanghu.dat
db_load -T  -t hash  -f zhanghu.dat /etc/vsftpd/vsftpd_zhanghu.db
chmod 600  /etc/vsftpd/vsftpd_zhanghu.db
touch /etc/vsftpd/vsftpd_zhandian/$y
echo "local_root=/var/ZhanDian/$y" >> /etc/vsftpd/vsftpd_zhandian/$y
mkdir /var/ZhanDian/$y
chown -R XuNiRuKou:XuNiRuKou /var/ZhanDian/$y
/etc/init.d/vsftpd restart

##################################

	httpd安装

tar zxvf httpd-2.2.12.tar.gz
cd httpd-2.2.12
./configure  --prefix=/usr/local/httpd  \
--enable-rewrite
make  &&   make  install
ls  /usr/local/
groupadd www
useradd -g www -M  -s /sbin/nologin  www
cd /usr/local/httpd/
vi conf/httpd.conf
服务器开启在软件安装目录的bin中
./apachectl start
网页放在的htdocs中
开机启动
vi /etc/rc.d/rc.local
/usr/local/httpd/bin/apachectl start

如果启动提示
httpd: Could not reliably determine the server fully qualified domain name, using 127.0.0.1 for ServerName
修改/etc/hosts计算机名
在httpd.conf中开启
ServerName 127.0.0.1:80
编码设置
AddDefaultCharset UTF-8
AddDefaultCharset GB2312
##################################

	mysql源码安装

groupadd mysql
useradd mysql -g mysql -M -s /bin/false
tar zxvf mysql-5.0.22.tar.gz
cd mysql-5.0.22
./configure  --prefix=/usr/local/mysql \
--with-client-ldflags=-all-static \
--with-mysqld-ldflags=-all-static \
--with-mysqld-user=mysql \
--with-extra-charsets=all \
--with-unix-socket-path=/var/tmp/mysql.sock
make  &&   make  install
生成mysql用户数据库和表文件，在安装包中输入。
scripts/mysql_install_db  --user=mysql
vi ~/.bashrc
export PATH="$PATH: /usr/local/mysql/bin"
配置文件,有large,medium,small三个，根据机器性能选择
cp support-files/my-medium.cnf /etc/my.cnf
cp support-files/mysql.server /etc/init.d/mysqld
chmod 700 /etc/init.d/mysqld
cd /usr/local
chmod 750 mysql -R
chgrp mysql mysql -R
chown mysql mysql/var -R
cp  /usr/local/mysql/libexec/mysqld mysqld.old
ln -s /usr/local/mysql/bin/mysql /sbin/mysql
ln -s /usr/local/mysql/bin/mysqladmin /sbin/mysqladmin
ln -s -f /usr/local/mysql/bin/mysqld_safe /etc/rc.d/rc3.d/S15mysql5
ln -s -f /usr/local/mysql/bin/mysqld_safe /etc/rc.d/rc0.d/K15mysql5

##################################

	mysql rpm安装

到http://www.mysql.com/downloads/mysql下载mysql RPM（service和client），
MySQL-server-community-5.1.51-1.rhel5.i386.rpm    安装服务端
MySQL-client-community-5.1.51-1.rhel5.i386.rpm     安装客户端
MySQL-devel-community-5.1.51-1.rhel5.i386.rpm     用于php的mysql安装
rpm –ivh MySQL-server-community-5.1.51-1.rhel5.i386.rpm
rpm –ivh MySQL-client-community-5.1.51-1.rhel5.i386.rpm
rpm –ivh MySQL-devel-community-5.1.51-1.rhel5.i386.rpm
/etc/init.d/mysqld start
mysqladmin -u root password 'xuesong'
mysql -u root -S /var/lib/mysql/mysql.sock -p
数据目录/var/lib/mysql
chkconfig --list |grep mysqld
chkconfig --level 3 mysqld on
配置文件(日志\pid)
/etc/my.cnf
ll /usr/bin/mysql*

##################################

	mysql常用命令

启动mysql服务
./mysql/bin/mysqld_safe --user=mysql &

登录mysql的命令
格式： mysql -h 主机地址 -u 用户名 -p 用户密码
mysql -h110.110.110.110 -P3306 -uroot -p
mysql -uroot -p -S /data1/mysql5/data/mysql.sock -A  --default-character-set=GBK

刷新
flush privileges;

显示所有数据库
show databases;

打开数据库
use dbname;

显示选中数据库中所有的表
show tables;

查看表结构
desc tables;

删除数据库
drop database name;

删除表
drop table name;

创建数据库
create database name;
mysqladmin -h myhost -u root -p create dbname

创建表
create table ka(ka_id varchar(6),qianshu int);

插入字段
alter table name add column accountid(列名)  int(11) NOT NULL(字段不为空);

不登陆mysql插入字段
mysql -uroot -p -S mysql.sock -e "use db;alter table gift add column accountid  int(11) NOT NULL;flush privileges;"

查询
select 列名称 from 表名称;

查看用户权限
show grants for repl;

备份数据库(不包括库名，还原需先创建库，在use)
mysqldump -h host -u root -p --default-character-set=utf8 --hex-blob   dbname >dbname_backup.sql

备份数据库(包括库名，还原不需要创建库)
mysqldump -h host -u root -p --database --default-character-set=utf8 --hex-blob   dbname >dbname_backup.sql

mysqlhotcopy只能备份MyISAM引擎
/bin/mysqlhotcopy -u root -p

还原数据库
mysql -h host -u root -p dbname < dbname_backup.sql

登陆mysql后还原sql文件
source 路径.sql

赋予查询权限(没有用户，直接创建)
grant select on database.* to user@"%" Identified by "passwd";

赋予所有权限(没有用户，直接创建，不允许对当前库给其他用户赋权限)
grant all privileges on database.* to user@"IP" identified by 'passwd';
grant all privileges on database.* to user@"localhost" Identified by "passwd";
grant all privileges on database.* to user@"%" Identified by "passwd";

赋予所有权限(没有用户，直接创建，允许对当前库给其他用户赋权限)
grant all privileges on database.* to user@"localhost" identified by 'passwd' with grant option;
grant all privileges on database.* to user@"%" identified by 'passwd' with grant option;

对现有账号赋予权限
grant all on zabbix.* to user@'%';
grant all on zabbix.* to user@'localhost';

#zabbix的中添加邮件报警的脚本,脚本的内容如下
cat /usr/local/share/zabbix/alertscripts/sendmail.sh
#!/bin/bash
echo "$3" | mail -s "$2" $1



开放管理操作指令
grant select, insert, update, delete on database.* to user@'ip'identified by "passwd";

回收权限
revoke all on *.* from user@localhost;

更改密码
update user set password=password('passwd') where user='root'
mysqladmin -u root password 'xuesong'

mysql查看所有用户的语句
select user();

删除用户
delete from user where user='sss' and host='localhost' ;

查看主从
show slave status\G;

查看mysql进程
show processlist;

添加索引 解决停mysql速度慢
ALTER TABLE player ADD INDEX weekcredit_faction_index (weekcredit, faction);

创建主从复制用户
grant replication slave on *.* to '用户'@'%' identified by '密码';

备份表
mysqldump -u root -p -S mysql.sock --default-character-set=utf8 --hex-blob db table1 table1  > /data/db.sql

查看系统的字符集和排序方式的设定
SHOW VARIABLES LIKE 'character_set_%';

查看超时(wait_timeout)
show variables like '%timeout%';

查看所有参数变量
show variables;

删除空用户
delete from user where user='';

创建表指定存储引擎的类型(MyISAM或INNODB)
CREATE TABLE innodb (id int, title char(20)) ENGINE = INNODB

改变现有的表使用的存储引擎:
ALTER TABLE mytable ENGINE = MyISAM ;

查询表引擎
SHOW TABLE STATUS from  数据库库名  where Name='表名';

查询用户权限
select host,user,password from user;

查看表的引擎状态
show table status

备份数据库结构
mysqldump -uroot -p123  -d database > database.sql

查看二进制日志(报错加绝对路径)
mysqlbinlog slave-relay-bin.000001

mysql忘记密码后重置
cd /data/mysql5
/data/mysql5/bin/mysqld_safe --user=mysql --skip-grant-tables --skip-networking &
update user set password=password('123123') where user='root';

检查、修复、优化MyISAM表
mysqlcheck -uroot -p -S mysql.sock --optimize --databases account

##################################

mysql主从复制失败恢复

slave stop;
reset slave;
change master to master_host='10.10.10.110',master_port=3306,master_user='repl',master_password='repl',master_log_file='master-bin.000010',master_log_pos=107,master_connect_retry=60;
slave start;

##################################

#将shell取到的数据插入数据库
mysql -u$username -p$passwd -h$dbhost -P$dbport -A -e "
use $dbname;
insert into data values ('','$ip','$date','$time','$data')
"
done

#清除数据库中过期的数据
date1=`date -d "7 days ago " +%Y-%m-%d`
mysql -u$username -p$passwd -h$dbhost -P$dbport -A -e "
use $dbname;
delete from data where date=('$date1');
"

##################################

	gd安装

分别安装组件libxml、zlib、freetype、libpng、jpegsrc、gd
libxml2-2.6.24.tar.bz2
zlib-1.2.3.tar.gz
freetype-2.2.1.tar.gz
libpng-1.2.10.tar.gz
jpegsrc.v6b.tar.gz
gd-2.0.33.tar.gz

libxml安装
tar xzvf libxml2-2.6.24.tar.bz2
tar xvf libxml2-2.6.24.tar
cd libxml2-2.6.24
./configure
make
make  install

zlib安装
tar xzvf zlib-1.2.3.tar.gz
cd zlib-1.2.3
./configure
make
make  install

freetype安装
tar xzvf freetype-2.2.1.tar.gz
cd freetype-2.2.1
./configure --prefix=/usr/local/php/modules/freetype
make
make install

libpng安装
tar xzvf libpng-1.2.10.tar.gz
cd libpng-1.2.10
./configure --prefix=/usr/local/php/modules/libpng

jpeg安装
mkdir /usr/local/php/modules/jpeg6
mkdir /usr/local/php/modules/jpeg6/bin
mkdir /usr/local/php/modules/jpeg6/lib
mkdir /usr/local/php/modules/jpeg6/include
mkdir /usr/local/php/modules/jpeg6/man
mkdir /usr/local/php/modules/jpeg6/man/man1
一句创建
mkdir -pv /usr/local/jpeg/{,bin,lib,include,man/man1,man1}
tar zxvf jpegsrc.v6b.tar.gz
cd jpeg-6b/
./configure --prefix=/usr/local/php/modules/jpeg6 \
--enable-shared \
--enable-static
make
make install

gd安装
tar zxvf gd-2.0.33.tar.gz
cd  gd-2.0.33
./configure --prefix=/usr/local/gd2 \
--with-jpeg=/usr/local/php/modules/jpeg6 \
--with-png=/usr/local/php/modules/libpng \
--with-zlib \
--with-freetype=/usr/local/php/modules/freetype
修改Makefile文件231行，重复的第二个freetype改为libpng
make
make install

	php安装
tar xvf php-5.1.6.tar
cd php-5.1.bz2.6
./configure  --prefix=/usr/local/php \
--sysconfdir=/etc \
--with-apxs2=/usr/local/httpd/bin/apxs \
--with-config-file-path=/usr/local/php/lib \
--with-libxml-dir=/usr/local/libxml2 \
--with-zlib \
--with-jpeg-dir=/usr/local/php/modules/jpeg6 \
--with-freetype-dir=/usr/local/php/modules/freetype \
--with-gd=/usr/local/gd2 \
--with-openssl \
--with-regex=php \
--with-gnu-ld \
--with-tsrm-pthreads \
--with-bz2 \
--with-gettext \
--with-db4=/usr \
--enable-ftp \
--enable-bcmath \
--enable-dba \
--enable-sockets \
--enable-soap \
--enable-zend-multibyte \
--enable-mbstring \
--with-curlwrappers \
--with-curl=/usr/local/curl \
--with-pdo-mysql=/usr/local/mysql \
--with-mysql=/usr/local/mysql \
--with-mysqli=/usr/local/mysql/bin/mysql_config
make
make install
cp php.ini-recommended /usr/local/php/lib/php.ini
vi /usr/local/php/lib/php.ini
在PHP.IN添加
[eaccelerator]
extension=/usr/local/php/lib/php/extensions/no-debug-non-zts-20060613/eaccelerator.so
eaccelerator.shm_size="32"
eaccelerator.cache_dir="/usr/local/cache/eaccelerator"
eaccelerator.enable="1"
eaccelerator.optimizer="1"
eaccelerator.check_mtime="1"
eaccelerator.debug="0"
eaccelerator.filter=""
eaccelerator.shm_max="0"
eaccelerator.shm_ttl="0"
eaccelerator.shm_prune_period="0"
eaccelerator.shm_only="0"
eaccelerator.compress="1"
eaccelerator.compress_level="9"
完成后在/usr/local/httpd/conf/httpd.conf文件上添加如下一行：
AddType application/x-httpd-php .php .php5
ln -s /usr/local/php/bin/php /sbin/php
vi index.php
<? php
phpinfo();
?>
重启httpd
/usr/local/httpd/bin/apachectl restart

最后一步重新启动apache报如下错误:
httpd: Syntax error on line 53 of /usr/local/apache/conf/httpd.conf: Cannot load /usr/local/apache/modules/libphp5.so into server: /usr/local/apache/modules/libphp5.so: cannot restore segment prot after reloc: Permission denied

不关闭SELINUX的方法:
# setenforce 0
# chcon -c -v -R -u system_u -r object_r -t textrel_shlib_t /usr/local/apache/modules/libphp5.so
# service httpd restart
# setenforce 1

##################################

		LVS集群

LVS-- ipvsadm命令参考
ipvsadm的用法和格式如下：ipvsadm -A|E -t|u|f virutal-service-address:port [-s scheduler] [-p [timeout]] [-M netmask]
ipvsadm -D -t|u|f virtual-service-address
ipvsadm -C ipvsadm -R ipvsadm -S [-n]
ipvsadm -a|e -t|u|f service-address:port -r real-server-address:port [-g|i|m] [-w weight] ipvsadm -d -t|u|f service-address -r server-address
ipvsadm -L|l [options]
ipvsadm -Z [-t|u|f service-address]
ipvsadm --set tcp tcpfin udp ipvsadm --start-daemon state [--mcast-interface interface] ipvsadm --stop-daemon
ipvsadm -h

命令选项解释：有两种命令选项格式，长的和短的，具有相同的意思。在实际使用时，两种都可以。
-A --add-service 在内核的虚拟服务器表中添加一条新的虚拟服务器记录。也就是增加一台新的虚拟服务器。
-E --edit-service 编辑内核虚拟服务器表中的一条虚拟服务器记录。
-D --delete-service 删除内核虚拟服务器表中的一条虚拟服务器记录。
-C --clear 清除内核虚拟服务器表中的所有记录。
-R --restore 恢复虚拟服务器规则
-S --save 保存虚拟服务器规则，输出为-R选项可读的格式
-a --add-server 在内核虚拟服务器表的一条记录里添加一条新的真实服务器记录。也就是在一个虚拟服务器中增加一台新的真实服务器
-e --edit-server 编辑一条虚拟服务器记录中的某条真实服务器记录
-d --delete-server 删除一条虚拟服务器记录中的某条真实服务器记录
-L|-l --list 显示内核虚拟服务器表

其他的选项:-t --tcp-service service-address 说明虚拟服务器提供的是tcp的服务[vip:port] or [real-server-ip:port]
-u --udp-service service-address 说明虚拟服务器提供的是udp的服务[vip:port] or [real-server-ip:port]
-f --fwmark-service fwmark 说明是经过iptables标记过的服务类型。
-s --scheduler scheduler 使用的调度算法，有这样几个选项rr|wrr|lc|wlc|lblc|lblcr|dh|sh|sed|nq,-p --persistent [timeout] 持久稳固的服务。这个选项的意思是来自同一个客户的多次请求，将被同一台真实的服务器处理。timeout的默认值为300秒。
-M --netmask netmask persistent granularity mask
-r --real-server server-address 真实的服务器[Real-Server:port]
-g --gatewaying 指定LVS的工作模式为直接路由模式（也是LVS默认的模式）
-i --ipip 指定LVS的工作模式为隧道模式
-m --masquerading 指定LVS的工作模式为NAT模式
-w --weight weight 真实服务器的权值
--mcast-interface interface 指定组播的同步接口
-c --connection 显示LVS目前的连接 如：ipvsadm -L -c

##################################

	VS-NAT模式

内容服务器的容量10～20
使用保留地址的LAN
双向重写

安装ipvsadm软件
内核做个连接
yum install  kernel-devel
ln -s /usr/src/kernels/2.6.18-53.e15-i686/ /usr/src/linux
安装软件
查看ipvsadm版本
ipvsadm --version

建立脚本/etc/rc.d/lvs
echo "1" > /proc/sys/net/ipv4/ip_forward
#清除ipvsadm一系列规则
ipvsadm -C
ipvsadm -A -t 外网IP:端口 -s rr
ipvsadm -a -t 外网IP:端口 -r 内网1服务器IP:端口 -m -w 1
ipvsadm -a -t 外网IP:端口 -r 内网2服务器IP:端口 -m -w 1

修改内网服务器ip和网关，开启httpd，建立不同页面测试

缺点不能排除宕机的web服务器，可使用LVS+Keepalived组合
##################################

	heartbeat心跳检测（双机热备）

VIP
192.168.10.252
master
192.168.10.253
192.168.1.1
backup
192.168.10.254
192.168.1.2

###########################################################
#rpm包安装
#需要先装heartbeat-pils 和 heartbeat-stonith两个包
yum install heartbeat-pils heartbeat-stonith heartbeat
rpm -ivh heartbeat-2.1.3-3.el5.centos.i386.rpm
安装完解压配置文件
rpm -q heartbeat -d
cd /etc/ha.d
cp /usr/share/doc/heartbeat-2.1.3/ha.cf .
cp /usr/share/doc/heartbeat-2.1.3/authkeys .
cp /usr/share/doc/heartbeat-2.1.3/haresources .
###########################################################
#源码安装

#所需安装包
libnet.tar.gz
heartbeat-2.1.3.tar.gz
#安装步骤
groupadd haclient
useradd -g haclient hacluster
#首先安装libnet
tar zxvf libnet.tar.gz
cd libnet/
./configure
make
make install
#安装heartbeat
tar zxvf heartbeat-2.1.3.tar.gz
cd heartbeat-2.1.3
./ConfigureMe configure
make
#注意!make到一半，会报一个类似hbaping  HBcomm等字样的错误，解决方法：make后，重命名 lib/plugins/HBcomm/hbaping.loT 为 lib/plugins/HBcomm/hbaping.lo ，重新再执行make即可继续编译。
#这里的hbaping.loT在第一次make之前是不存在的，必须要先make编译，生成了hbaping.loT，再在报错的时候文件名修改为hbaping.lo，再重新make一次即可。
mv lib/plugins/HBcomm/hbaping.loT lib/plugins/HBcomm/hbaping.lo
make
make install

主节点的配置

查看计算机名，记录下来
uname -n
vi ha.cf
打开日志记录文件
logfile /var/log/ha-log
打开心跳检测
keepalive 2
死亡时间
deadtime 30
warntime 10
initdead 120
用什么协议端口（udp）
udpport 694
使用哪个网卡作为心跳检测
bcast eth1
备用的IP
ucast eth1 192.168.1.2
主节点服务器(主机名)
node master
node backup
ping外网测试(网关即可)
ping 一个外网的IP
配置验证模式
vi authkeys
打开
auth 1
1 crc
配置虚拟服务
vi haresources
加上一条名称和IP
计算机名 IP httpd
master 192.168.10.252 httpd
hosts文件要配置上两个机器的机器名和IP
vi /etc/hosts
192.168.10.253 master
192.168.1.1 master
192.168.10.254 backup
192.168.1.2 240 backup
chmod 600 authkeys
service heartbeat start
在配置备用节点
直接拷贝主节点的文件修改
安装完进入安装目录
cd /etc/ha.d
用sftp登陆主机
sftp 192.168.10.253
cd /etc/ha.d
get ha.cf
get authkeys
get hare*
bye
只需要修改ha.cf文件
vi ha.cf
ucast eth1 192.168.1.1
启动备用节点
service heartbeat start

测试
主节点和负节点建立不同index页面
主节点虚拟出外网ip eth0:0
停掉主节点任务
重新访问
启动后在访问

##################################

	DR直接路由模式

同一网段的LAN
内容服务器的容量20以上

降低LVF的负载
VIP服务器的配置脚本
vi /etc/init.d/vip.sh
ifconfig eth0:0 222.90.88.88 broadcast 222.90.88.88 netmask 255.255.255.255 up
route add -host 222.90.88.88 dev eth0:0
ipvsadm -C
ipvsadm -A -t 222.90.88.88:80 -s rr
ipvsadm -a -t 222.90.88.88:80 -r 222.90.88.10 -g
ipvsadm -a -t 222.90.88.88:80 -r 222.90.88.20 -g
ipvsadm
chmod 777 /etc/init.d/vip.sh
/etc/init.d/vip.sh

服务器配置脚本
vi /etc/init.d/lvs.sh
ifconfig lo:0 222.90.88.88 broadcast 222.90.88.88 netmask 255.255.255.255 up
route add -host 222.90.88.88 dev lo:0
echo "1" > /proc/sys/net/ipv4/conf/lo/arp_ignore
echo "2" > /proc/sys/net/ipv4/conf/lo/arp_announce
echo "1" > /proc/sys/net/ipv4/conf/all/arp_ignore
echo "2" > /proc/sys/net/ipv4/conf/all/arp_announce
sysctl -p
chmod 777 /etc/init.d/lvs.sh
/etc/init.d/lvs.sh
第二台服务器
sftp 222.90.88.10
get /etc/init.d/lvs.sh
bye
mv lvs.sh /etc/init.d/
/etc/init.d/lvs.sh

测试两个服务器测试页面写入不同内容
分别启动httpd
真是IP可以分别访问不同服务器，访问虚拟IP88，则互相伦叫

##################################

	IP隧道模式

WAN（或LAN也可）
内容服务器的容量能到100

vip-server
vi /etc/init.d/vip.sh
ifconfig tunl0 222.90.88.88 broadcast 222.90.88.88 netmask 255.255.255.255 up
route add -host 222.90.88.88 dev tunl0
ipvsadm -C
ipvsadm -A -t 222.90.88.88:80 -s rr
ipvsadm -a -t 222.90.88.88 :80 -r 222.90.88.10 -i
ipvsadm -a -t 222.90.88.88 :80 -r 222.90.88.20 -i
ipvsadm
chmod -R 777 /etc/init.d/vip.sh
/etc/init.d/vip.sh

1web服务器
ifconfig runl0 222.90.88.88 broadcast 222.90.88.88 netmask 255.255.255.255 up
route add -host 222.90.88.88 dev tunl0
echo "1" > /proc/sys/net/ipv4/conf/tunl0/arp_ignore
echo "2" > /proc/sys/net/ipv4/conf/tunl0/arp_annaunce
echo "1" > /proc/sys/net/ipv4/conf/all/arp_ignore
echo "2" > /proc/sys/net/ipv4/conf/all/arp_annaunce
sysctl -p
chmod 777 /etc/init.d/lvs.sh
/etc/init.d/lvs.sh
2web服务器
sftp 222.90.88.10
get /etc/init.d/lvs.sh
bye
mv lvs.sh /etc/init.d/
/etc/init.d/lvs.sh
测试两个服务器测试页面写入不同内容
分别启动httpd
真是IP可以分别访问不同服务器，访问虚拟IP88，则互相伦叫

##################################

	sendmail邮件服务器

配置DNS服务器为mail服务器IP解析
在配置文件中添加
IN  MX 5 mail.
mail      IN  A   192.168.1.209
重启服务service named  restart
测试
ping mail.xuesong.com
nslookup mail.xuesong.com
mail服务器上设置DNS服务器
vi /etc/resolv.conf
安装软件
sendmail-8.13.8-8.el5.i386.rpm
sendmail-cf-8.13.8-8.el5.i386.rpm
sendmail-doc-8.13.8-8.el5.i386.rpm
yum install dovecot
m4
sendmail配置文件目录：/etc/mail
vi local-host-names
添加xuesong.com
vi  sendmai.mc
去掉前面两个dnl
dnl TRUST_AUTH_MECH('EXTERNAL DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl
dnl define('confAUTH_MECHANISMS', 'EXTERNAL GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl
修改IP
DAEMON_OPTIONS('Port=smtp,Addr=192.168.1.209, Name=MTA')dnl
生成  sendmail 配置文件 sendmail.cf
m4 sendmail.mc  > sendmail.cf
查看启动级别
chkconfig --list |grep sas
开启启动级别3
chkconfig --level 3 saslauthd on
makemap hash  access.db < access
vi /etc/dovecot.conf
打开下面一句话
protocols = imap imaps pop3 pop3s
service sendmail restart
service dovecot restart
group mail
useradd -g mail -M  -s /sbin/nologin  用户名

##################################

	JDK安装

chmod 744 jdk-1_5_0_14-linux-i586.bin
./jdk-1_5_0_14-linux-i586.bin
添加环境变量
vi /etc/profile
export JAVA_HOME=/usr/local/jdk1.5.0_14
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin
. /etc/profile

##################################

	xen管理

xen安装
bois中开启虚拟化
yum -y install xen kernel-xen virt-manager
vi /etc/grub.conf
default=1  修改为:  default=0
vi /etc/selinux/config
SELINUX=enfoceing  修改为： SELINUX=disabled
shutdown -r now

查看虚拟主机列表
xm list
使用文本方式连接虚拟系统
xm console test
启动虚拟主机
xm create test
虚拟机和主机切换
ctrl+]
关闭虚拟主机
xm shutdown 主机名
虚拟机克隆(关闭后克隆)
virt-clone -o test -n test1 -f /data/xen/test1.img
虚拟机增加硬盘
dd if=/dev/zero of=/data/xen/test.img bs=1M count=8
编辑原来配置文件，添加新磁盘文件
vi /etc/xen/vm11
name = "vm11"
uuid = "91b0200b-eb41-46d3-1e11-ee2a87035f24"
maxmem = 128
memory = 128
vcpus = 1
bootloader = "/usr/bin/pygrub"
on_poweroff = "destroy"
on_reboot = "restart"
on_crash = "restart"
vfb = [ "type=vnc,vncunused=1,keymap=en-us" ]
disk = [ "tap:aio:/data/vm11.img,xvda,w", "tap:aio:/data/vm11b.img,xvdb,w"  ]
vif = [ "mac=00:16:36:75:8a:ea,bridge=virbr0,script=vif-bridge" ]
启动XEN虚拟机并登陆测试新加的磁盘
增加虚拟机网卡
cat /etc/xen/vm11
name = "vm11"
uuid = "91b0200b-eb41-46d3-1e11-ee2a87035f24"
maxmem = 512
memory = 128
vcpus = 1
bootloader = "/usr/bin/pygrub"
on_poweroff = "destroy"
on_reboot = "restart"
on_crash = "restart"
vfb = [ "type=vnc,vncunused=1,keymap=en-us" ]
disk = [ "tap:aio:/data/vm11.img,xvda,w" ]
vif = [ "mac=00:16:36:75:8a:ea,bridge=xenbr0,script=vif-bridge",
"mac=00:16:36:75:8a:eb,bridge=xenbr0,script=vif-bridge" ]

====================================================================



#!/bin/sh
#生成密码
a=`openssl passwd -1 ychd@0613`
echo root:$a >/root/.pass


#!/bin/sh
#监控脚本,每半小时执行一次
shadow_pass=`awk -F":" '$1~/root/ {print $2}' /etc/shadow`
new_pass=`awk -F":" '$1~/root/ {print $2}' /root/.pass`

if [[ $shadow_pass == $new_pass ]];then
    echo ok
else
    echo "The root password has been modified"
    /usr/sbin/chpasswd -e < /root/.pass
fi

#对monitor脚本进行加密
#安装shc
wget http://www.datsi.fi.upm.es/~frosal/sources/shc-3.8.6.tgz
tar xzvfp shc-3.8.6.tgz
cd shc-3.8.6
mkdir /usr/local/man/man1/
make test  (如报错可跳过)
make strings
make install


shc -r -f .monitor.sh
生成两个文件
.monitor.sh.x
.monitor.sh.x.c
./.monitor.sh.x  等同于执行 ./.monitor.sh (注意无法sh .monitor.sh.x执行)

#-----------------------------------------------------------------------------------------------------------------------------
关闭Ubuntu服务器远程登陆后的信息
sudo vi /etc/pam.d/sshd

#注释下面的行,关闭信息显示
session    optional     pam_motd.so  motd=/run/motd.dynamic noupdate
#注释下面的行,关闭邮件显示
session    optional     pam_mail.so standard noenv # [1]

#-----------------------------------------------------------------------------------------------------------------------------
字符串加密
echo qingdao0613 | base64 -i
cWluZ2RhbzA2MTMK
字符串解密
echo "cWluZ2RhbzA2MTMK" | base64 -d | sudo -S vi /etc/network/interfaces


#-----------------------------------------------------------------------------------------------------------------------------

ubuntu系统修改DNS /etc/resolv.conf重启后消失
解决：
echo "nameserver 114.114.114.114" >> /etc/resolvconf/resolv.conf.d/tail
sudo resolvconf -u
此时/etc/resolv.conf也有了,重启后也不会消失

#-----------------------------------------------------------------------------------------------------------------------------
python 解决无法import MySQLdb的问题

sudo apt-get install python-pip
sudo apt-get install python-devel
sudo apt-get install python2.7-devel
sudo pip install MySQL-python

#-----------------------------------------------------------------------------------------------------------------------------
Ubuntu ulimit.conf的Bug 最大连接数对root用户的不生效

vi /etc/security/limits.conf
* soft nofile 65535
* hard nofile 65535
root soft nofile 65535
root hard nofile 65535

root用户需要单独指出来,重启生效


