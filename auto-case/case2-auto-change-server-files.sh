#!/bin/zsh
#auto change server files
#SRC=/etc/
if [ ! -f ip.txt ];then
	echo -e "\033[31mPlease Create ip.txt Files, The ip.txt contents as follows: \033[0m"
cat <<EOF
192.168.149.128
192.168.149.129
EOF
	exit
fi

if 
	[ -z "$1" ];then
	echo -e "\033[31mUsage: $0 command, Example{Src_Files|Src_Dir Des_dir} \033[0m"
	exit
fi

count=`cat ip.txt |wc -l`
rm -rf ip.txt.swp
i=0
while ((i<$count))
do
	i=`expr $i + 1`
	sed "${i}s/^/&${i} /g" ip.txt >>ip.txt.swp
	IP=`awk -v I="$i" '{if(I==$1)print $2}' ip.txt.swp`
	scp -r $1 root@${IP}:$2
	#rsync -aP --delete $1 root@{IP}:$2
done
