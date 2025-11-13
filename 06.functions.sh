userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "Error : Please run this script with root access"
    exit 1 #failure is other than 0
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then 
    echo "Error : Installing $2 is failue"
    exit 1 #failure is other than 0
else
    echo "Installing $2 is success"
fi   
}


dnf install mysql -y
VALIDATE $? "mysql"

dnf install nginx -y
VALIDATE $? "niginx"

dnf install python3 -y
VALIDATE $? "python3"

 