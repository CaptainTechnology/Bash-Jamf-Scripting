#!/bin/bash

# available=$(df / | tail -1 | awk '{print $4}')
# available=$(df -h / | tail -1 | awk '{print $4}') | sed 's/[a-zA-Z]//g'
available=$(df -h / | tail -1 | awk '{print $4}' | sed 's/[a-zA-Z]//g')

echo ${available}
if [ "$available" -lt 80 ]; then
    # osascript -e 'display dialog "Your Mac is running low on disk space, your available storage is $available. Please clean up files or contact IT." buttons {"OK"}'
    osascript -e "display dialog \"Your Mac is running low on disk space, your available storage is $available GB. Please clean up files or contact IT.\" buttons {\"OK\"} default button \"OK\" with icon caution with title \"Disk Space Alert\""

fi

exit 0