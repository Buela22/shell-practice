#!/bin/bash

#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
userid=$(id -u)

mkdir -p $LOGS_FOLDER
echo "script started executed at : $(date)" | tee -a $LOGS_FILE


if [ $userid -ne 0 ]; then
    echo "$R Error : Please run this script with root access $N"
    exit 1 #failure is other than 0
fi


VALIDATE(){
    if [ $1 -ne 0 ]; then 
    echo "$R Error : Installing $2 is failue $N" | tee -a $LOGS_FILE
    exit 1 #failure is other than 0
else
    echo "$G Installing $2 is success $N" | tee -a $LOGS_FILE
fi   
}


dnf install mysql &>>LOGS_FILE
if [ $? -ne 0 ]; then 
    dnf install mysql -y &>>LOGS_FILE | tee -a $LOGS_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "mysql alredy exist ...$Y SKipping $N" 
fi


dnf install nginx &>>LOGS_FILE
if [ $? -ne 0 ]; then 
    dnf install nginxl -y &>>LOGS_FILE | tee -a $LOGS_FILE
    VALIDATE $? "NGINX"
else
    echo -e "nginx alredy exist ...$Y SKipping $N"
fi



dnf install mongodb &>>LOGS_FILE
if [ $? -ne 0 ]; then 
    dnf install mongodb -y &>>LOGS_FILE | tee -a $LOGS_FILE
    VALIDATE $? "MONGODB"
else
    echo -e "mongodb alredy exist ...$Y SKipping $N"
fi


# Giving package dynamically::
for package in $@
do
    #check package is alredy installed or not
    dnf list installed $package &>>LOGs_FILE

    #if exit status is 0 .already installed. -ne 0 need to install it
    if [ $? -ne 0 ];then
        dnf install $package -y &>>LOGS_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package already installed ...$Y Skipping $N"
    fi
done    


