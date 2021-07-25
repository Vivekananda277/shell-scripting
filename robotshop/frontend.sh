#!/bin/bash

source common.sh

PRINT "Installing Nginx"
yum install nginx -y &>> $LOG ## Redirecting the output to $LOG and it is in /tmp/robot shop.log
STAT_CHECK $?  ##Passing an argument to the STAT_CHECK.So $LOG = $1 in above function

PRINT "Enabling Nginx\t"
systemctl enable nginx &>> $LOG
STAT_CHECK $?

PRINT "Start Nginx\t"
systemctl start nginx &>> $LOG
STAT_CHECK $?

##  1.Output shouldn't be displayed on the terminal
##  2.Validate if the command has been executed successfully
## 3.Need to validate whether the script is running as a root user
