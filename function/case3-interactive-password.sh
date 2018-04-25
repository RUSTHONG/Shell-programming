#!/bin/bash
function password(){
	read -p "Please type in your password: " pwd
	if [ $pwd -eq "123456" ];then
		echo -e "\033[32mPass\033[0m"
	else
		echo "Please try again"
		exit
	fi
}

password
