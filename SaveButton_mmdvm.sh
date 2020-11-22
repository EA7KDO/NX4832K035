#! /bin/bash
#############################################
# Save MMDVM Button Red/Green Status        
#                                           #
#                                           #
#                                           #
#                                           #
#                                           #
# EA7KDO                          10/1/2020 #
#############################################
set -o errexit
set -o pipefail

if [ "$1" = 0 ]; then
sudo rm -f /usr/local/etc/Nextion_Support/Test.txt
sudo echo "Red" >> /usr/local/etc/Nextion_Support/Test.txt
fi

if [ "$1" = 1 ]; then
sudo rm -f /usr/local/etc/Nextion_Support/Test.txt
sudo echo "Green" >> /usr/local/etc/Nextion_Support/Test.txt
fi

if [ "$1" = 2 ]; then
sudo rm -f /usr/local/etc/Nextion_Support/Test2.txt
sudo echo "Red" >> /usr/local/etc/Nextion_Support/Test2.txt
fi

if [ "$1" = 3 ]; then
sudo rm -f /usr/local/etc/Nextion_Support/Test2.txt
sudo echo "Green" >> /usr/local/etc/Nextion_Support/Test2.txt
fi

if [ "$1" = 4 ]; then
sudo rm -f /usr/local/etc/Nextion_Support/Test3.txt
sudo echo "Red" >> /usr/local/etc/Nextion_Support/Test3.txt
fi

if [ "$1" = 5 ]; then
sudo rm -f /usr/local/etc/Nextion_Support/Test3.txt
sudo echo "Green" >> /usr/local/etc/Nextion_Support/Test3.txt
fi
