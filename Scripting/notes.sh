#!/bin/bash

# Script Name: Setup Cron Job
# Purpose: Make the target script executable and create a cron job.
# Schedule: Every day at 10:30 AM

SCRIPT="/usr/local/Jamf_Script/crontab.sh"

# Make the script executable
chmod +x "$SCRIPT"

# Add the cron job
(crontab -l 2>/dev/null; echo "30 10 * * * /bin/bash $SCRIPT") | crontab -

echo "Cron job configured successfully."