#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
     echo "Error: please run this script with root access"
     exit 1
else
echo "you are root user"
fi

# our responsibility whether installation success or not
yum install mysql -y

if [ $? -ne 0]
then
echo "Installation of mysql is not success"
else
echo "Installation of mysql is success"
fi
