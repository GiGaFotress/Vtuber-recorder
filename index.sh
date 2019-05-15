#!/bin/bash
#vtuber whole live recorder

if [[ ! -n "$1" ]]; then
  echo "usage: $0 [name] [format]  "
  exit 1
fi

FORMAT="${2:-best}"
INTERVAL="${4:-15}"
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

#stop recorder
trap 'onCtrlC' INT
function onCtrlC () {
    echo 'stop recording'
    PID1=$(grep $NAME running.txt|awk '{print $2}'|sed -n '1p')
    PID2=$(grep $NAME running.txt|awk '{print $2}'|sed -n '2p')
    PID3=$(grep $NAME running.txt|awk '{print $2}'|sed -n '3p')
    PID4=$(grep $NAME running.txt|awk '{print $2}'|sed -n '4p')
    [[ -n "$PID1" ]] && kill -s 9 $PID1;
    [[ -n "$PID2" ]] && kill -s 9 $PID2;
    [[ -n "$PID3" ]] && kill -s 9 $PID3;
    [[ -n "$PID4" ]] && kill -s 9 $PID4;
    CLEANPID1=$(grep $PID1 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID1/"d running.txt;
    CLEANPID2=$(grep $PID2 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID2/"d running.txt;
    CLEANPID3=$(grep $PID3 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID3/"d running.txt;
    CLEANPID4=$(grep $PID4 running.txt|sed -n '1p') && sed  -i "/^$CLEANPID4/"d running.txt;
}


wait



