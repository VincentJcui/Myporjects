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

硬件资源：
    获取内存大小： racadm get BIOS.memSettings.SysMemSize
    获取内存工作速率： racadm get BIOS.MemSettings.SysMemSpeed
    获取内存类型： racadm get BIOS.MemSettings.SysMemType

BIOS相关：
    错误提示状态：racadm get BIOS.MiscSettings.ErrPrompt
    关闭错误提示： racadm set BIOS.MiscSettings.ErrPrompt Disabled
    BIOS启动模式： racadm get BIOS.BiosBootSettings.BootMode（默认BIOS,另有UEFI）
    系统启动顺序： racadm get BIOS.BiosBootSettings.BootSeq
    更改系统启动顺序：racadm set BIOS.BiosBootSettings.BootSeq NIC.Integrated.1-1-1,HardDisk.List.1-1,Optical.SATAEmbedded.E-1
    提交BIOS objects job：jobqueue create BIOS.Setup.1-1
    获取sn： racadm get BIOS.SysInformation.SystemServiceTag
    获取型号： racadm get BIOS.SysInformation. SystemModelName
    获取bios版本： racadm get BIOS.SysInformation. SystemBiosVersion

网卡相关：
    获取网卡mac： racadm getsysinfo -s ( racadm nicstatistics | racadm racdump )
    获取网卡3是否开启pxe：racadm get nic.NICConfig.3.LegacyBootProto
    启用网卡pxe： racadm set nic.NICConfig.3.LegacyBootProto PXE
    PXE配置应用生效： racadm jobqueue create NIC.Integrated.1-3-1
    提交NIC objects job：racadm jobqueue create NIC.Integrated.1-1 -r pwrcycle -s TIME_NOW -e 20120501100000

磁盘相关：
    获取物理磁盘： racadm storage get pdisks
    获取虚拟磁盘信息： storage get vdisks -o ［ -p status,size,layout,state ］

raid相关：
    获取raid控制器： racadm storage get controllers
    获取raid控制器属性name、status： racadm storage get controllers -o -p name,status
    删除所有raid： racadm storage resetconfig:RAID.Integrated.1-1
    提交storage作业： racadm jobqueue create RAID.Integrated.1-1 -s TIME_NOW -r none （ forced | pwrcycle | graceful） ［ -—realtime ］
    创建raid5，分配300G做系统： racadm storage createvd:RAID.Integrated.1-1 -rl r5 -size 300g -pdkey:Disk.Bay.0:Enclosure.Internal.0-1:RAID.Integrated.1-1,Disk.Bay.1:Enclosure.Internal.0-1:RAID.Integrated.1-1,Disk.Bay.2:Enclosure.Internal.0-1:RAID.Integrated.1-1
    创建raid5： racadm storage createvd:RAID.Integrated.1-1 -rl r5 -pdkey:Disk.Bay.0:Enclosure.Internal.0-1:RAID.Integrated.1-1,Disk.Bay.1:Enclosure.Internal.0-1:RAID.Integrated.1-1,Disk.Bay.2:Enclosure.Internal.0-1:RAID.Integrated.1-1

用户相关：
    注：数字2、15为用户ID。
    查看用户信息：racadm get idrac.users.2
    添加用户：racadm set idrac.users.15.username chenss
    设置密码：racadm set idrac.users.15.password wuyancs
    设置为idrac管理员：racadm set idrac.users.15.Privilege 0x1ff
    启用用户：racadm set idrac.users.15.enable enabled

IP相关：
    获取idrac ip info： racadm get iDRAC.IPv4[ Address | Static | Gateway ]

日志相关：
    获取前置面板LCD显示信息：racadm get System.LCD.CurrentDisplay

系统相关：
    开机： racadm serveraction powerup
    关机： racadm serveraction powerdown
    重启： racadm serveraction powercycle
    状态： racadm serveraction powerstatus
    获取idrac snap info：racadm get iDRAC.SNMP

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