#!/bin/bash
#########################################################
#  Nextion Support for Nextion screen. Used to set      #
#  current TG to TG passed in $1 using tgif API         #
#                                                       #
#  KF6S                                     10-25-2020  #
#########################################################

# Use TS2 (zero based code=1)
TS="1"
if [ -z "$1" ]; then
# If TG is not passed then default to 31665
TG=31665
else
TG=$1
fi

ID=`sudo cat /etc/mmdvmhost | grep "\[DMR\]" -A 14 | grep "Id=" | cut -b 4-14`
curl -s http://tgif.network:5040/api/sessions/update/$ID/$TS/$TG
## To check arquments being passed to the API command take off the ## in front of echo below
## echo curl -s http://tgif.network:5040/api/sessions/update/$ID/$TS/$TG
