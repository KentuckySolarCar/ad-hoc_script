#!/bin/sh

#SSID=()
#sudo aptitude install crontab
# crontab
# */5 * * * * /home/ramesh/backup.sh

do_start()
{
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
echo $ATHOME
if  $ATHOME  
then
   echo "normal mode"
   cp defaultSetup /etc/network/interfaces
else
   echo "adhoc mode"
   cp adhocSetup   /etc/network/interfaces

fi

ifdown wlan0
ifup wlan0

}


do_test()
{

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
}

do_adhoc()
{
echo "moving files, and setting up adhoc mode"
cp adhocSetup   /etc/network/interfaces

ifdown wlan0
ifup wlan0

}


do_home()
{
echo "moving files, and setting up normal mode"
cp defaultSetup   /etc/network/interfaces

ifdown wlan0
ifup wlan0

}

case "$1" in
  start)
    echo "starting"
    do_start
    ;;

  test)
    echo "testing"
    do_test
    ;;
  f-adhoc)
    echo "force ad-hoc mode"
    do_adhoc
    ;;
  f-home)
    echo "force home mode"
    do_home
    ;;
  help)
    echo "LOL, you think I would help you"
    echo "This is still in dev, don't try this on your own"
    ;;
  "")
    echo "USAGE: \" $0  start | test  | f-adhoc | f-home | help \" "

    ;;
esac
