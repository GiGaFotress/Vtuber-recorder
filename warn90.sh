#!/bin/bash 
diskleft=$(df / |sed -n '2p'|awk '{print $5}'|cut -f 1 -d '%')
if
((diskleft > 90));
then
flock -xn /tmp/test4.lock -c "/home/centos/Vtuber-recorder/delbil.sh" > "/home/centos/Vtuber-recorder/log/WarnDisk90$(date +"[%Y-%m-%d %H:%M:%S]").log" 2>&1
else
echo "nothing"
fi 