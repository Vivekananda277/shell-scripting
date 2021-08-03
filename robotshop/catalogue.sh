#!/bin/bash

source common.sh

PRINT "Install NodeJS\t\t"
yum install nodejs make gcc-c++ -y &>>$LOG
STAT_CHECK $?

PRINT "Add Robotshop Application user"
id roboshop &>>$LOG
if [ $? -ne 0 ]; then # $? here represents the output above command either 0 or non-zero
 useradd roboshop &>>$LOG
fi
STAT_CHECK $?

PRINT "Download Application Code"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT "Extract Downloaded Code"
cd /home/roboshop && unzip -o /tmp/catalogue.zip && mv catalogue-main catalogue &>>$LOG
STAT_CHECK $?

PRINT "Download NodeJS dependencies"
cd /home/roboshop/catalogue && npm install --unsafe-prem &>>$LOG
STAT_CHECK $?

PRINT "Fix Application Permissions"
chown roboshop:roboshop /home/roboshop -R &>>LOG
STAT_CHECK $?