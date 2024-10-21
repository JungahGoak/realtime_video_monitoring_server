# realtime_video_monitoring_server

### hls monitoring

```
ffmpeg -f avfoundation -framerate 30 -video_size 1280x720 -i "0" \
       -c:v libx264 -preset veryfast -tune zerolatency -f flv \
        rtmp://<your-server-ip>/front/stream
```


### WebRTC montoring
```
ffmpeg -f avfoundation -framerate 30 -video_size 1280x720 -i "0" \
       -c:v libvpx -b:v 1M -c:a libopus -f rtp\
       rtp://<your-server-ip>:5004/stream1
```
