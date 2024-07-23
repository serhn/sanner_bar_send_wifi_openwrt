#!/bin/sh
echo 0 > /sys/devices/platform/leds-gpio/leds/tp-link\:blue\:system/brightness
echo 0 > /sys/devices/platform/leds-gpio/leds/tp-link\:blue\:system/brightness


#killall red_blink.sh &> /dev/null
#killall green_blink.sh &> /dev/null
#. ./led/red_off.sh
#. ./led/green_off.sh


