#!/bin/bash 
diskleft=$(df / |sed -n '2p'|awk '{print $5}'|cut -f 1 -d '%')
if
((diskleft > 70));
then
flock -xn /tmp/test3.lock -c "/home/centos/Vtuber-recorder/del3h.sh" > "/home/centos/Vtuber-recorder/log/WarnDisk70$(date +"[%Y-%m-%d %H:%M:%S]").log" 2>&1
else
echo "nothing"
fi 
