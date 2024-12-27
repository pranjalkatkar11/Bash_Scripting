#!/bin/bash
LOG_DIR="/e/Backup/File-2"  # Adjust path for WSL
MAX_SIZE=104857600  # 100MB in bytes

mkdir -p "$LOG_DIR/archive"  # Ensure archive directory exists

found_files=false  # Flag to track if any files are found

for log in "$LOG_DIR"/*.log; do
    if [ -e "$log" ]; then  # Check if the file exists
        found_files=true
        FILE_SIZE=$(stat -c %s "$log" 2>/dev/null || echo 0)
        if [ "$FILE_SIZE" -gt "$MAX_SIZE" ]; then
            TIMESTAMP=$(date +%Y%m%d_%H%M%S)
            gzip "$log" && mv "$log.gz" "$LOG_DIR/archive/log_$TIMESTAMP.log.gz"
            echo "Log file $log rotated and compressed."
        else
            echo "File $log is within size limit."
        fi
    fi
done

if ! $found_files; then
    echo "No .log files found in $LOG_DIR."
fi