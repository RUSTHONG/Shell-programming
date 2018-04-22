PCRE_URL=https://ftp.pcre.org/pub/pcre/pcre-8.42.tar.gz
PCRE_FILES=pcre-8.42.tar.gz
PCRE_FILES_DIR=pcre-8.42
wget -c $PCRE_URL &&tar -zxvf $PCRE_FILES &&cd $PCRE_FILES_DIR ;./configure --prefix=/home/rust/local/pcre
if [ $? -eq 0 ];then
	make &&make install
	echo -e "\033[32mCompleted\033[0m"
else 
	echo -e "\033[32mFailed\033[0m"
	exit
fi


