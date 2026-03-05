#!/bin/bash

# Read command
read -r -p "Enter the command: " COMMAND

# Show options
echo "Enter Options:"
echo "1. [1-5]_basics"
echo "2. [6-34]_file_management"
echo "3. [35-43]_utility"
echo "4. [44-48]_zip_unzip"
echo "5. [49-67]_download_files"
echo "6. [68-69]_access_remote_server"
echo "7. [70-72]_working_with_permissions"
echo "8. [73-76]_memory_info"
echo "9. [77-81]_system_info"
echo "10. [82-89]_process_management"
echo "11. [90-96]_networking_info"
echo "12. [97-104]_user_creation"

# Read option and filename
read -r -p "Enter option folder name: " OPTIONS
read -r -p "Enter filename: " FILE_NAME

# Create directory if it doesn't exist
mkdir -p guide/"$OPTIONS"

# Save man page output
man "$COMMAND" | col -b >> guide/"$OPTIONS"/"$FILE_NAME" 2>&1

echo "Saved to guide/$OPTIONS/$FILE_NAME"