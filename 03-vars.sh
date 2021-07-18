#!/bin/bash

A=10
echo $A

## Command substitutions
NO_OF_USERS=$(who|wc -l)
echo -e "\e[33mNumber of users=$NO_OF_USERS\e[0m"

##Date with command substitution
DATE=$(date +%F)
echo -e "\e[35mWelcome today's date is $DATE\e[0m"

b=$(10 20)

echo ${b[0]}
echo ${b[1]}
