#!/bin/bash

word="mississipi"

count=$(echo "$word" | grep -o 's'|ws -l)

echo "number of s in $word is $count"