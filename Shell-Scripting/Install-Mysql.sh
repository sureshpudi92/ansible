#!/bin/bash
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

#colors
R="\e[31m"
G="\e[32m"
N="\e[0m"


#this function should validate previous command status
VALIDATE(){
if [ $1 -ne 0 ]
then
        echo -e"$2 ..... $R failure $N"
        exit 1
else
echo -e"$2 .....$G success $N"
fi

}

# check whether root user or not
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
     echo "Error: please run this script with root access"
     exit 1
#else
#echo "you are root user"
fi

# our responsibility whether installation success or not
yum install mysql -y >>$LOGFILE
VALIDATE $?  "Installing MySql"

yum install postfix -y >>$LOGFILE
VALIDATE $? "Installing postfix"

# $1 ---Exit status of the previous command ($?)
# $2---Custom message (e.g., "Installing MySql")
