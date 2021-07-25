#!/bin/bash

## Installing NGINX
yum install nginx -y
systemctl enable nginx
systemctl start nginx