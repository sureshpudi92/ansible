#!/bin/bash
# write a shell script to print numbers divided by 3 & 5 and not 15…..range 1…100



for i in {1..100};do
    if ([ '$i % 3'== 0 ] || [ '$i % 5'== 0 ]) $$ [ '$i % 15' != 0 ];
    then
        echo $i
    fi;
done
