#!/bin/sh
./led/green_blink.sh&
sleep 2
./led/stop.sh
./led/green_on.sh
sleep 3
./led/green_off.sh
./led/red_on.sh
