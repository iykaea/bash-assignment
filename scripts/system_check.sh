#!/bin/bash
mkdir -p logs
LOG="logs/system_report_$(date '+ %Y-%m-%d').log"
{
	echo "---DISK USAGE ---"
	df -h
	echo -e "\n--- MEMORY USAGE ---"
	free -m
	echo -e "\n--- CPU LOAD ---"
	uptime
	echo -e "\n--- PROCESS COUNT ---"
	ps aux | wc -l
	echo -e "\n--- TOP 5 MEMORY USERS ---"
	ps aux --sort=-%mem | head -n 6
DISK_VAL=$(df / | grep / | awk '{print $5}' | sed 's/%//g')
if [ "$DISK_VAL" -gt 80 ]; then 
	echo -e "\nWARNING: DISK USAGE EXCEEDS 80% (${DISK_VAL}%)"
fi
} > "$LOG"
echo "Assignment B! saved to $LOG"
