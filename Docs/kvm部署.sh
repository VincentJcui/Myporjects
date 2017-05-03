#!/usr/bin/env bash
kvm虚拟机部署及创建

1.首先物理机需开启虚拟化VT
egrep '(vmx|svm)' --color=always /proc/cpuinfo  系统中检查是否支持kvm虚拟化,输出内容部位空则表示支持

2.yum安装kvm相关插件
yum install -y kvm kmod-kvm kvm-qemu-img libvirt Python-virtinst virt-manager virt-viewer bridge-utils

3.重启reboot

4.lsmod|grep kvm  如有如下显示,则表示安装完成
kvm_intel              50380  4
kvm                   305081  1 kvm_intel

5.kvm默认使用NAT模式为虚拟机提供网络,以桥接模式配置虚拟机网络

vi /etc/sysconfig/network-scripts/ifcfg-br0

DEVICE=br0
BOOTPROTO=static
BROADCAST=192.168.77.255
IPADDR=192.168.77.89
NETMASK=255.255.255.0
NETWORK=192.168.77.0
ONBOOT=yes
NETWORKING_IPV6=no
GATEWAY=192.168.77.254
TYPE=Bridge
DNS1=210.42.35.35
DNS2=8.8.8.8

vi /etc/sysconfig/network

NETWORKING=yes
HOSTNAME=centoskvm
NETWORKING_IPV6=no
GATEWAY=192.168.77.254

vi /etc/resolv.conf

nameserver 210.42.35.35
nameserver 8.8.8.8

vi /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE=eth0
#BOOTPROTO=static
#BROADCAST=192.168.110.255
HWADDR=78:84:3C:B7:F9:7E
#IPADDR=192.168.77.89
#NETMASK=255.255.255.0
#NETWORK=192.168.77.0
ONBOOT=yes
#GATEWAY=192.168.77.254
#TYPE=Ethernet
BRIDGE=br0

/etc/init.d/network restart

6.查看桥接的配置情况
brctl show

7.创建虚拟机

8.参考文档: http://www.server110.com/kvm/201403/8321.html

#-----------------------------------------------------------------------
#参考文档:
xml 配置文件存放位置:  /etc/libvirt/qemu

http://blog.csdn.net/chdhust/article/details/7931717
9.KVM常用命令操作

virsh  --help
virsh list --all --title            #列出所有客户端
virsh edit fps1.esj                 #编辑fps1.esj这个虚拟机的xml配置文件
virsh start  fps1.esj               #启动fps1.esj这台虚拟机
virsh shutdown  fps1.esj            #停止fps1.esj这台虚拟机
virsh setmem --size 12G  fps1.esj   #将fps1.esj这台虚拟机的内存动态调整为12G
virsh setvcpus fps1.esj 6 --live    #将fps1.esj这台虚拟机的vcpu动态调整为6核
virsh vcpuinfo fps1.esj             #查看fps1.esj这台虚拟机的cpu信息
virsh destroy fps1.esj              #强制将fps1.esj客户端停止
virsh dominfo fps1.esj              #显示fps1.esj客户端的信息
virsh domstate fps1.esj             #显示fps1.esj的客户端运行状态
virsh suspend   fps1.esj            #将fps1.esj挂起,但仍占用资源
virsh resume  fps1.esj              #将fps1.esj恢复挂起
virt-viewer -c qemu:///system fps1.esj     #启动图形界面对fps1.esj
virsh autostart fps1.esj            #设置fps1.esj虚拟机随系统启动
virsh autostart --disable fps1.esj  #设置关闭随系统启动
virt-clone -o fps30.esj -n fps31.esj -f /data/images/fps31.esj.img     #kvm克隆虚拟机

virsh dumpxml i-2-5-VM > i-2-5-VM.xml   #将虚拟机的配置生成xml配置文件
virsh define i-2-5-VM.xml    #配置xml配置文件后,使用define初始化虚拟机


#通过配置文件启动虚拟机
virsh create /etc/libvirt/qemu/wintest01.xml

#删除虚拟机,该命令只是删除wintest01的配置文件，并不删除虚拟磁盘文件
virsh undefine wintest01

#重新定义虚拟机
virsh define /etc/libvirt/qemu/wintest01.xml

#克隆测试机需要修改的数据
/opt/fps/www/client/game_page.html   修改为本机的IP地址

#新建虚拟机
virt-install -n fps34.esj -r 4096 --vcpus 8,maxvcpus=12 --description=Ubuntu14.03 -c /opt/iso/ubuntu-14.04.3-server-amd64.iso --disk path=/data/images/fps34.esj.img,size=40,bus=virtio,sparse=true --network bridge=br0 --os-type=linux --autostart --graphics vnc


