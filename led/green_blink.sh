#!/bin/sh

#killall red_blink.sh &> /dev/null
PAUSE=$1
if [ -z "$PAUSE" ]
then
  PAUSE="0.5"
fi
./led/green_off.sh
while [ 1 = 1 ]; do
./led/green_on.sh
sleep $PAUSE
./led/green_off.sh
sleep $PAUSE
done
