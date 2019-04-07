#!/bin/bash
#vtuber whole live recorder

if [[ ! -n "$1" ]]; then
  echo "usage: $0 [name] [format] [loop|once] [interval] "
  exit 1
fi

FORMAT="${2:-best}"
INTERVAL="${4:-150}"
SAVEFOLDER=$(grep "Savefolder" ./config/"$1".txt|cut -c 12-)
YOUTUBE=$(grep "youtube.com" ./config/"$1".txt)
BIL=$(grep "bilibili.com" ./config/"$1".txt|egrep -o "[0-9]{2,}+")
TWITCH=$(grep "twitch.tv" ./config/"$1".txt|cut -c 23-)
TWITCAST=$(grep "twitcast" ./config/"$1".txt|cut -c 24-)
#OPENREC=$(grep "openrec" ./config/"$1".txt|grep -v https://www.openrec.tv/user/|cut -c 29-)

if [[ ! -n "$SAVEFOLDER" ]]; then 
  echo "no output dir"
  exit 1
fi

if [ ! -d "$SAVEFOLDER" ]; then
  mkdir $SAVEFOLDER
fi

#youtube
[[ -n "$YOUTUBE" ]] && ./record_youtube.sh $YOUTUBE $FORMAT $3 $INTERVAL $SAVEFOLDER $1 &

#bil    
[[ -n "$BIL" ]] && ./record_bil.sh $BIL $FORMAT $3 $INTERVAL $SAVEFOLDER $1 &

#twitch twitch_id [format] [loop|once] [interval] [savefolder]
[[ -n "$TWITCH" ]] && ./record_twitch.sh $TWITCH $FORMAT $3 $INTERVAL $SAVEFOLDER $1 &

#TWITCAST

if [ ! -d "$SAVEFOLDER/livedl" ]; then
  cp ./livedl $SAVEFOLDER
fi
[[ -n "$TWITCAST" ]] && ./record_twitcast.sh $TWITCAST  $3 $INTERVAL $SAVEFOLDER $1 &
#OPENREC
#./record_openrec.sh $OPENRCE $FORAMT $3 $INTERVAL $SAVEFOLDER&
wait



