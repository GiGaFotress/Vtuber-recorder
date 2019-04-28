#!/usr/bin/env bash
#cd /home/centos/Recorder/config
#ls|grep .txt|sed 's/.txt//g'
for ((NUM=$(ls /home/centos/Recorder/config|grep -c .txt); NUM>0; --NUM)) 
do
VTBNAME=$(ls /home/centos/Recorder/config|grep .txt|sed 's/.txt//g'|sed -n "$NUM"p)
sleep 3
screen -S $VTBNAME /home/centos/Recorder/index.sh $VTBNAME
sleep 3
screen -d $VTBNAME
done
