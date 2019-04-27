#!/bin/bash
#vtuber whole live recorder

if [[ ! -n "$1" ]]; then
  echo "usage: $0 [name] [format]  "
  exit 1
fi

FORMAT="${2:-best}"
INTERVAL="${4:-150}"
SAVEFOLDER=$(grep "Savefolder" ./config/"$1".txt|cut -c 12-)
INTERVAL=$(grep "Checktime" ./config/"$1".txt|cut -c 11-)
LOOP=$(grep "LoopOrOnce" ./config/"$1".txt|cut -c 12-)
YOUTUBE=$(grep "youtube.com" ./config/"$1".txt|cut -c 33-)
BIL=$(grep "bilibili.com" ./config/"$1".txt|egrep -o "[0-9]{2,}+")
TWITCH=$(grep "twitch.tv" ./config/"$1".txt|cut -c 23-)
TWITCAST=$(grep "twitcast" ./config/"$1".txt|cut -c 24-)
YOUTUBESAVE=$(youtube/)
BILSAVE=$(bil/)
TWITCHSAVE=$(twitch/)
TWITCASTSAVE=$(twitchcast/)



#OPENREC=$(grep "openrec" ./config/"$1".txt|grep -v https://www.openrec.tv/user/|cut -c 29-)



if [ ! -d "$SAVEFOLDER" ]; then
  mkdir $SAVEFOLDER
fi

#youtube
if [ ! -d "$SAVEFOLDER$YOUTUBESAVE" ]; then
  mkdir $SAVEFOLDER$YOUTUBESAVE
fi
[[ -n "$YOUTUBE" ]] && ./record_youtube.sh $YOUTUBE $FORMAT $LOOP $INTERVAL $SAVEFOLDER $1 &
sleep 10
#bil    
if [ ! -d "$SAVEFOLDER$BILSAVE" ]; then
  mkdir $SAVEFOLDER$BILSAV
fi
[[ -n "$BIL" ]] && ./record_bil.sh $BIL $FORMAT $LOOP $INTERVAL $SAVEFOLDER$BILSAVE $1 &
sleep 10
#twitch twitch_id [format] [loop|once] [interval] [savefolder]
if [ ! -d "$SAVEFOLDER$TWITCHSAVE" ]; then
  mkdir $SAVEFOLDER$TWITCHSAVE
fi
[[ -n "$TWITCH" ]] && ./record_twitch.sh $TWITCH $FORMAT $LOOP $INTERVAL $SAVEFOLDER$TWITCHSAVE $1 &
sleep 10
#TWITCAST
if [ ! -d "$SAVEFOLDER$TWITCASTSAVE" ]; then
  mkdir $SAVEFOLDER$TWITCASTSAVE
fi
if [ ! -d "$SAVEFOLDER/livedl" ]; then
  cp ./livedl $SAVEFOLDER$TWITCASTSAVE
fi
[[ -n "$TWITCAST" ]] && ./record_twitcast.sh $TWITCAST  $LOOP $INTERVAL $SAVEFOLDER$TWITCASTSAVE $1 &
#OPENREC
#./record_openrec.sh $OPENRCE $FORAMT $LOOP $INTERVAL $SAVEFOLDER&
wait



