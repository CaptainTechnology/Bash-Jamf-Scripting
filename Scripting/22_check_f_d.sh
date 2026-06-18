

#!/bin/bash
folder="/Users/Nykaa-it/Desktop/Bash Scripting"



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

file="/Users/Nykaa-it/Desktop/Bash Scripting/1-basic.sh"
if [[ -f $file ]]
then
    echo "folder exist  "
    sleep 1
elif [[ ! -f $file ]]
then
    echo "Folder doesn't exit"
else
    echo "we can't identify"
fi
