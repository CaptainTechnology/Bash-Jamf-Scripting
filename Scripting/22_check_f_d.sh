

#!/bin/bash
folder="/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting"

echo "$[[ -d $folder ]]"

if [[ -d $folder ]]
then
    echo "folder exist  "
    sleep 1
elif [[ ! -d $folder ]]
then
    echo "Folder doesn't exit"
else
    echo "we can't identify"
fi

file="/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/1-basic.sh"
if [[ -f $file ]]
then
    echo "file exist  "
    sleep 1
elif [[ ! -f $file ]]
then
    echo "File doesn't exit"
else
    echo "we can't identify"
fi
