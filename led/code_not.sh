#!/bin/sh
./led/red_blink.sh 0.1&
sleep 2
./led/stop.sh
./led/red_on.sh
