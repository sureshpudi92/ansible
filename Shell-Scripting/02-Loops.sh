#!/bin/bash

for i in $@
do
    echo yum install $i -y
done