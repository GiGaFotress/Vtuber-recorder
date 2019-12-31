#!/bin/bash
# YouTube Live Stream Recorder

if [[ ! -n "$1" ]]; then
  echo "usage: $0 live_url [format] [loop|once] [interval] [savefolder]"
  exit 1
fi


# Record the highest quality available by default
FORMAT="${2:-best}"
INTERVAL="${4:-100}"
# Construct full URL if only channel id given
LIVE_URL=$1
[[ "$1" == "http"* ]] || LIVE_URL="https://www.youtube.com/channel/$1/live"

while true; do
  # Monitor live streams of specific channel
  while true; do
    LOG_PREFIX=$(date +"[%Y-%m-%d %H:%M:%S]")
    echo "$LOG_PREFIX Checking \"$LIVE_URL\"..."

    # Try to get video id and title of current live stream.
    # Add parameters about playlist to avoid downloading
    # the full video playlist uploaded by channel accidently.

  #curl -s  https://www.youtube.com/channel/$1|grep -q "ライブ配信中" && break
 #curl -s -N https://www.youtube.com/channel/$1/live|grep -q '\\"isLive\\":true' && break
#wget -q -O- https://www.youtube.com/channel/$1/live|grep  'qualityLabel' |grep -q '\\"isLive\\":true' && break
wget -q -O- https://www.youtube.com/channel/$1/live|grep  '\\"isLive\\":true' |grep -q 'yt_live_broadcast' && break



    echo "$LOG_PREFIX The stream is not available now."
    echo "$LOG_PREFIX Retry after $INTERVAL seconds..."
    sleep $INTERVAL
  done
    METADATA=$(youtube-dl --get-id --get-title --get-description "${LIVE_URL}" 2>/dev/null)
	#Savetitle
  Title=$(echo "$METADATA" | sed -n '1p'|sed 's/[()/\\!-\$]//g')

  # Extract video id of live stream
  ID=$(echo "$METADATA" | sed -n '2p')

  # Record using MPEG-2 TS format to avoid broken file caused by interruption
  FNAME="youtube_${Title}_$(date +"%Y%m%d_%H%M%S")_${ID}.ts"
  # Also save the metadate to file
  #echo "$METADATA" > "${5}log/${FNAME}.info.txt"

  # Print logs
  echo "$LOG_PREFIX Start recording, metadata saved to \"$FNAME.info.txt\"."
  echo "$LOG_PREFIX Use command \"tail -f $FNAME.log\" to track recording progress."

  # Start recording
  # ffmpeg -i "$M3U8_URL" -codec copy -f mpegts "savevideo/$FNAME" > "savevideo/$FNAME.log" 2>&1
  
FORMATTEST=$(streamlink  https://www.youtube.com/watch?v=${ID}|grep  "1080")
 if [[ -n "$FORMATTEST" ]]; then
FORMAT=1080p
else 
FORMAT=720p
fi
echo ${FORMAT}
  # Use streamlink to record for HLS seeking support
M3U8_URL=$(streamlink --stream-url "https://www.youtube.com/watch?v=${ID}" "${FORMAT}")
  ffmpeg   -i "$M3U8_URL" -codec copy   -f hls -hls_time 3600 -hls_list_size 0 "$5$FNAME" > "${5}log/${FNAME}.log" 2>&1    

  # Exit if we just need to record current stream
  LOG_PREFIX=$(date +"[%Y-%m-%d %H:%M:%S]")
  echo "$LOG_PREFIX Live stream recording stopped."
  [[ "$3" == "once" ]] && break
done
