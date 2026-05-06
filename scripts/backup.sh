#!/bin/bash
TARGET_DIR=$1
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="backups"
LOG_FILE="logs/backup.log"
if [ ! -d "$TARGET_DIR" ]; then
	echo "Error: Directory not found" && exist 1
fi
mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar,gz" "$TARGET_DIR"
echo "$(date): Backed up $TARGET_DIR" >> "$LOG_FILE"
ls -t $BACKUP_DIR/backup_*.tar.gz 2>/dev/null | tail -n +6 | xargs rm -f 2>/dev/null
