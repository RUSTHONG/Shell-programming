#!/bin/zsh
#形成192.168.1.1~192.168.1.10的ip
File=./iplist.txt
if [ ! -f $File ];then
	for i in `seq 10`
	do
		echo "192.168.1.$i" >> $File
	done
else
	echo -e "\033[32mThe file is existing\033[0m"
	cat $File
fi
