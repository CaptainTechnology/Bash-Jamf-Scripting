

# run task at specific time

#at time -> give commonds => ctrl+d save it
#atq it check the pending task
#atrm <id> -> remove the sheduled task


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