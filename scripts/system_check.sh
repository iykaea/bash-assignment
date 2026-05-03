#!/bin/bash
mkdir -p ../logs
echo "---------------------" >> ../logs/system_stats.log
echo "System Scan Date: $(date)" >> ../logs/system_stats.logs
echo "MEMORY USAGE:" >> ../logs/system_stats.log free -h >> ../logs/system_stats.log
echo -e "\nDISK SPACE:"  >> ../logs/system_stats.log df -h | grep '^/dev/' >> ../logs/system_stats.log
echo "scan complete! stats saved to logs/system_stats.log"
