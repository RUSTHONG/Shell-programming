#磁盘报警高级脚本
#脚本分析：1.磁盘达到85%发送报警邮件;2.发送邮件命令形式;3.多个报警设置;4.把分区的信息写入文件
#特别注意：手机热点连接的电脑无法通过smtp的方式发送邮箱
#Mail -s "邮件主题" -c "抄送地址 -b "密送地址" -f 发送人邮件地址 -F 发件人姓名 < 要发送的邮件内容
#!/bin/bash
#auto monitor disk
echo -e "\033[31m\033[1m"
rm -rf list.txt
LIST=`df -h|grep "^/dev/">>list.txt`
cat<<EOF
++++++++++++++++++++++++++++++++++++++++++++++++++
+++++++++++welcome to use auto monitor++++++++++++
++++++++++++++++++++++++++++++++++++++++++++++++++
EOF
echo -e "\033[32m----------------------------------------------\033[0m"
echo 
sleep 2
while read line
do
	IP_ADDR=`ifconfig wlp3s0|grep "inet"|awk '{print $2}'|cut -d: -f 2`
	D_NAME=`echo $line|awk '{print $1, $NF"分区"}'`
	D_Total=`echo $line|awk '{print $2}'`
	D_Avail=`echo $line|awk '{print $4}'`
	D_Percent=`echo $line|awk '{print $5}'|sed 's/%//g'`
	DATE=`date`
if [ "$D_Percent" -ge 20 ];then
		cat >email.txt <<EOF
******************** Email *********************
通知类型：故障
服务：Disk Monitor
主机：$IP_ADDR
状态：警告
日期/时间：$DATE
额外信息：CRITICAL - DISK Monitor:$D_NAME Used more than ${D_Percent}%
EOF
	echo -e "\033[32mThe $D_NAME has been used for more than ${D_Percent}%, Please Check. \033[0m"
	mailx -s "$D_NAME Waring" justhongyuan@gmail.com < email.txt
	#echo "The $D_NAME has been used for more than ${D_Percent}%, Please Check."|mail -s "$D_Name Warning" justhongyuan@gmail.com
fi

done <list.txt
echo -e "\n\033[32m------------------------------------------------------------\033[1m"
echo "Done."
