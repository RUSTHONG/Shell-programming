#服务监控检查脚本
#脚本需求为批量或者单个检查系统服务是否启动，如果没有启动，则发送邮件告警通知
#脚本分解：
#1. 需要用到for循环，或者参数输入
#2. 系统的服务都有哪些，什么状态表示启动
#3. 没有启动的状态是什么
#4. 如何发送邮件，发送邮件的格式
#!/bin/bash
#auto monitor disk
echo -e "\033[31m \033[1m"
EMAIL=email.txt
DATE=`date`

cat << EOF
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++welcome to use auto monitor system++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
EOF
if [ -z $1 ];then
	echo -e "\033[32mUsage: { sh $0 nginx | mysql | list.txt}\033[0m"
	echo
	exit
fi
sleep 2
M_IPADDR=`ifconfig ens33|grep "Bcast"|awk '{print $2}'|cut -d: -f 2`

if [ -f "$1" -a "$1" == "list.txt" ];then
	for i in `cat list.txt|grep -v "#"`
	do
		count=`ps -ef|grep $i|grep -v grep|grep -v "email"|head -1 |wc -l`
		if [ $count -ne 1 ];then
			cat >$EMAIL <<EOF
*****************Server Monitor********************
通知类型：故障
服务：$i
主机：$M_IPADDR
状态：警告
日期/时间：$DATE
额外信息：
CRITICAL - $i Server Connection Refused,Please check.
***************************************************
EOF

		dos2unix $EMAIL
		echo -e "\033[32mThe Monitor $i Warning,Please Check. \033[0m"
		mailx -s "$M_IPADDR $i Warning" justhongyuan@gmail.com < $EMAIL >>/dev/null 2>&1
	else 
		echo -e "\033[32mThe Monitor $i Server 200 OK!\033[0m"
	fi
	echo -e "\n\033[32m-----------------------------------------------------\033[1m"
done

else 
	count=`ps -ef|grep $1|grep -v grep|grep -v "email"|head -1 |wc -l`
	if [ $count -ne 1 ];then
		cat >$EMAIL <<EOF
*****************Server Monitor********************
通知类型：故障
服务：$1
主机：$M_IPADDR
状态：警告
日期/时间：$DATE
额外信息：
CRITICAL - $1 Server Connection Refused,Please check.
***************************************************
EOF
		dos2unix $EMAIL
		echo -e "\033[32mThe Monitor $1 Warning,Please Check. \033[0m"
		mail -s "$M_IPADDR $1 Warning" justhongyuan@gmail.com < $EMAIL >>/dev/null 2>&1
	else 
		echo -e "\033[32mThe Monitor $1 Server 200 OK!\033[0m"
	fi
	echo -e "\n\033[32m-----------------------------------------------------\033[1m"
	echo "Done."
fi

