#!/bin/bash
#########################################################
#  Nextion Support for Nextion screen. Used to copy     #
#  files from Nextion.Images to their proper location   #
#                                                       #
#  KF6S                                     03-10-2020  #
#########################################################

sudo mount -o remount,rw /
sudo mkdir /usr/local/etc/Nextion_Support
sudo cp /home/pi-star/Nextion_Temp/{*.sh,*.fw} /usr/local/etc/Nextion_Support
sudo chmod +x /usr/local/etc/Nextion_Support/*.sh
