#!/bin/bash

echo "===== System Monitoring ====="

# Disk Usage
echo ""
echo "Disk Usage:"
df -h

# Memory Usage
echo ""
echo "Memory Usage:"
free -h

# Top CPU-consuming processes
echo ""
echo "Top CPU-consuming processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head

# Disk Alert
disk_usage=$(df / | awk 'END{print $5}' | sed 's/%//')

if [ $disk_usage -gt 80 ]
then
    echo "WARNING: Disk usage is above 80%"
else
    echo "Disk usage is under control"
fi
