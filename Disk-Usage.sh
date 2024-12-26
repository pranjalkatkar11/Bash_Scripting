#!/bin/bash

THRESHOLD=1

DISKUSAGE=$( df / | grep "/" | awk '{print $5}' | sed 's/%//g' )
echo "$DISKUSAGE"

if [ $DISKUSAGE -gt $THRESHOLD ];then
     echo "Disk usage is above $THRESHOLD%: Current usage is $DISKUSAGE%" >> /e/Task_01/backup_01/disk_usage.log
fi