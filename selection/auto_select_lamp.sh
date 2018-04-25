#!/bin/zsh

PS3="Select your will exec Menu:"
select i in "Apache-install" "Mysql-install" "PHP-install"
do
case $i in 
Apache-install)
	echo "wait install httpd server..."
	#tar -jxvf httpd-2.2.27.tar.bz2 ;cd httpd-2.2.27
	;;
Mysql-install)
	echo "wait install Mysql server..."
	;;
PHP-install)
	echo "wait install PHP server..."
	;;
*)
	echo -e "\033[32mUsage: {$0 Apache|Mysql|PHP|help}\033[0m"
esac
done
