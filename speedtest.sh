#!/bin/bash

set -eux

DATE=`date '+%Y-%m-%d %H:%M:%S'`
OUT_FILE=/home/picolit/speedtest.log
TMP_FILE=/home/picolit/speedtest.tmp

/usr/local/bin/speedtest-cli > $TMP_FILE

IP=`cat $TMP_FILE | grep 'Testing from'`
DOWNLOAD=`cat $TMP_FILE | grep Download:`
UPLOAD=`cat $TMP_FILE | grep Upload:`

echo "$DATE $IP" >> $OUT_FILE
echo "$DATE $DOWNLOAD" >> $OUT_FILE
echo "$DATE $UPLOAD" >> $OUT_FILE

if [ -e $TMP_FILE ]; then
    rm $TMP_FILE
fi