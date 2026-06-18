

#!/bin/bash

# set -x # use for debugging show the steps
# set -x
# echo "hello captain"

# set -e # use to terminate the script when commond failed
# pwd
# kkkk
# echo "this will not run becouse terminated at kkk"

# echo $UID #login user id
# echo $RANDOM # random number will be genrated

# # ls > files.txt # save result in file
# date >> files.txt # save and previos result also

# ping -c 20 www.google.com > google_test.log 

# &> /dev/null # it only stop to print somethin in terminal, not run the process in the background

# echo ${0} # print the name of the script

# logger # use to save the message in /var/logs/message 
# logger "This Script name save in logger messsage log using logger ${0}"



# run script in background : nohup commond &

#observation 

for (( i=0; i<=5; i++ ))
do
    echo "$i"
    echo $i >> loop.txt
    #if terminal will be close then these task will be break
    sleep 1
done

#solution run the task in the background so that task will be perform even if terminal close and give the clear interface for work
# nohup commond & -> need to give execute permission to script file if use as commond
# without nohup when i close terminal executiong break and with nohup execution happend


