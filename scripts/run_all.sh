#!/bin/bash
set -euo pipefail
LOG_FILE="logs/app.log"
while true; do
	echo "---Assignment Master Menu---"
	echo "1. Run all"
	echo "2. System check"
	echo "3. Backup"
	echo "4 Exit"
	read -p "select option: " choice 
	echo "$(date): selected $choice" >> "$LOG_FILE"
case "$choice" in
	1) ./scripts/system_stats.sh && ./scripts/backup.sh logs && ./scripts/process_monitor.sh ;;
	2) ./scripts/system_stats.sh logs ;;
	3) ./scripts/backup.sh logs ;;
	4) exit 0 ;;
esac
done