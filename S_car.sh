#!/bin/sh

#SSID=()
#sudo aptitude install crontab
# crontab
# */5 * * * * /home/ramesh/backup.sh


RESULT=$(iwlist wlan0 scan  | grep ESSID  | grep -Po '".*?"')

echo $RESULT

ATHOME=false

for i in $RESULT; 
   do 
   echo $i 
   if [ $i = '"solarcar"' ]
   then
        echo "This is home"
        ATHOME=true 
   else
        echo "Not home"
    fi;
done

echo "done"
if [ $ATHOME ] 
then
   echo "normal mode"
   cp defaultSetup /etc/network/interfaces
else
   echo "adhoc mode"
   cp adhocSetup   /etc/network/interfaces

fi

ifdown wlan0
ifup wlan0
