Raspberry
=========

## led_1.sh

### prerequiers:

1. Connect Negative side of the LED through resistor (you can choose from 220 Ohm up to around 1k Ohm, but 220 Ohm should be ideal) to the GPIO nr 2 Pin on Raspberry Pi
2. Connect Positive side of the LED to one of the 3.3V Pins on Raspberry Pi
3. Connect Button between Ground (GND) and GPIO Pin nr 3 on Raspberry Pi
4. led_1.sh file copied form repository into LED_1 directory. If you don't have "led_1.sh" file copy it form repository using command: $ git clone https://github.com/krechak/Raspberry LED_1.
5. Paswordless ssh connection between Raspberry Pi and Virtual Machine
6. Created folder "programs" on raspberry pi /home/pi/programs. To create it make sure you are in /pi/ folder and usce command: mkdir programs.

### How to run:
1. Go to LED_1 catalog using: cd LED_1
2. Send led_1.sh to raspberry Pi using command: scp led_1.sh raspberry:/programs
3. Run with command: ssh raspberry programs/led_1.sh
4. To stop program use keyboard shortcut ctrl+c

## ledcpp.cpp

### prerequiers:

1. Connect Negative side of the LED through resistor (you can choose from 220 Ohm up to around 1k Ohm, but 220 Ohm should be ideal) to the GPIO nr 2 Pin on Raspberry Pi
2. Connect Positive side of the LED to one of the 3.3V Pins on Raspberry Pi
3. Connect Button between Ground (GND) and GPIO Pin nr 3 on Raspberry Pi
4. Installed g++ compiler. If you don't have g++ compiler installed, instal it using command: sudo apt install g++
5. Installed wiringpi library. If you don't have wiringpi installed you can install it using: sudo apt-get install wiringpi
6. ledcpp.cpp file copied form repository into LED_1 directory. 3. If you don't have "ledcpp.cpp" file copy it form repository using command: $ git clone https://github.com/krechak/Raspberry LED_1
7. Paswordless ssh connection between Raspberry Pi and Virtual Machine
8. Created folder "programs" on raspberry pi /home/pi/programs. To create it make sure you are in /pi/ folder and usce command: mkdir programs.

### How to compile:
1. Go to LED_1 catalog using: cd LED_1
2. Send ledcpp.cpp to raspberry Pi using command: scp ledcpp.cpp raspberry:/programs
3. Connect to raspberry Pi via ssh using comamand: ssh raspberry
4. Go to "programs" folder on raspberry Pi using command: cd programs 
5. To compile use: g++ -Wall -o ledcpp ledcpp.cpp -lwiringPi

### How to run:
1. Run with command: ssh raspberry programs/ledcpp
2. To stop program use keyboard shortcut ctrl+c
 

