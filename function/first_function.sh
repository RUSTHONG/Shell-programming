#!/bin/zsh
a=$1
b=$2
sum (){
	((i=$a+$b))
	echo "$i"
}
sum
