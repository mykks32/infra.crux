#!/bin/bash

# nohup ./script.sh &


# Example script to demonstrate nohup

echo "Script started for Nohup started it in background"
date
sleep 10   # Simulate a task
echo "Script finished"

# To run the script in background
# nohup ./07_nohup.sh > output/script.log 2>&1 &

# After completion -> [1]  + done       nohup ./07_nohup.sh > output/script.log 2>&1

# Check if its running
# ps aux | grep 07_nohup.sh