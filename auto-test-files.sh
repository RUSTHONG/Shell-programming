#! /bin/zsh
#auto test files
#by author hongyuan 2018

files=./test.txt

if [ ! -f $files ];then
	echo "OK" >> $files
else
	echo -e "\033[32m----------------\033[1m"
	cat $files
fi 
