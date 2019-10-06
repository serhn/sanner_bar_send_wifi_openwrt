#!/bin/sh

#killall red_blink.sh &> /dev/null
PAUSE=$1
if [ -z "$PAUSE" ]
then
  PAUSE="0.5"
fi
./led/green_off.sh
while [ 1 = 1 ]; do
./led/red_on.sh
sleep $PAUSE
./led/red_off.sh
sleep $PAUSE
done
