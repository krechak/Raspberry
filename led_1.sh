#!/bin/sh

echo "15" > /sys/class/gpio/export
echo "18" > /sys/class/gpio/export

echo "out" > /sys/class/gpio/gpio15/direction
echo "in" > /sys/class/gpio/gpio18/direction


while [ 1 ]
do
	x=$(cat /sys/class/gpio/gpio18/value)


	if [ "$x" = "1" ]
	then
		echo "1" > /sys/class/gpio/gpio15/value	
	else
		echo "0" > /sys/class/gpio/gpio15/value
	fi
	
done
