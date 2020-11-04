#! /bin/bash
#############################################
# Save Split Button Red/Green Status        #
#                                           #
#                                           #
#                                           #
#                                           #
#                                           #
# EA7KDO                          11/4/2020 #
#############################################
set -o errexit
set -o pipefail

if [ "$1" = 0 ]; then
sudo rm -f /usr/local/etc/Nextion_Support/Split.txt
sudo echo "Red" >> /usr/local/etc/Nextion_Support/Split.txt
fi

if [ "$1" = 1 ]; then
sudo rm -f /usr/local/etc/Nextion_Support/Split.txt
sudo echo "Green" >> /usr/local/etc/Nextion_Support/Split.txt
fi

