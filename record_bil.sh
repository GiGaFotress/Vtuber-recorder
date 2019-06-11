#!/bin/bash
# Bil
#$BIL $FORMAT $3 $INTERVAL $SAVEFOLDER&
BILPID="$$"
echo "$6:BIL   $BILPID" >> "./running.txt"
INTERVAL="${4:-130}"

while true; do
  # Monitor live streams of specific channel
  while true; do
    LOG_PREFIX=$(date +"[%Y-%m-%d %H:%M:%S]")
    echo "$LOG_PREFIX Try to get current live stream of $1"

    # Get the m3u8 or flv address with streamlink
	#curl -s "https://api.live.bilibili.com/room/v1/Room/get_info?room_id=$1&from=room"|grep -q '\"live_status\"\:1'&& break
	wget -q -O-  "https://api.live.bilibili.com/room/v1/Room/get_info?room_id=$1&from=room"|grep -q '\"live_status\"\:1'&& break
    echo "$LOG_PREFIX The stream is not available now."
    echo "$LOG_PREFIX Retry after $INTERVAL seconds..."
    sleep $INTERVAL
  done

    
    #Savetitle
	ID=$(you-get -i https://live.bilibili.com/$1|sed -n '2p'|cut -c 22-|cut -d '.' -f 1|sed 's/[()/\\!-\$]//g')
  # Record using MPEG-2 TS format to avoid broken file caused by interruption
  FNAME="bil_$1_${ID}_$(date +"%Y%m%d_%H%M%S").ts"
  echo "$LOG_PREFIX Start recording, stream saved to \"$FNAME\"."
  echo "$LOG_PREFIX Use command \"tail -f $FNAME.log\" to track recording progress."

  # Start recording
  M3U8_URL=$(streamlink --stream-url "https://live.bilibili.com/$1" "best")
   ffmpeg  -i "$M3U8_URL" -codec copy   -f hls -hls_time 3600 -hls_list_size 0 "$5$FNAME" > "${5}log/${FNAME}.log" 2>&1

  # Exit if we just need to record current stream
  LOG_PREFIX=$(date +"[%Y-%m-%d %H:%M:%S]")
  echo "$LOG_PREFIX Live stream recording stopped."
  [[ "$3" == "once" ]] && break
done
