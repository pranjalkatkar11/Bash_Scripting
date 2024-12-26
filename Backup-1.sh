#!/bin/bash

# Set source and destination directories
SOURCE_DIR="/e/Backup/File-2"
BACKUP_DIR="/e/Backup/File-1"
BACKUP_FILE="$BACKUP_DIR/config_backup_.tar.gz"

if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
  echo "Backup directory created: $BACKUP_DIR"
fi

# Create the tar.gz backup file
if [ -f "$SOURCE_DIR/Pranjal.txt" ]; then
  tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .
  echo "Backup completed: $BACKUP_FILE"
else
  echo "Source file not found: $SOURCE_DIR/Pranjal.txt" >&2
  exit 1
fi

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully!"
else
  echo "Backup failed!" >&2
  exit 1
fi
