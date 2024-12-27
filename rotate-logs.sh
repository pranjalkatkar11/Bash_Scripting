#!/bin/bash 
LOG_DIR="/e/Backup/File-2" 
MAX_SIZE=104857600  # 100MB in bytes 
 

for log in $LOG_DIR/*.log; do 
    if [ $(stat -c %s "$log") -gt "$MAX_SIZE" ]; then 
        TIMESTAMP=$(date +%Y%m%d_%H%M%S) 
        gzip "$log" 
        mv "$log.gz" "$LOG_DIR/archive/log_$TIMESTAMP.log.gz" 
        echo "Log file $log rotated and compressed." 
    fi
done