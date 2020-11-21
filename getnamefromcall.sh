#!/bin/bash
############################################################
#  Get Name From:                                          #
#  /usr/local/etc/stripped.csv using call sign as key      #
#  Pass call sign in $1                                    #
#                                                          #
#                                                          #
#                                                          #
#  KF6S                                        11-20-2020  #
############################################################
set -o errexit

if [ -z "$1" ]; then
         exit
fi


NAME=$(cat /usr/local/etc/stripped.csv | grep -w -F $1 | head -1 | awk -F, '{print $3}')

if [ -z "$NAME" ]; then
    echo "Not Found"
        else
    echo $NAME
fi
