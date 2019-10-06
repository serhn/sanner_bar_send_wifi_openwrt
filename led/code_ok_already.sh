#!/bin/sh
./led/green_blink.sh 0.1&
sleep 3
./led/stop.sh
#./led/green_on.sh
#sleep 3
#./led/green_off.sh
./led/red_on.sh
