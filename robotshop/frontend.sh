#!/bin/bash

LOG=/tmp/robotshop.log
rm -f $LOG
echo -e -n "Installing Nginx"
yumm install nginx -y &>> $LOG
if [ $? -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m Failed\e[0m"
  exit 1
fi
##  1.Output shouldn't be displayed on the terminal
##  2.Validate if the command has been executed successfully
## 3.Need to validate whether the script is running as a root user

echo -n -e "Enabling Nginx"
systemctl enable nginx &>> $LOG
if [ $? -eq 0 ]; then
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m Failed\e[0m"
  exit 1
fi

echo -e -n "Starting Nginx"
systemctl start nginx &>> $LOG
if [ $? -eq 0 ] ; then
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m Failed\e[0m"
  exit 1
fi