#!/bin/bash

# In case if you don't wanna print the output
# of the command on terminal or write in a file

# We can redirect output to
# /dev/null

# Examples:
# #cd /root &> /dev/null

# Example 1: redirect both stdout and stderr
cd /dev &> /dev/null || {
    echo "Failed to change directory to /root"
    exit 1
}

echo "Now in /dev, continuing the script..."