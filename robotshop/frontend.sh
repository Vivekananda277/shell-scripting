#!/bin/bash

LOG=/tmp/robotshop.log
rm -f $LOG
echo -e "\e[31mInstalling Nginx\e[0m"
yum install nginx -y >> $LOG
##  1.Output shouldn't be displayed on the terminal
##  2.Validate if the command has been executed successfully
echo "Enabling Nginx"
systemctl enable nginx >> $LOG

echo "Starting Nginx"
systemctl start nginx >> $LOG