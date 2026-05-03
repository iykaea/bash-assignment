#!/bin/bash
mkdir -p ../backups
cp ../logs/system_stats.log ../backups/system_stats_backup_$(date +%F).log
> ../logs/system_stats.log
echo "Maintenance Complete: logs backed up and cleared!"