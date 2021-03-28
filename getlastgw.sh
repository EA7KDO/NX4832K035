#!/bin/bash
#################################################
#  Get Last Heard Network from DMRGateway	#
#						#
#						#
#  VE3RD 			2020-11-29	#
#################################################
set -o errexit
set -o pipefail

function getstring
{
# Step 1 - Get newest dmrgateway log file

	f1=$(ls -art /var/log/pi-star/DMRG* | tail -n1)
#	echo "File: $f1"

# Sterp 2 - Get the last line that contains 'Name='
	line=$(grep Name= $f1 | tail -n 1)
#	echo "1:$line"

# Step 3 - Get Param 4 to Determine RF or Network
	type=$(echo "$line" | cut -d' ' -f4)
#	echo "type=$type"


# Step 4 Get Network Name and Number

	if [ "$type" = "RF" ]; then
		tt1=$(echo "$line" | cut -d' ' -f6 | cut -d'=' -f2)     # Net Name
		tt2=$(echo "$line" | cut -d' ' -f7 | cut -d'=' -f2)     # Net Number
		echo "GW R Net $tt2 $tt1" 
		
	fi

	if [ "$type" = "Network" ]; then
		t1=$(echo "$line" | cut -d' ' -f8 | cut -d'=' -f2)      #Net Name
		t2=$(echo "$line" | cut -d' ' -f5)	#Net Number
		echo "GW N Net $t2 $t1"

	fi

}

Addr=$(sed -nr "/^\[DMR Network\]/ { :l /^Address[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/mmdvmhost)

#Check to see if we are running the DMRGatewy
if [ $Addr = "127.0.0.1" ]; then
 	GW="ON"
	getstring
else
   	# We are not Running the Gateway - Do Nothing
	GW="OFF"
fi

