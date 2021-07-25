#!/bin/bash

LOG=/tmp/robotshop.log
rm -f $LOG
echo -e -n "Installing Nginx"
yum install nginx -y &>> $LOG
if "[ $? -eq 0 ]" ;
then
  echo -e -n "\e[32m done \e[0m"
else
  echo Failed
fi
##  1.Output shouldn't be displayed on the terminal
##  2.Validate if the command has been executed successfully
## 3.Need to validate whether the script is running as a root user

echo "Enabling Nginx"
systemctl enable nginx &>> $LOG
if "[ $? -eq 0 ]"; then
  echo -e -n "\e[32m done \e[0m"
else
  echo Failed
fi

echo "Starting Nginx"
systemctl start nginx &>> $LOG
echo $?