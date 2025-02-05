#!/bin/bash
# Use $(( expression )) for calculations:

number1=$1
number2=$2
sum=$((number1 + number2))  #  addition
echo "Sum of $number1 + $number2 is: $sum"
