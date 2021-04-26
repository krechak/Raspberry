#include<iostream>
#include<wiringPi.h>

using namespace std;

int main()
{
    wiringPiSetupGpio();

    int OUT = 3;
    int IN = 2;

    pinMode(OUT, OUTPUT);
    pinMode(IN, INPUT);

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