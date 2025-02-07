#!/bin/bash

# Improvements
# - Implement log file rotation (delete old logs)
# - Implement colors
# - Implement validations
# - Implement validations through functions
# - Check if the package is already installed before attempting installation

USERID=$(id -u)
DATE=$(date +%F)
SCRIPT_NAME=$(basename $0)
LOGDIR="/home/centos/shell-script.logs"
LOGFILE="$LOGDIR/$SCRIPT_NAME-$DATE.log"

# Colors
R="\e[31m"  # Red
G="\e[32m"  # Green
Y="\e[33m"  # Yellow
N="\e[0m"   # Reset

# Ensure log directory exists
mkdir -p "$LOGDIR"

# Delete logs older than 2 weeks
find "$LOGDIR" -type f -name "*.log" -mtime +14 -exec rm -f {} \;

# Check if script is run as root
if [ $USERID -ne 0 ]; then 
    echo -e "${R}Error: Please run with root access${N}"
    exit 1
fi

# Function to validate command execution
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 installation... ${R}Failure${N}"
        exit 1
    else
        echo -e "$2 installation... ${G}Success${N}"
    fi
}

# Loop through provided package names
for i in "$@"; do
    yum list installed "$i" &>/dev/null
    if [ $? -ne 0 ]; then
        echo "$i not installed, installing now..."
        yum install "$i" -y &>>"$LOGFILE"
        VALIDATE $? "$i"
    else
        echo -e "${Y}$i is already installed.${N}"
    fi
done
