#!/bin/bash
source common.sh

PRINT "Setting up the repository"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' > /etc/yum.repos.d/mongodb.repo
STAT_CHECK $?

PRINT "Install MongoDB\t\t"
yum install -y mongodb-org &>>$LOG
STAT_CHECK $?

PRINT "Update Listen IP address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>$LOG ## sed "s(search)/Previous/New one"  file path name
STAT_CHECK $?

PRINT "Start MongoDB\t\t"
systemctl enable mongod &>>$LOG && systemctl start mongod &>>$LOG
STAT_CHECK $?

PRINT "Download MongoDB Service"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip" &>>$LOG
STAT_CHECK $?

PRINT "Load Schema\t\t"
cd /tmp && unzip -o mongodb.zip &>>$LOG && cd mongodb-main && mongo < catalogue.js &>>$LOG && mongo < users.js &>>LOG #-o is used to overwrite previous file
STAT_CHECK $?