#!/bin/zsh
#案例三，找到相关log，然后批量打包
for i in `find . -maxdepth 1 -name "*.sh"|tail -2`
do
	tar -czf 2014log.tgz $i
done
