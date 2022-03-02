#!/bin/bash
#################################################
#  Get Last Heard Network from DMRGateway	#
#						#
#						#
#  VE3RD 			2020-11-29	#
#################################################
set -o errexit
set -o pipefail

if [ -n "$(ls -A /var/log/pi-star/MM* 2>/dev/null)" ]; then   
  f2=$(ls -1 /var/log/pi-star/MMDVM* | tail -n 1)
  #echo "$f2"
  line=$(sudo cat "$f2" | grep transmission | tail -n 1)
  #echo "$line"
  nMode=$(echo "$line" | cut -d " " -f 4 | cut -d "," -f 1)
#  echo "$nMode"
  result="Starting"

  if [[ ! "$nMode" =~ ^(DMR|P25|YSF|NXDN)$ ]]; then
	echo "NA|NA|NA"
	exit
    
  fi

#echo "Mode = $nMode"
  
  if [ "$nMode" == "DMR" ]; then
	Addr=$(sudo sed -nr "/^\[DMR Network\]/ { :l /^Address[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/mmdvmhost)
        if [ $Addr = "127.0.0.1" ]; then
			f1=$(sudo ls -x /var/log/pi-star/DMRGateway* | tail -n1)
                	GW="ON"
                	NetType=$(sudo tail -n1 "$f1" | cut -d " " -f 4)
			NetNum=$(sudo tail -n1 "$f1" | cut -d " " -f 6)
			NName=$(sudo sed -nr "/^\[DMR Network "${NetNum##*( )}"\]/ { :l /^Name[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/dmrgateway)
			NName=$(echo "$NName" | cut -d "_" -f1 |  tr '[:lower:]' '[:upper:]')
#			NName=$(echo "$NName" |  tr '[:lower:]' '[:upper:]')
   			result=$(echo "DMR|$NName|GW:${NetNum##*( )}")
	else
        
                	GW="OFF"
			ms1=$(sudo sed -n '/^[^#]*'"$Addr"'/p' /usr/local/etc/DMR_Hosts.txt | tail -n 1 | sed -E "s/[[:space:]]+/|/g") 
#			ms=$(echo "$ms1" | cut -d '|' -f 1 | cut -d "_" -f 1)
			ms=$(echo "$ms1" | cut -d '|' -f 1 )
                	result=$(echo "DMR|$ms|NA")
	fi
#	echo "Mode=DMR"


    elif [ "$nMode" == "P25" ]; then
#		echo "Mode=P25"
  		line=$(sudo cat "$f2" | grep 'end of transmission' | tail -n 1)
#echo "$line"
 		 tg=$(echo "$line" | cut -d " " -f 13 | cut -d "," -f1)
#echo "$tg"
		server=$(grep "$tg" /usr/local/etc/P25HostsLocal.txt |  tr '\t' ' ' | cut -d " " -f2 | cut -d "." -f1 | tr '[:lower:]' '[:upper:]')
		if [ -z "$server" ]; then
			server=$(grep "$tg" /usr/local/etc/P25Hosts.txt |  tr '\t' ' ' | cut -d " " -f2 | cut -d "." -f1 | tr '[:lower:]' '[:upper:]')
		fi
		result=$(echo "P25|$server|NA")
	

     elif [ "$nMode" == "YSF" ]; then
		tg=$(sed -nr "/^\[Network\]/ { :l /^Startup[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/ysfgateway)
		server=$(grep "$tg" /usr/local/etc/YSFHosts.txt |  tr '\t' ' ' | cut -d ";" -f3 | cut -d "." -f1 | tr '[:lower:]' '[:upper:]')
		result=$(echo "YSF|$server|NA")
	

     elif [ "$nMode" == "NXDN" ]; then
		echo "Mode=NXDN"
		tg=$(sed -nr "/^\[Network\]/ { :l /^Static[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/nxdngateway)
		echo "tg-$tg"
		server=$(grep "$tg" /usr/local/etc/NXDNHosts.txt |  tr '\t' ' ' | cut -d " " -f2 | cut -d "." -f1 | tr '[:lower:]' '[:upper:]')
		result=$(echo "NXDN|$tg|NA")
      fi

	echo "$result"

else   
    echo "StartUp"
	exit
fi

