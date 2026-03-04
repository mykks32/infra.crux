#!/bin/bash

# Send Mail if disk storage is ok or alert if less than 300

# Recipient email address
TO="076bct082@ioepc.edu.np"
THRESHOLD=300

# Disk Free space left
DISK_FREE_SPACE=$(df -g / | awk 'NR==2 {print $4}')

DATE=$(date)

if [ "$DISK_FREE_SPACE" -le "$THRESHOLD" ]; then
  SUBJECT="Disk Space Alert - $DATE"
  BODY="Warning: Disk free space is ${DISK_FREE_SPACE} less than Threshold: ${THRESHOLD}."
else
  SUBJECT="Disk Space Status OK - $DATE"
  BODY="Disk free space is normal - ${DISK_FREE_SPACE}%."
fi

# Send email via postfix
# echo "Body of email" | mail -s "Subject of email" recipient@example.com
echo "$BODY" | mail -s "$SUBJECT" "$TO"
