#!/bin/bash
##  1.Output shouldn't be displayed on the terminal
##  2.Validate if the command has been executed successfully
## 3.Need to validate whether the script is running as a root user

source common.sh

PRINT "Installing Nginx\t"
yum install nginx -y &>> $LOG ## Redirecting the output to $LOG and it is in /tmp/robot shop.log
STAT_CHECK $?  ##Passing an argument to the STAT_CHECK.So $LOG = $1 in above function

PRINT "Download Frontend\t"

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip" &>> $LOG
STAT_CHECK $?

PRINT "Remove old Html docs\t"
cd /usr/share/nginx/html && rm -rf * &>> $LOG
STAT_CHECK $?

PRINT "Extract Frontend Archive"
unzip /tmp/frontend.zip &>> $LOG
STAT_CHECK $?

PRINT "Move Frontend\t\t"
mv frontend-main/* . && mv static/* . && rm -rf frontend-master static &>> $LOG
STAT_CHECK $?

PRINT "Copy Roboshop Config\t"
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>> $LOG
STAT_CHECK $?

PRINT "Update Roboshop Config\t"
sed -i -e '/catalogue/ s/localhost/catalogue.robotshop.internal' /etc/nginx/default.d/roboshop.conf
STAT_CHECK $?

PRINT "Enabling Nginx\t\t"
systemctl enable nginx &>> $LOG
STAT_CHECK $?

PRINT "Start Nginx\t\t"
systemctl restart nginx &>> $LOG
STAT_CHECK $?

