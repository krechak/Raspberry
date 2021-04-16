Raspberry
=========

## led_1.sh

### prerequiers:

1. Connect Positive side of the LED through resistor (you can choose from 220 Ohm up to around 1k Ohm, but 220 Ohm should be ideal) to the GPIO nr 2 Pin on Raspberry Pi
2. Connect Negative side of the LED to one of the Ground (GND) Pins on Raspberry Pi

### How to run:
1. If you don't have "led_1.sh" file copy it form repository using command: $ git clone https://github.com/krechak/Raspberry LED_1
2. Go to LED_1 catalog using: cd LED_1
3. Run ./led_1.sh

## ledcpp.cc

### prerequiers:

1. Connect Positive side of the LED through resistor (you can choose from 220 Ohm up to around 1k Ohm, but 220 Ohm should be ideal) to the GPIO nr 2 Pin on Raspberry Pi
2. Connect Negative side of the LED to one of the Ground (GND) Pins on Raspberry Pi

### How to compile:
1. If you don't have g++ compiler installed, instal it using command: sudo apt install g++
2. Make sure you have wiringpi installed, if not you can install it using: sudo apt-get install wiringpi
3. If you don't have "ledcpp.cc" file copy it form repository using command: $ git clone https://github.com/krechak/Raspberry LED_1
4. Go to LED_1 catalog using: cd LED_1
5. To compile use: g++ -Wall -o <binary_output_file_name> <input_file>.cc -lwiringPi

### How to run:
1. Go to LED_1 catalog using: cd LED_1
2. Run ./ledcpp

 

