#!/bin/bash
############################################################
#  Get DMR Network from /etc/mmdvmhost                     #
#                                                          #
#                                                          #
#                                                          #
#                                                          #
#  KF6S                                        10-21-2020  #
############################################################
set -o errexit
set -o pipefail

sudo cat /etc/mmdvmhost | grep "\[DMR Network\]" -A 7 | grep "Address=" | cut -b 9-59

