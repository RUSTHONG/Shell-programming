#!/bin/bash
#auto get system info

ip_info=`ifconfig ens33|grep "inet"|awk '{print $2}'|cut -d: -f 2`
cpu_info1=`cat /proc/cpuinfo|grep "model name"|tail -1|awk -F: '{print $2}'|sed 's/^//g'|awk '{print $1,$2,$3,$4,$NF}'`
