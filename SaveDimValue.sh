#!/bin/bash
########################################
#  Save DIM value for Info page slider #
#                                      #
#  KF6S                     11-23-2020 #
########################################
set -o errexit
set -o pipefail

# Use passed DIM value in $1 if present or default to 90 if not passed

if [ -z "$1" ]; then
         DIM="90"
         else DIM=$1
fi

sudo rm -f /usr/local/etc/Nextion_Support/DIM.txt
sudo echo $DIM >> /usr/local/etc/Nextion_Support/DIM.txt
