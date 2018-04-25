#!/bin/zsh
#将函数、select和case方法结合的选择安装脚本

NGX_FILES=nginx-1.6.1.tar.gz
PHP_FILES=php-5.3.3.tar.gz
NGX_SRC=`echo $NGX_FILES|sed 's/\.tar\.gz//g'`
MYSQL_FILES=mysql-5.1.17.tar.gz
DWN_URL=http://nginx.org/download/

function nginx_install()
{
	wget -c ${DWN_URL}/${NGX_FILES}
	tar xzf $NGX_FILES ;cd $NGX_SRC ;./configure ;make ;make install
	if [ $? -eq 0];then
		echo "The Ngnix is installed successfully"
	fi
}

function mysql_install()
{
	tar xzf $MYSQL_FILES ;cd mysql-5.1.17 ;./configure --prefix=/usr/local/mysql ;make ;make install
}
function php_install()
{
	if [ -d /usr/local/mysql ];then
		tar xzf $PHP_FILES ;cd php-5.3.3 ;./configure --prefix=/usr/local/php5 --with-mysql=/usr/local/mysql ;make ;make install
	else
		echo "Please pre install mysql"
	fi
}
PS3="Please select your install Menu: "
select i in "Ngnix" "Mysql" "PHP"
do
	case $i in
		Ngnix )
			nginx_install ;;
		Mysql )
			mysql_install ;;
		PHP )
			php_install ;;
		* )
			echo "Usage: $0 {Ngnix | Mysql | PHP | help}"
	esac
done
