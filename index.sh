#!/bin/bash
#vtuber whole live recorder

if [[ ! -n "$1" ]]; then
  echo "usage: $0 [name] [format] [interval]"
  exit 1
fi

$youtube=grep "youtube.com" "$1".txt
$bil=grep "bilibili.com" "$1".txt|egrep -o "[0-9]{2,}+"
$twitch=grep "twitch.com" "$1".txt
$twitcast=grep "twitcast" "$1".txt|grep -v https://twitcasting.tv/|cut -com 24-
$openrec=grep "openrec" "$1".txt

#youtube
streamlink $1 
#
#wait退出5-9轮询
#或者同时检测


echo "https://twitcasting.tv/merrysan_cas_?"|grep "twitcast" |cut -c 24-




