#!/bin/bash
#auto make install LAMP
#by authors hongyuan 2018

#Httpd define path variable
H_FILES=httpd-2.4.29.tar.bz2
H_FILES_DIR=$PWD/httpd-2.4.29
H_URL=https://mirrors.cnnic.cn/apache/httpd/
H_PREFIX=/home/rust/local/apache2
A_URL=https://archive.apache.org/dist/apr/
APR_FILES=apr-1.6.3.tar.gz
APR_UTIL_FILES=apr-util-1.6.1.tar.gz
PCRE_URL=https://ftp.pcre.org/pub/pcre/pcre-8.42.tar.gz
PCRE_FILES=pcre-8.42.tar.gz
PCRE_FILES_DIR=pcre-8.42
wget -c $H_URL/$H_FILES &&tar -jxvf $H_FILES 

wget -c $A_URL/$APR_FILES &&mkdir $H_FILES_DIR/srclib/apr ;tar -zxvf $APR_FILES -C $H_FILES_DIR/srclib/apr

wget -c $A_URL/$APR_UTIL_FILES &&mkdir $H_FILES_DIR/srclib/apr-util ;tar -zxvf $APR_UTIL_FILES -C $H_FILES_DIR/srclib/apr-util

wget -c $PCRE_URL &&tar -zxvf $PCRE_FILES &&cd $PCRE_FILES_DIR ;./configure --prefix=/home/rust/local/pcre 
if [ $? -eq 0 ];then
	make &&make install
	echo -e "\033[32mThe $PCRE_FILES has been installed successfully!\033[0m"
else
	echo -e "\033[32mFailed\033[0m"
	exit
fi

cd $H_FILES_DIR ;./configure --prefix=$H_PREFIX --with-pcre=/home/rust/local/pcre

if [ $? -eq 0 ];then
	make &&make install
	echo -e "\033[32mThe $H_FILES_DIR Server Install Successfully\033[0m"
else
	echo -e "\033[32mThe $H_FILES_DIR Server Install Failed, Please check...\033[0m"
	exit
fi
cd .. ;rm -rf *tar.*
