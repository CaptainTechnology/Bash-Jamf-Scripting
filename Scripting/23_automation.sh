

# run task at specific time

#at time -> give commonds => ctrl+d save it
#atq it check the pending task
#atrm <id> -> remove the sheduled task

# at TIME
# at Command Syntax
# at TIME
# at now + 5 minutes # Then enter the command:
# echo "Hello World" > /tmp/test.txt
# Press Ctrl + D to schedule the job.

# at now                  # Run immediately
# at now + 5 minutes      # Run after 5 minutes
# at now + 2 hours        # Run after 2 hours
# at now + 1 day          # Run after 1 day
# at 5:00 PM              # Run today at 5:00 PM
# at 17:00                # Run today at 17:00 (24-hour format)
# at midnight             # Run at 12:00 AM
# at noon                 # Run at 12:00 PM
# at tomorrow             # Run tomorrow at the current time
# at 10:00 AM tomorrow    # Run tomorrow at 10:00 AM
# at 4:00 PM Aug 10       # Run on Aug 10 at 4:00 PM
# at 16:00 2026-08-10     # Run on a specific date and time
# atq                     # List all scheduled jobs
# atrm 1                  # Remove job with ID 1
# at -c 1                 # Display the details of job ID 1
# atrm *                  # Removed all the sheduled jobs


# repeatativ task

# ***** commond goto crontab.guru for more information
# https://crontab.guru/ for more information
#crontab -e
# * * * * * command_to_execute1
# │ │ │ │ │
# │ │ │ │ └── Day of week (0 - 7) (Sunday = 0 or 7)
# │ │ │ └──── Month (1 - 12)
# │ │ └────── Day of month (1 - 31)
# │ └──────── Hour (0 - 23)
# └────────── Minute (0 - 59)

#crontab -e
#crontab -l
#crontab -r

# * * * * * command1 ; command2 ; command3
# * * * * * command1 && command2 && command3 # run if previous success
# * * * * * command1 || command2 # run next only if previous fail

# best approach 
#make a script.sh and chmod +x script.sh
#crontab -e
# * * * * * /path/to/script.sh
# 1 * * * * "/Users/nykaa-it/Desktop/Bash Scripting/cron_script.sh" -> escape space
# or
# 1 * * * * /Users/nykaa-it/Desktop/Bash\ Scripting/cron_script.sh -> with quatation ""
# to save -> esc -> :wq


0 2 * * * /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run every day at 2:00 AM

5 * * * * /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run every 5 minutes

0 * * * * /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run every hour

30 18 * * * /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run every day at 6:30 PM

0 9 * * 1 /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run every Monday at 9:00 AM

0 0 1 * * /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run on the 1st day of every month at midnight

0 0 1 1 * /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run every year on January 1st at 12:00 AM

@reboot /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run once after system reboot

@daily /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run once every day

@weekly /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run once every week

@monthly /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run once every month

@yearly /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/cron_script.sh
# Run once every year