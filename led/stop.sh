#!/bin/sh
killall red_blink.sh &> /dev/null
killall green_blink.sh &> /dev/null
./led/red_off.sh
./led/green_off.sh


