#!/bin/bash


# improvements
# implement log files
# implement colors
# implement validations
# implement validations through functions
# your script should check package is already installed or not, if already installed print yellow color
# if installed just print package is alredy installed, it should not run install command

USERID=$(id -u)
DATE=$(date +%F)
SCRIPT_NAME=$0
LOGDIR=/home/centos/shell-script.logs/$SCRIPT_NAME-$DATE.log

#colors
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
echo "Error : Please run with root access"
exit 1
fi
VALIDATE(){

     if [ $1 -ne 0 ]
     then
     echo "$i installating $2.... $R Failure $N"
     exit 1
     else
     echo "$i Installation $2..... $G Success $N"
     fi
}

for i in $@
do
   yum list installed $i
   if [ $? -ne 0 ]
   then
   echo "$i not installed,Lets Instal.."
     yum install $i -y &>>$LOGDIR
     VALIDATE $? "$i"
     else
     echo " $i Already installed"
     fi
done



