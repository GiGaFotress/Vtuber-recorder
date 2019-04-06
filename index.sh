#!/bin/bash
#vtuber whole live recorder

if [[ ! -n "$1" ]]; then
  echo "usage: $0 [name] [format] [loop|once] [interval] "
  exit 1
fi

FORMAT="${2:-best}"
INTERVAL="${4:-150}"
SAVEFOLDER=$(grep "Savefolder" "$1".txt|cut -c 12-)
YOUTUBE=$(grep "youtube.com" "$1".txt)
BIL=$(grep "bilibili.com" "$1".txt|egrep -o "[0-9]{2,}+")
TWITCH=$(grep "twitch.tv" "$1".txt|cut -c 23-)
TWITCAST=$(grep "twitcast" "$1".txt|cut -c 24-)
#OPENREC=$(grep "openrec" "$1".txt|grep -v https://www.openrec.tv/user/|cut -c 29-)

if [ ! -d "$Savefolder" ]; then
  mkdir $Savefolder
fi

if[[ ! -n "$Savefolder" ]]; then 
  echo"no output dir"
  exit 1
fi

#youtube
[[ -n "$YOUTUBE" ]] && ./record_youtube.sh $YOUTUBE $FORMAT $3 $INTERVAL $SAVEFOLDER &

#bil    
[[ -n "$BIL" ]] && ./record_bil.sh $BIL $FORMAT $3 $INTERVAL $SAVEFOLDER&

#twitch twitch_id [format] [loop|once] [interval] [savefolder]
[[ -n "$TWITCH" ]] && ./record_twitch.sh $TWITCH $FORMAT $3 $INTERVAL $SAVEFOLDER&

#TWITCAST录制路径仍未解决
[[ -n "$TWITCAST" ]] && ./record_twitcast.sh $TWITCAST  $3 $INTERVAL $SAVEFOLDER&
#OPENREC
#./record_openrec.sh $OPENRCE $FORAMT $3 $INTERVAL $SAVEFOLDER&
wait



