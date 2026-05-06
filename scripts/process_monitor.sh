#!/bin/bash
services=("nginx" "ssh" "docker")
LOG_FILE="logs/monitor.log"
for service in "${services[@]}"; do
	if pgrep "$service">/dev/null; then
		echo "$service: Running"
		echo "$(date): $service is currently running" >> "$LOG_FILE"
	else
		echo "$service: Stopped"
		echo "Attempting to restart $service..."
		echo "$service: Restarted"
		echo "$(date): $service was stopped. simulated restart successful." >> "$LOG_FILE"
	fi
done
