#!/bin/bash

BACKUP_FILE="backup_$(date +%Y%m%d).tar.gz"
file_list=()

for file in ~/*; do
    if [ -f "$file" ]; then
        file_list+=("$file")
    fi
done

if [ ${#file_list[@]} -eq 0 ]; then
    echo "No files to backup."
else
    tar -czf ~/"$BACKUP_FILE" "${file_list[@]}"
    echo "Backup created successfully: $BACKUP_FILE"
fi