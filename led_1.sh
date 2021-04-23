#!/usr/bin/env bash 

PIN_INPUT=3
PIN_OUTPUT=2
PINS="2 3"

set_pin_mode()
{
	for i in $1
	do
			if [ $i -eq $2 ]; then
				echo "in" > /sys/class/gpio/gpio$i/direction
				echo "seting input on pin $i" 
			fi

			if [ $i -eq $3 ]; then
				echo "out" > /sys/class/gpio/gpio$i/direction
				echo "seting output on pin $i" 
			fi
	done
}

export_gpio_if_needed()
{
	echo $1
	for i in $1
	do
		echo i $i
		FILE=/sys/class/gpio/gpio$i/direction
		if [ -f "$FILE" ]; then
			echo "$FILE already exists and PIN $i is already exported."
		else
			echo $i > /sys/class/gpio/export
		fi
	done
}

export_gpio_if_needed "$PINS"
set_pin_mode "$PINS" $PIN_INPUT $PIN_OUTPUT

while [ 1 ]
do
	x=$(cat /sys/class/gpio/gpio3/value)
	if [ "$x" = "1" ]
	then
		echo "1" > /sys/class/gpio/gpio2/value	
	else
		echo "0" > /sys/class/gpio/gpio2/value
	fi	
done
