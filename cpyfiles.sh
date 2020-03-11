#!/bin/bash
#############################################################
#  Nextion Support for Nextion screen. Used to copy         #
#  files from correct screen model repository to the        #
#  /usr/local/etc/Nextion_Support directory.                #
#                                                           #
#  KF6S                                         03-10-2020  #
#############################################################

sudo mount -o remount,rw /
sudo mkdir /usr/local/etc/Nextion_Support
sudo cp /home/pi-star/Nextion_Temp/{*.sh,*.fw} /usr/local/etc/Nextion_Support
sudo chmod +x /usr/local/etc/Nextion_Support/*.sh
