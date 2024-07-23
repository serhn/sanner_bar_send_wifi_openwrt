#!/bin/sh
echo 0 > /sys/class/leds/gl-connect\:green\:lan/brightness
echo 0 > /sys/class/leds/gl-connect\:red\:wlan/brightness
killall blink.sh &>/dev/null 
