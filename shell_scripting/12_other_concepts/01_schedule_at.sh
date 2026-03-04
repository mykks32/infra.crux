#!/bin/bash

# For scheduling only one time, use AT

# at 12:09 PM
# <your_command>
# eg bash /Users/srikriydv/Desktop/infra.crux/shell_scripting/12_other_concepts/01_schedule_at.sh
# Ctrl + D

# Absolute time today
# 2:30 PM today
# at 14:30

# Absolute time with date
# 10 AM on March 6
# at 10:00 Mar 6

# Relative time using '+'
# 5 minutes from now
# at now + 5 minutes
# 2 hours from now
# at now + 2 hours
# 3 days from now
# at now + 3 days

# Special keywords
# Today at 12:00 AM
# at midnight
# Today at 12:00 PM
# at noon
# Today at 4:00 PM
# at teatime

# atq to check scheduled job
# atrm <id> to remove the schedule

echo "Scheduled Job run $RANDOM $(date)" >> output/schedule_at_log.txt 2>&1
