#!/usr/bin/env bash

readonly stream="$1"
readonly restreamer_web_server="$2"

if [ ! "${stream}" ]; then
  echo "ERROR: stream is not set"
  exit 1
fi

if [ ! "${restreamer_web_server}" ]; then
  echo "ERROR: restreamer_web_server is not set"
  exit 1
fi

cmd="ffmpeg -re -i ${stream} -vcodec copy -loop -1 -c:a aac -b:a 160k -ar 44100 -strict -2 -f flv ${restreamer_web_server}"

until $cmd ; do
  echo "Restarting ffmpeg command..."
  sleep 2
done
