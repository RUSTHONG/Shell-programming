#!/bin/bash
#auto get system info
#收集服务器的硬件信息

#查看ip地址
ip_info=`ifconfig wlp3s0|grep "inet"|awk '{print $2}'|cut -d: -f 2`

#查看cpu的配置
cpu_info1=`cat /proc/cpuinfo|grep "model name"|tail -1|awk -F: '{print $2}'|sed 's/^//g'|awk '{print $1,$2,$3,$4,$NF}'`

#查看cpu的颗数
cpu_info2=`cat /proc/cpuinfo|grep "physical id"|sort|uniq -c|wc -l`
serv_info=`hostname|tail -1`

#打印磁盘信息
disk_info=`sudo fdisk -l |grep -w "Disk"|grep -v "identifier"|awk '{print $2,$3,$4}'|sed 's/,//g'`

#打印内存
mem_info=`free -m|grep "Mem"|awk '{print "Total",$1,$2"M"}'`

#查询负载
load_info=`uptime|awk '{print "Current Load: "$(NF-2)}'|sed 's/\,//g'`

mark_info='Nanjing NJMU'

echo -e "\033[32m----------------------------------------------\033[1m"
echo "IPADDR,HOSTNAME,CPU_INFO,DISK_INFO,MEM_INFO,LOAD_INFO" >>1.csv
echo "IPADDR:${ip_info},HOSTNAME:${serv_info},CPU_INFO:${cpu_info1} X${cpu_info2},DISK_INFO:$disk_info,MEM_INFO:$mem_info,LOAD_INFO:$load_info"
echo "${ip_info},${serv_info},${cpu_info1} X${cpu_info2},$disk_info,$mem_info,$load_info" >>1.csv
echo -e "\033[32m---------------------------------------------\033[0m"
echo -e -n "\033[36mYou want to write the data to the database? \033[1m" ;read ensure

if [ "$ensure" == "yes" -o "$ensure" == "y" -o "$ensure" == "Y" ];then
	echo "------------------------------------------"
	echo -e '\033[31mmysql -uaudit -p123456 -D audit -e ''' "insert into audit_audit_system values('', '${ip_info}','${cpu_info1} X${cpu_info2}','$disk_info', '$mem_info', '$load_info', '$mark_info')" ''' \033[0m'
fi
