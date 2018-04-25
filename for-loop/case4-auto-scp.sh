#!/bin/zsh
Files=$*
if [ -z $* ];then
	echo -e "\033[32m\Usage: {$0 /bootl/tmpl/tmp/test.txt}\033m[0m"
for i in `echo 182.92.188.163 127.0.0.1`  
do
	scp -r $Files root@$i:/root/
done
