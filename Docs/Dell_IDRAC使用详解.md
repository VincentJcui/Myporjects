首先需要给服务器配置idrac的管理IP地址,图形界面可操作,亦可命令行远程操作,目的是可以轻松实现远程服务器访问,配置,部署,监控,后续维护等操作

1.iDRAC默认本地用户“root”的密码为“calvin”.

2.iDRAC企业版可以实现批量对多台服务器的远程管理及监控.

racadm可以通过telnet,ssh,client端三种方式实现控制,推荐使用client端,方便批量部署操作.

常用命令如下:
1、racadm查看service tag编号：
sudo racadm -r IP地址 -u root -p calvin getsvctag

2、racadm查看bios里CPU的设置
sudo racadm -r IP地址 -u root -p calvin get bios.sysprofilesettings

3、racadm查看网卡引导模式设置
sudo racadm -r IP地址 -u root -p calvin get nic.nicconfig.1

4.racadm下载配置，本地修改，修改完提交上去
sudo racadm -r IP地址 -u root -p calvin get –t xml –f bios.xml
sudo racadm -r IP地址 -u root -p calvin set –t xml –f bios.xml

5.获取dell服务器板载网卡的mac地址
ipmitool -I lan -H IP地址 -U root -P calvin delloem mac list

6.如果要修改远程机器的 idrac 的信息，加 -r 参数指定 ip:https_port:
racadm -r ip:https_port -u root -p calvin config -g cfgLanNetworking -o cfgNicGateway 192.168.1.1

7.修改远程的IP信息
racadm setniccfg -s 192.168.1.2 255.255.255.0 192.168.1.1

8.获取并更新RAC的信息
racadm getconfig -f rac.cfg      获取
racadm config -f rac.cfg         修改后更新

9.修改user/password 的方法
racadm -r ip -u root -p calvin config -g cfgUserAdmin -o cfgUserAdminUserName op -i 2
racadm -r ip -u op -p calvin  config -g cfgUserAdmin -o cfgUserAdminPassword op123  -i 2

10.设置通过pxe来启动服务器
racadm config -g cfgServerInfo -o cfgServerBootOnce 1
racadm config -g cfgServerInfo -o cfgServerFirstBootDevice PXE
racadm serveraction powercycle

其他常用
# racadm racresetcfg       重设idrac卡
# racadm serveraction [powerdown|powerup|powercycle]    开机,关机,重启
# racadm getsel            查看event log
# racadm clear             清除event log
# racadm getniccfg         获取远程的IP信息
# racadm getconfig -g cfgLanNetworking   获取远程idrac卡的的IP信息
# racadm config -g cfgLanNetworking -o cfgNicEnable 1                       开启网卡
# racadm config -g cfgLanNetworking -o cfgNicIpAddress 192.168.1.2          设置IP地址
# racadm config -g cfgLanNetworking -o cfgNicNetmask 255.255.255.0          设置子网掩码
# racadm config -g cfgLanNetworking -o cfgNicGateway 192.168.1.1            设置网关地址
# racadm config -g cfgLanNetworking -o cfgNicUseDhcp 0                      是否使用dhcp


#具体要查找哪项内容,可以时间将rac.cfg导出,针对里面的内容作相应的修改即可


ipmitool命令:
1.配置服务器重启
ipmitool -I lanplus -H IP地址 -U root -P calvin chassis power reset