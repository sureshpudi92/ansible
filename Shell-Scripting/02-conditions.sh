#!/bin/bash

# check whether file exists or not

File="test.txt"
if [ -f "$File" ]
then
echo "file exist"
else
echo "file does not exist"
fi