# restreamer

#### Build the nginx image:
```sh
$ docker build -t restreamer:latest .
```

#### Run nginx binding rtmp (1935) and http (80) ports to your host:
```sh
$ docker run -d -p 80:80 -p 1935:1935 restreamer:latest
```

#### Start your rmtp stream to nginx with FFmpeg:
```sh
$ ffmpeg -re -i https://live.impresa.pt/live/sic/sic540p.m3u8 -vcodec copy -loop -1 -c:a aac -b:a 160k -ar 44100 -strict -2 -f flv rtmp://127.0.0.1/live/sic
```

#### On your client (for instance VLC) open the streams:
```sh
HLS: http://127.0.0.1/hls/sic.m3u8
```
```sh
RTMP: rtmp://127.0.0.1/live/sic
```
