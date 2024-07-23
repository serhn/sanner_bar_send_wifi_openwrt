#!/bin/sh
while [ "1" -le "2" ]
do
        echo 1 > /sys/class/leds/gl-connect\:green\:lan/brightness
        sleep 0.2
        echo 0 > /sys/class/leds/gl-connect\:green\:lan/brightness
        sleep 0.2 

done
