#!/bin/bash

A=10
echo $A

## Command substitutions
NO_OF_USERS=$(who|wc -l)
echo -e "\e[33mNumber of users=$NO_OF_USERS\e[0m'