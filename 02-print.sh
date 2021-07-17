#!/bin/bash

echo Hello Bhai

#print multiple lines

echo -e "Hello Bhai,\nNamasthe"

#Enabling the colours(\e)

##Synatx : echo -e "\eColmMessage"
#COLOURS AND THEIR CODES
#RED 31
#GREEN 32
#YELLOW 33
#BLUE  34
#MAGENTA 35
#CYAN 36

echo -e "\e[31mMESSAGE IN RED\e[0m"
echo -e "\e[33mMESSAGE IN YELLOW\e[0m"

#Colours once enabled will print the other lines in same colour.So we need to disable them once done.

echo -e "\e[36mNamasthe Anna\e[0m"

echo -e "Endho emo"