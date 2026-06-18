#!/bin/bash

echo "Start script"

# sleep example
sleep 2

# run a command
ls test.txt

# check status using $?
if [ $? -eq 0 ]
then
    echo "File found"
    exit 0   # success
else
    echo "File not found"
    exit 1   # error
fi

# this will not run
echo "End script"

# ? give you the status of last commond failed (1) or success (0)