#!/usr/bin/bash

#Declare a function

sample(){
  echo Hello,I am a sample function
  echo -e "\e[34mValue of a is $a\e[0m"
}

##call the function
a=10
sample