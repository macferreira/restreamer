# restreamer

#### Build the nginx image of the web server:
```sh
$ docker build -t restreamer:latest .
```

#### Run nginx binding rtmp (1935) and http (80) ports to your host:
```sh
$ docker run -d -p 80:80 -p 1935:1935 restreamer:latest
```
You can also use the automated build of the web server on dockerhub: macferreira/restreamer:latest 

#### Start your rtmp stream to nginx with FFmpeg:
```sh
$ stream-encoder/bin/push-stream.sh https://live.impresa.pt/live/sic/sic540p.m3u8 rtmp://127.0.0.1/live/sic
```

#### On your client (for instance VLC) open the streams:
```sh
HLS: http://127.0.0.1/hls/sic.m3u8
```
```sh
DASH: rtmp://127.0.0.1/dash/sic.mpd
```
```sh
RTMP: rtmp://127.0.0.1/live/sic
```
