#!/bin/zsh
scores=$1
if [ -z $scores ];then
	echo "usage: {$0 60|80.}"
	exit
fi
if [[ $scores -gt 85 ]];then
	echo "very good!";
elif [[ $scores -gt 75 ]];then
	echo "good!";
elif [[ $scores -gt 60 ]];then
	echo "pass!";
else
	echo "no pass!";
fi
