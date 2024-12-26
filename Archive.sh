#!/bin/bash
SOURCE_DIR="/e/DOCp/ICE PAYROLL"
ARCHIVE_DIR="/e/Task_01/backup_02"

mkdir -p "$ARCHIVE_DIR"
find "$SOURCE_DIR" -type f -mtime +7 -exec mv {} "$ARCHIVE_DIR" \;

echo "Files older than 7 days moved to $ARCHIVE_DIR."