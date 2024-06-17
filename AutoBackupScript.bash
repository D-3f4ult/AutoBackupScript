#!/bin/bash

SOURCE_DIR="$HOME/Documents"  
BACKUP_DIR="$HOME/Backup"     
LOG_FILE="$BACKUP_DIR/backup.log"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="backup_$DATE.tar.gz"

if [ ! -d "$BACKUP_DIR" ]; then
    echo "Creating backup directory at $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
fi

echo "Starting backup: $SOURCE_DIR to $BACKUP_DIR/$ARCHIVE_NAME"
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$SOURCE_DIR" .

if [ $? -eq 0 ]; then
    echo "$DATE: Backup successful: $ARCHIVE_NAME" >> "$LOG_FILE"
    echo "Backup successful!"
else
    echo "$DATE: Backup failed" >> "$LOG_FILE"
    echo "Backup failed!"
fi

echo "Deleting old backups..."
find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +7 -exec rm {} \;

echo "Backup process completed."
