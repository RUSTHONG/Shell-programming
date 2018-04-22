#!/bin/zsh
#judge dir exist
dir=./mylove
if [ ! -d $dir ];then
	mkdir -p $dir
	echo -e "\033[32mThis $dir created success!\033[0m"
else
	echo -e "\033[32mThis dir is already existing.\033[0m"
fi
