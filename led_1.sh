#!/usr/bin/env bash 

PINS_INPUT="20"
PINS_OUTPUT="21"
PINS="20 21"
KEY_1="20"
#KEY_2="3"
LED_1="21"
#LED_2="2"


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
		echo "stan NISKI na pinie $2 spowodowany wciśnięciem przycisku $1"
	else
		echo "1" > /sys/class/gpio/gpio$2/value	
		echo "stan WYSOKI na pinie $2 spowodowany wciśnięciem przycisku $1"
	fi
}


# check_inputs()
# {
# 	for i in $1
# 	do
# 		if [ $(cat /sys/class/gpio/gpio$i/value) -eq "1" ]; then
			
# 			echo "0" > /sys/class/gpio/gpio$i/value	
# 		else
			
# 		fi
# 	done
# }



# check_inputs "$PINS_INPUT" "${LEDS[@]}"

# while [ 1 ]
# do
# 	x=$(cat /sys/class/gpio/gpio3/value)
# 	if [ "$x" = "1" ]
# 	then
# 		echo "0" > /sys/class/gpio/gpio2/value	
# 	else
# 		echo "1" > /sys/class/gpio/gpio2/value
# 	fi	
# 	#sleep 0.1
# done

while [ 1 ]
do
	key_led_action $KEY_1 $LED_1 
	#key_led_action $KEY_2 $LED_2 
	#sleep 0.1
done