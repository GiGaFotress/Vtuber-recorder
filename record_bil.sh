#!/bin/bash
# Bil
#$BIL $FORMAT $3 $INTERVAL $SAVEFOLDER&
INTERVAL="${4:-130}"

while true; do
  # Monitor live streams of specific channel
  while true; do
    LOG_PREFIX=$(date +"[%Y-%m-%d %H:%M:%S]")
    echo "$LOG_PREFIX Try to get current live stream of $1"

    # Get the m3u8 or flv address with streamlink
    STREAM_URL=$(streamlink --stream-url "https://live.bilibili.com/$1" "best")
    (echo "$STREAM_URL" | grep -q ".m3u8") && break
    (echo "$STREAM_URL" | grep -q ".flv") && break

    echo "$LOG_PREFIX The stream is not available now."
    echo "$LOG_PREFIX Retry after $INTERVAL seconds..."
    sleep $INTERVAL
  done

    
    #Savetitle
	ID=$(you-get -i https://live.bilibili.com/$1|sed -n '2p'|cut -c 22-|cut -d '.' -f 1)
  # Record using MPEG-2 TS format to avoid broken file caused by interruption
  FNAME="bil_$1_${ID}_$(date +"%Y%m%d_%H%M%S").ts"
  echo "$LOG_PREFIX Start recording, stream saved to \"$FNAME\"."
  echo "$LOG_PREFIX Use command \"tail -f $FNAME.log\" to track recording progress."

  # Start recording
  biliroku -n $1 -o "$3$FNAME"  > "$3$FNAME.log" 2>&1

  # Exit if we just need to record current stream
  LOG_PREFIX=$(date +"[%Y-%m-%d %H:%M:%S]")
  echo "$LOG_PREFIX Live stream recording stopped."
  [[ "$3" == "once" ]] && break
done
