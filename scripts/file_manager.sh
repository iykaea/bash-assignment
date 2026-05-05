#!/bin/bash
mkdir -p logs
LOG_FILE="logs/file_manager.log"
ACTION=$1
FILENAME=$2
NEW_NAME=$3
case $ACTION in
create)
	if [ -f "$FILENAME" ]; then 
		echo "$(date): ERROR - $FILENAME exists" >> "$LOG_FILE"
		echo "Error: file already exists!"
	else
		touch "$FILENAME"
		echo "$(date): created $FILENAME" >> "$LOG_FILE"
		echo "file created: $FILENAME"
	fi
;;
delete)
	if [ -f "$FILENAME" ]; then rm "$FILENAME"
	echo "$(date): Deleted $FILENAME" >> "$LOG_FILE"
	echo "File deleted: $FILENAME"
else
	echo "Error: File not found!"
fi
;;
list)
	echo "$(date): Listed files" >> "$LOG_FILE"
	ls -p | grep -v /
;;
rename)
	if [ -f "$FILENAME" ]; then mv "$FILENAME" "$NEW_NAME" 
	echo "$(date): Renamed $FILENAME to $NEW_NAME" >> "LOG_FILE"
else
	echo "Error: File not found!"
fi
;;
*)
	echo "Usage: ./file_manager.sh {create|delete|list|rename} [filename]"
;;
esac