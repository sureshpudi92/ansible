#!/bin/bash

USERID=$(id -u)

#this function should validate previous command status
VALIDATE(){
if [ $1 -ne 0 ]
then
        echo "$2  failure"
        exit 1
else
echo "$2 success"
fi

}

if [ $USERID -ne 0 ]
then
     echo "Error: please run this script with root access"
     exit 1
else
echo "you are root user"
fi

# our responsibility whether installation success or not
yum install mysql -y "Installing MySql"
VALIDATE $?

yum install postfix -y "Installing postfix"
VALIDATE $?

