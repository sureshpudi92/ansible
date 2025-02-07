#!/bin/bash


# improvements
# implement log files
# implement colors
# implement validations
# implement validations through functions
# your script should check package is already installed or not, if already installed print yellow color
# if installed just print package is alredy installed, it should not run install command

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "Error : Please run with root access"

for i in $@
do
     yum install $i -y
done

