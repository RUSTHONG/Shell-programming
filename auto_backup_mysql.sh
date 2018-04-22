#!/bin/zsh
#auto backup mysql
#by author hongyuan 2018
#define path

BAKDIR=/home/hongyuan/data/backup/`date +%Y%mmZd`
MYSQLDB=discuz
MYSQLPW=hy123456
MYSQLUSR=root
MYSQLCMD=/usr/bin/mysqldump
#must use root user run scripts
if [ $UID -ne 0 ];then
	echo  "This script must use the root user!!!"
	sleep 2
	exit 0
fi
#Define DIR and mkdir DIR
if [ ! -d $BAKDIR ];then
	mkdir -p $BAKDIR
	echo -e "\033[32mThe $BAKDIR created successfully!\033[0m"
else
	echo "This $BAKDIR is existing"
fi
# MYSQL BACKUP COMMAND
$MYSQLCMD -u$MYSQLUSR -p$MYSQLPW -d $MYSQLDB >$BAKDIR/$MYSQLDB.sql

if [ $? -eq 0 ];then
	echo -e "\033[32mThe Mysql Backup $MYSQLDB successfully!\033[0m"
else
	echo -e "\033[32mThe Mysql Backup $MYSQLDB failed,please check!\033[0m"
fi

