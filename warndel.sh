#!/bin/bash 
diskleft=$(df / |sed -n '2p'|awk '{print $5}'|cut -f 1 -d '%')
if
((diskleft > 85));
then
echo "warn low disk space"
flock -xn /tmp/test3.lock -c "/home/centos/del3h.sh" > "/home/centos/log/WarnDisk$(date +"[%Y-%m-%d %H:%M:%S]").log" 2>&1
else
echo "this is ok"
fi 
