#!/usr/bin/bash

#Declare a function

sample(){
  echo Hello,I am a sample function
  echo -e "\e[34mValue of a is $a\e[0m"
  b=$((100-30))
}
##Main program

a=10
##call the function
sample
echo value of b=$b