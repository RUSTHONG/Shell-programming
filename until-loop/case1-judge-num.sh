#!/bin/zsh
a=10
until [[ a -lt 0 ]]
do
	echo $a
	((a--))
done
