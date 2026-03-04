#!/bin/bash

# Check free ram
FREE_SPACE=$(vm_stat | awk '
/Pages free/ {free=$3}
/Pages inactive/ {inactive=$3}
END {printf "%d\n", (free+inactive)*4096/1024/1024}')

# Threshold
TH=500

# Check If it is less than threshold
if [[ $FREE_SPACE -lt $TH ]]
then
  echo "WARNING, RAM is running low - $FREE_SPACE MB"
else
  echo "RAM Space is sufficient - $FREE_SPACE MB"
fi