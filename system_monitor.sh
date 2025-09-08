#!/usr/bin/env bash
set -euo pipefail


# ----------------------------
# Linux System Monitoring Script
# Author: <Your Name>
# ----------------------------
# What it does:
# 1) Appends a timestamped report to system_report.log
# 2) Captures Disk, Memory, CPU Load, and Top 5 CPU-hungry processes


LOG_FILE="system_report.log"


{
echo "=============================="
echo " System Report - $(date '+%Y-%m-%d %H:%M:%S %Z')"
echo "=============================="


echo -e "\nOS & Kernel:"
uname -a || true


echo -e "\nDisk Usage:"
df -h


echo -e "\nMemory Usage:"
free -h


echo -e "\nCPU Load (1/5/15 min):"
uptime


echo -e "\nTop 5 Processes by CPU (%):"
# Print header + top 5 entries
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | awk 'NR==1 || NR<=6'


} >> "$LOG_FILE"


echo "Report appended to $LOG_FILE" 
