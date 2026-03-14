#!/bin/bash

# If you want to maintain the logging for
# your script, you can use logger in your script.

# You can find the logs under
# /var/logs/messages

# Example: #logger "Hey Buddy"

# Log a simple message
logger -t "${0}" -p user.info "Script started successfully"
echo "Message sent to system log."

# Correct log streaming for macOS
# Shows messages from the last hour
# log show --predicate "eventMessage contains \"${0}\"" --last 1h

# log stream doesn’t just show past logs; it follows the log in real time.
# log stream --predicate "eventMessage contains \"${0}\""