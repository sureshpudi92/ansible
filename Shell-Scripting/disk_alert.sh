#!/bin/bash

THRESHOLD=80
EMAIL="sureshpudi1992@gmail.com"
HOSTNAME=$(hostname)

df -h | awk '{print $5 " " $6}' | grep -Eo '[0-9]+%' | while read -r usage; do
    usage=${usage%\%}  # Remove '%' sign
    if [ "$usage" -gt "$THRESHOLD" ]; then
        echo "Warning: Disk usage exceeded $THRESHOLD% on $HOSTNAME. Current usage: $usage%" | mail -s "Disk Space Alert on $HOSTNAME" "$EMAIL"
    fi
done
