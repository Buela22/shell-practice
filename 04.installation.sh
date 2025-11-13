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