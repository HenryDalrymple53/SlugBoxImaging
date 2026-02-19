#!/bin/bash
while true;
do
    gst-launch-1.0 libcamerasrc ! video/x-raw,width=4608,height=2592 ! videoconvert ! x264enc bitrate=50000 tune=zerolatency ! h264parse config-interval=1 ! mpegtsmux ! filesink location=video.ts
    sleep 1
    wait
done
