#!/bin/bash 
diskleft=$(df / |sed -n '2p'|awk '{print $5}'|cut -f 1 -d '%')
if
((diskleft > 70));
then
flock -xn /tmp/test.lock -c "/home/centos/Vtuber-recorder/rcloneupload.sh" > "/home/centos/Vtuber-recorder/log/WarNrclone$(date +"[\%Y-\%m-\%d \%H:\%M:\%S]").log" 2>&1
else
echo "nothing"
fi 
