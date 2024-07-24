#!/bin/sh
PS_NUM=`ps w | grep read.sh | grep -v grep | wc -l`
if [ "$PS_NUM" -gt "2" ]; then
  echo "Alreade running proces"
  exit
fi
. ./conf.sh

./led/$MODEL_ROUTER/stop.sh
./led/$MODEL_ROUTER/enable.sh
CODE=""
thd --dump /dev/input/event0 |  awk '{ if($1!="#" && $3==1)  print $2}' | while read line
do
  DETECT_ENTER=`echo $line | grep "ENTER" | wc -l`
  if [ "$DETECT_ENTER" = "1"  ]; then
# echo -n $CODE
./led/$MODEL_ROUTER/stop.sh
./led/$MODEL_ROUTER/blink.sh&
 CODE=`echo $CODE | cut -c 3-`
 URL_FULL="$URL/$SCANNER_DONE/$CODE"
 RESULT=`wget -q --no-check-certificate  -O - $URL_FULL`
 SYS=`echo $RESULT | grep -o '"status":14' | wc -l` 
 if [ "$SYS" = "1"  ]; then
   ./led/$MODEL_ROUTER/stop.sh
   ./led/$MODEL_ROUTER/enable.sh  
 fi
 CODE=""
  else
     SYM=`echo -n "$line" | sed "s/KEY_//g"`
     CODE="$CODE$SYM"
  fi

done

