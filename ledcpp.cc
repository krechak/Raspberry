#include<iostream>
#include<wiringPi.h>

using namespace std;

int main()
{
    wiringPiSetupGpio();

    int OUT = 2;
    int IN = 3;

    pinMode(OUT, OUTPUT);
    pinMode(IN, INPUT);
    int button = 0;

    while(1)
    {
        button = digitalRead(IN);
        if(button)
        {
            digitalWrite(OUT,HIGH);
        }
        else
        {
            digitalWrite(OUT,LOW);
        }
    }
    return 0;
}