#!/bin/bash

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

PRINT "Installing Nginx"
yum install nginx -y &>> $LOG ## Redirecting the output to $LOG and it is in /tmp/robot shop.log
STAT_CHECK $?  ##Passing an argument to the STAT_CHECK.So $LOG = $1 in above function

PRINT "Enabling Nginx\t"
systemctl enable nginx &>> $LOG
STAT_CHECK $?

PRINT "Start Nginx"
systemctl start nginx &>> $LOG
STAT_CHECK $?

##  1.Output shouldn't be displayed on the terminal
##  2.Validate if the command has been executed successfully
## 3.Need to validate whether the script is running as a root user
