#!/bin/bash

LOG=/tmp/robotshop.log
rm -f $LOG
echo "Installing Nginx"
yum install nginx -y &>> $LOG
echo $?
##  1.Output shouldn't be displayed on the terminal
##  2.Validate if the command has been executed successfully
## 3.Need to validate whether the script is running as a root user
echo "Enabling Nginx"
systemctl enable nginx &>> $LOG
echo $?

echo "Starting Nginx"
systemctl start nginx &>> $LOG
echo $?