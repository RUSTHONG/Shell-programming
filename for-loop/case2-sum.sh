#!/bin/zsh
#案例二，求和1-100的值
j=0
for ((i=1;i<=100;i++))
	do
		j=`expr $i + $j`
	done
echo $j
