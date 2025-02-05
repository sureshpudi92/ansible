#!/bin/bash
# read command is used to to read the user input
#use -s to not visible while entering

echo "enter your username"
read  user_name
echo " username is $user_name"
echo "enter your password"
read  -s Password
echo "password is: $Password"