#!/bin/sh
PS_NUM=`ps w | grep read.sh | grep -v grep | wc -l`
echo $PS_NUM
if [ "$PS_NUM" -gt "2" ]; then
  echo "Alreade running proces"
  exit
fi
. ./conf.sh

./led/stop.sh
./led/red_on.sh&
CODE=""
thd --dump /dev/input/event0 |  awk '{ if($1!="#" && $3==1)  print $2}' | while read line
do
  if [ "$line" = "$LINE_END" ]; then
 echo -n $CODE
 echo ""
./led/stop.sh
#./led/red_blink.sh&
 CODE=`echo $CODE | cut -c 3-`
 URL_FULL="$URL/$SCANNER_DONE/$CODE"
 echo $URL_FULL
 RESULT=`wget -q --no-check-certificate  -O - $URL_FULL`
 echo $RESULT
./led/stop.sh
if [ "$RESULT" = "OK" ]; then
./led/code_ok.sh  
 else
   if [ "$RESULT" = "ALREADY" ]; then
./led/code_ok_already.sh  
   else
     if [ "$RESULT" = "NOT" ]; then
./led/code_not.sh  
     else
./led/red_on.sh&
     fi
  fi
fi
 CODE=""
  else
     SYM=`echo -n "$line" | sed "s/KEY_//g"`
     CODE="$CODE$SYM"
  fi

done

