#!/bin/bash

LOG=/tmp/frontend.log
## Installing nginx
yum install nginx -y > $LOG
##  1.Output shouldn't be displayed on the terminal
##  2.Validate if the command has been executed successfully
echo "Enabling Nginx"
systemctl enable nginx

echo "Starting Nginx"
systemctl start nginx