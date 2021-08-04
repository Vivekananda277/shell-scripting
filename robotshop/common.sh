#!/bin/bash

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then
  echo -e "\e[31m Should be either root/sudo user to run this script\e[0m"
  exit 2
fi
LOG=/tmp/robotshop.log
rm -f $LOG
STAT_CHECK(){
  if [ $1 -eq 0 ] ; then ###Here we are using $1 because while calling the function we are giving an argument to STAT_CHECK().So $LOG becomes $1
  echo -e "\e[32m done\e[0m"
else
  echo -e "\e[31m Failed\e[0m"
  echo -e "\e[33m Check the log file for more details,Log file - $LOG\e[0m"
  exit 1
fi
}
PRINT(){
  echo -e "#######################\t$1##################" &>> $LOG
  echo -n -e "$1\t\t"
  }

NODEJS(){
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
  curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip" &>>$LOG
  STAT_CHECK $?

  PRINT "Extract Downloaded Code\t"
  cd /home/roboshop && unzip -o /tmp/${COMPONENT}.zip && rm -rf ${COMPONENT} && mv ${COMPONENT}-main ${COMPONENT} &>>$LOG
  STAT_CHECK $?

  PRINT "Download NodeJS dependencies"
  cd /home/roboshop/${COMPONENT} && npm install --unsafe-prem &>>$LOG
  STAT_CHECK $?

  PRINT "Fix Application Permissions"
  chown roboshop:roboshop /home/roboshop -R
  STAT_CHECK $?

  PRINT "Update systemd file\t"
  sed -i -e "s/MONGO_DNSNAME/mongodb.robotshop.internal/" -e "s/REDIS_ENDPOINT/redis.robotshop.internal/"  -e "s/MONGO_ENDPOINT/mongo.robotshop.internal" /home/roboshop/${COMPONENT}/systemd.service && mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
  STAT_CHECK $?

  PRINT "Start ${COMPONENT} service\t"
  systemctl daemon-reload &>> $LOG && systemctl start ${COMPONENT} &>>$LOG && systemctl enable ${COMPONENT}r &>>$LOG
  STAT_CHECK $?
}
