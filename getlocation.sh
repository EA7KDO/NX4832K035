#!/bin/bash
############################################################
#  Get  Location from /etc/mmdvmhost                       #
#                                                          #
#                                                          #
#  Returns the Location from mmdvmhost                     #
#                                                          #
#  EA7KDO                                      06-08-2021  #
############################################################
set -o errexit
set -o pipefail

sudo cat /etc/mmdvmhost | grep "\[Info\]" -A 7 | grep "Location=" | cut -b 10-30

