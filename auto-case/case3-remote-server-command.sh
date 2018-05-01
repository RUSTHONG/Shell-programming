#!/bin/bash
#Auto change Server Files
#批量远程服务器执行命令
if [ ! -f ip.txt ];then
	echo -e "\033[31mPlease Create ip.txt Files, The ip.txt contents as follows: \033[0m"
	cat <<EOF
192.168.149.128
192.168.149.129
EOF
	exit
fi
 
if 
	[ -z "$*" ];then
	echo -e "\033[31mUsage: $0 Command, Example {rm /tmp/test.txt | mkdir /tmp/20140228} \033[0m"
	exit
fi

	count=`cat ip.txt |wc -l`
	rm -rf ip.txt.swp
	i=0
while ((i< $count))
do
	i=`expr $i + 1`
	sed "${i}s/^/&${i} /g" ip.txt >>ip.txt.swp
	IP=`awk -v I="$i" '{if(I==$1)print $2}' ip.txt.swp`
	ssh -q -l root $IP "$*;echo -e '---------------------------\nThe $IP Exec Command : $* success !';sleep 2"
done

