#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Error : Please run this script with root access"
    exit 1 #failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then 
    echo "Error : Installing mysql is failue"
    exit 1 #failure is other than 0
else
    echo "Installing mysql is success"
fi        


dnf install nginx -y

if [ $? -ne 0 ]; then 
    echo "Error : Installing nginx is failue"
    exit 1 #failure is other than 0
else
    echo "Installing nginx is success"
fi 



dnf install mongo -y

if [ $? -ne 0 ]; then 
    echo "Error : Installing mongo is failue"
    exit 1 #failure is other than 0
else
    echo "Installing mongo is success"
fi 