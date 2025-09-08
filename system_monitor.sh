#!/bin/bash

# File to save logs
LOGFILE="system_report.log"

# Collect data
DATE=$(date)
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s", $5}')

# Output message
REPORT="==== System Report ====
Date: $DATE
CPU Usage: $CPU%
Memory Usage: $MEM
Disk Usage: $DISK
=========================="

# Print to screen
echo "$REPORT"

# Append to log file
echo "$REPORT" >> "$LOGFILE"
