#!/usr/bin/env bash 

PINS_INPUT="3"
PINS_OUTPUT="2"
PINS="2 3"

set_pin_mode()
{
	for i in $1
	do
		echo "in" > /sys/class/gpio/gpio$i/direction
		echo "seting input on pin $i" 
	done

	for i in $2
	do
		echo "out" > /sys/class/gpio/gpio$i/direction
		echo "seting output on pin $i"
	done
}

export_gpio_if_needed()
{
	for i in $1
	do
		FILE=/sys/class/gpio/gpio$i/direction
		if [ -f "$FILE" ]; then
			echo "$FILE already exists and PIN $i is already exported."
		else
			echo $i > /sys/class/gpio/export
		fi
	done
}

export_gpio_if_needed "$PINS"
set_pin_mode $PINS_INPUT $PINS_OUTPUT

while [ 1 ]
do
	x=$(cat /sys/class/gpio/gpio3/value)
	if [ "$x" = "1" ]
	then
		echo "1" > /sys/class/gpio/gpio2/value	
	else
		echo "0" > /sys/class/gpio/gpio2/value
	fi	
	sleep 0.1
done
