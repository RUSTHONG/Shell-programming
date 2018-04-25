#!/bin/zsh
#auto install LAMP

case $1 in 
Apache )
	echo "wait install httpd server..."
	#tar -jxvf httpd-2.2.27.tar.bz2 ;cd httpd-2.2.27
	;;
Mysql )
	echo "wait install Mysql server..."
	;;
PHP)
	echo "wait install PHP server..."
	;;
*)
	echo -e "\033[32mUsage: {$0 Apache|Mysql|PHP|help}\033[0m"
esac
