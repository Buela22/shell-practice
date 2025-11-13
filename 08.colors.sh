#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "$R Error : Please run this script with root access $N"
    exit 1 #failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then 
    echo "$R Error : Installing mysql is failue $N"
    exit 1 #failure is other than 0
else
    echo "$G Installing mysql is success $N"
fi        


dnf install nginx -y

if [ $? -ne 0 ]; then 
    echo "$R Error : Installing nginx is failue $N"
    exit 1 #failure is other than 0
else
    echo "$G Installing nginx is success $N"
fi 



dnf install mongo -y

if [ $? -ne 0 ]; then 
    echo "$R Error : Installing mongo is failue $N"
    exit 1 #failure is other than 0
else
    echo "$G Installing mongo is success $N"
fi 