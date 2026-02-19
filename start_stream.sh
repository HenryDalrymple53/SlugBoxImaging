#!/bin/bash
while true;
do
    gst-launch-1.0 libcamerasrc ! video/x-raw,width=4608,height=2592,framerate=1/5 ! videoconvert ! queue ! x264enc bitrate=50000 tune=zerolatency key-int-max=1 ! queue ! h264parse config-interval=1 ! mpegtsmux ! queue ! filesink location=video.ts sync=true
    sleep 1
    wait
done
