#!/usr/bin/env bash
#cd /home/centos/Recorder/config
#ls|grep .txt|sed 's/.txt//g'
for ((NUM=$(ls /home/centos/Recorder/config|grep -c .txt); NUM>0; --NUM)) 
do
NAME=$(ls /home/centos/Recorder/config|grep .txt|sed 's/.txt//g'|sed -n "$NUM"p)
sleep 1
screen -L -t $NAME -dmS $NAME /home/centos/Recorder/index.sh $NAME
sleep 1
echo $NAME
done
