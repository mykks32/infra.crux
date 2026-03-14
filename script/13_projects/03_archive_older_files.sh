#!/bin/bash

# Steps of script:
# Provide the path of directory
# Check if the directory is present or not
# Create 'archive' folder if not already present
# find all the files with size more than 20MB
# Compress each file
# Move the compressed files in 'archive' folder
# Make a cron job to run the script every day at given time

# $Revision:001$
# Wed Mar  4 16:46:58 +0545 2026

# Variables
BASE=/Users/srikriydv/Desktop/infra.crux/shell_scripting/13_projects
DEPTH=1

# Check if the directory is present or not
if [ ! -d "$BASE" ]; then
  echo "Directory does not exist: $BASE"
  exit 1
fi

# Create 'archive' folder if not present
if [ ! -d "$BASE/archive" ]; then
  mkdir "$BASE/archive"
  echo "Created archive directory"
fi

# Find files larger than 20MB and archive them
# Safe: using 'while read' instead of 'for i in $(find ...)'
find "$BASE/larger" -maxdepth "$DEPTH" -type f -size +20M | while read -r FILE
do
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] Archiving $FILE ===> $BASE/archive"

    # Compress the file
    gzip "$FILE" || { echo "Failed to compress $FILE"; exit 1; }

    # Move compressed file to archive
    mv "${FILE}.gz" "$BASE/archive/" || { echo "Failed to move ${FILE}$RANDOM.gz"; exit 1; }

    echo "[$(date "+%Y-%m-%d %H:%M:%S")] Successfully archived: ${FILE}.gz"
done

echo "Archiving process completed."

# CRON JOB SETUP
# Run: crontab -e  and add the line below
# Runs every day at 11 PM:
#
# 0 23 * * * /opt/homebrew/bin/bash /Users/srikriydv/Desktop/infra.crux/shell_scripting/13_projects/03_archive_older_files.sh >> /tmp/archive_log.txt 2>&1
