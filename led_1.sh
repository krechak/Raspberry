#!/usr/bin/env bash 

PINS_INPUT="20"
PINS_OUTPUT="21"
PINS="20 21"
KEY_1="20"
LED_1="21"

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
			echo "PIN $i was exported"
		fi
	done
}

export_gpio_if_needed "$PINS"
sleep 1
set_pin_mode "$PINS_INPUT" "$PINS_OUTPUT"


key_led_action()
{
	if [ $(cat /sys/class/gpio/gpio$1/value) -eq "1" ]; then
		echo "0" > /sys/class/gpio/gpio$2/value	
		echo "stan WYSOKI na pinie $2 spowodowany wciśnięciem przycisku $1"
	else
		echo "1" > /sys/class/gpio/gpio$2/value	
		echo "stan NISKI na pinie $2 spowodowany wciśnięciem przycisku $1"
	fi
}

key_pull_up()
{
	for i in $1
	{
		gpio -g mode $1 up
	}
}

led_pull_off()
{
	for i in $1
	{
		gpio -g mode $1 tri
	}
}

key_pull_up $KEY_1
led_pull_off $LED_1

while [ 1 ]
do
	key_led_action $KEY_1 $LED_1 
done