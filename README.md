# NX4832K035

SPECIAL NOTE: After installing the latest 3.5” screen image you will need to re-type in any Password and Port information you may have stored in your six Profiles on the Profile screen.  The password field was lengthened by one character to accommodate the TGIF Prime password and this reduced the length of the port field by one character.
END SPECIAL NOTE.

If you have an older 3.5” hotspot that is working normally, and you have not kept up with the frequent screen updates you can use this manual procedure to get caught up. If you have tried to update to the latest screen using the normal Git, Copy & Flash procedure on the Flash screen and the attempt was unsuccessful then you can run the following commands using SSH on the Pi to update to the latest screen image:

rpi-rw


sudo rm -f /usr/local/etc/NX4832K035.tft

sudo rm -r -f /home/pi-star/Nextion_Temp

sudo git clone --depth 1 https://github.com/EA7KDO/NX4832K035 /home/pi-star/Nextion_Temp
(Note: There is a single space after NX4832K035 in the command line.)

sudo chmod +x /home/pi-star/Nextion_Temp/cpyfiles.sh

sudo /home/pi-star/Nextion_Temp/cpyfiles.sh        

sudo cp /home/pi-star/Nextion_Temp/NX4832K035.tft /usr/local/etc/NX4832K035.tft
(Note: There is a single space after NX4832K035.tft in the command line.)

After completing these steps successfully, you can use the Flash button on the Flash screen to flash the new tft to the screen. After the screen completes flashing 100% and displays the Splash screen you can reboot and do a normal Git, (wait two minutes) Copy (wait one minute) & Flash procedure and be back up to date with the latest tft and all required scripts and files.
