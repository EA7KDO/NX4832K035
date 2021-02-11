
#! /bin/bash/
#                                                   #
#                                                   #
#####################################################
#####################################################
#                                                   #
# Get Color, Red or Green                           #
# Returns  the Contents of Text.txt                 #
#                                                   #
#                                                   #
# VE3RD and EA7KDO                                  #
#                                                   #
#####################################################
#####################################################
 set -o errexit
 set -o pipefail

dirn=/usr/local/etc/Nextion_Support/Test2.txt
dirn=./Test2.txt
cat $dirn
