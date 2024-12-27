#!/bin/bash
CPU_THRESHOLD=0
MEM_THRESHOLD=0
DISK_THRESHOLD=0
EMAIL="pranjalkatkar.117@gmail.com"

CPU_USAGE=$(top -bn1 | grep "CPU(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}' )
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g')
#DISK_USAGE=$(df /| grep / | awk '{print $5}' | sed 's/%//g')

echo "cpu usage :$CPU_USAGE"

echo "$MEM_USAGE"

echo "Disk Usage: $DISK_USAGE%"
#echo "$DISK_USAGE"

# Check if CPU usage exceeds threshold using bc for floating-point comparison
if  [ $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc) -eq 1 ]; then
    echo "CPU usage is high: $CPU_USAGE%"
fi

# Check if disk usage exceeds threshold
if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "Disk usage is high: $DISK_USAGE%"
fi

# Check if memory usage exceeds threshold using bc for floating-point comparison
if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
    echo "Memory usage is high: $MEM_USAGE%"
fi