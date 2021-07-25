#!/bin/bash

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
  echo -e "\e[31m should be either root/sudo user to run this script\e[0m"
  exit 2
fi
LOG=/tmp/robotshop.log
rm -f $LOG
STAT_CHECK(){
  if [ $1 -eq 0 ] ; then ###Here we are using $1 because while calling the function we are giving an argument to STAT_CHECK().So $LOG becomes $1
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m Failed\e[0m"
  exit 1
fi
}
PRINT(){
  echo -n -e "$1\t\t"
  }
