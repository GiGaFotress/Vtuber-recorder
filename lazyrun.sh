#!/usr/bin/env bash
#cd /home/centos/Vtuber-recorder/config
#ls|grep .txt|sed 's/.txt//g'
for ((NUM=$(ls /home/centos/Vtuber-recorder/config|grep -c .txt); NUM>0; --NUM)) 
do
NAME=$(ls /home/centos/Vtuber-recorder/config|grep .txt|sed 's/.txt//g'|sed -n "$NUM"p)
sleep 1
screen -L -t $NAME -dmS $NAME /home/centos/Vtuber-recorder/index.sh $NAME
sleep 1
echo $NAME
done
