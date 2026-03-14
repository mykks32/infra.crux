#!/bin/bash

# If we can enable the debugging of the script using below in the script

# set -x -> enable debugging
# set -e -> exit immediately if any command fails
# set +x -> Disable debugging


# Enable debugging
set -x

# Exit immediately if any command fails
set -e

echo "Starting the script..."
pwd
echo "This is just a test of set -x"
date

# Deliberate failing command
ls /nonexistent_directory

# Disable debugging
set +x
echo "Debugging turned off"