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




#OPENREC=$(grep "openrec" ./config/"$1".txt|grep -v https://www.openrec.tv/user/|cut -c 29-)



if [ ! -d "${SAVEFOLDER}" ]; then
  mkdir ${SAVEFOLDER}
fi

#youtube

if [[ -n "$YOUTUBE" ]]; then  
[[ ! -d "${SAVEFOLDER}youtube/" ]]&&mkdir ${SAVEFOLDER}youtube/ 
sleep 1
./record_youtube.sh $YOUTUBE $FORMAT $LOOP $INTERVAL ${SAVEFOLDER}youtube/ $1 &
sleep 5
fi

#bil    
if [[ -n "$BIL" ]]; then
[[ ! -d "${SAVEFOLDER}bil/" ]]&&mkdir ${SAVEFOLDER}bil/
sleep 1
./record_bil.sh $BIL $FORMAT $LOOP $INTERVAL ${SAVEFOLDER}bil/ $1 &
sleep 5
fi

#twitch twitch_id [format] [loop|once] [interval] [savefolder]
if [[ -n "$TWITCH" ]]; then
[[ ! -d "${SAVEFOLDER}twitch/" ]]&&mkdir ${SAVEFOLDER}twitch/
sleep 1
./record_twitch.sh $TWITCH $FORMAT $LOOP $INTERVAL ${SAVEFOLDER}twitch/ $1 &
sleep 5
fi
#TWITCAST
if [[ -n "$TWITCAST" ]]; then
[[ ! -d "${SAVEFOLDER}twitcast/" ]]&&mkdir ${SAVEFOLDER}twitcast/
sleep 1
[[ ! -d "${SAVEFOLDER}twitcast/livedl" ]]&&cp ./livedl ${SAVEFOLDER}twitcast/
sleep 5
./record_twitcast.sh $TWITCAST  $LOOP $INTERVAL ${SAVEFOLDER}twitcast/ $1 &
sleep 3
fi
#OPENREC
#./record_openrec.sh $OPENRCE $FORAMT $LOOP $INTERVAL ${SAVEFOLDER}&
wait



