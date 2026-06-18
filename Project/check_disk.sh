#!/bin/bash

# Get disk usage percentage of root (/)
DISK_USED=$(df -h / | awk 'NR==2 {gsub("%","",$5); print $5}')

# Threshold
THRESHOLD=80

echo "Disk Usage: ${DISK_USED}%"

if [ "$DISK_USED" -gt "$THRESHOLD" ]; then
    echo "⚠️ WARNING: Disk usage is high! (${DISK_USED}%)"
else
    echo "✅ Disk usage is normal (${DISK_USED}%)"
fi