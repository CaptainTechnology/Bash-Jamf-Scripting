
#!/bin/bash

count=0
num=10

# while [[ $count -le $num ]]
# do 
#     echo "Number is : $count"
#     let count++
# done

# file=data.csv

# while IFS=, read -r username department device
# do
#     echo "User: $username"
#     echo "Department: $department"
#     echo "Device: $device"
#     echo "----------------------"
# done < "$file"

    
#!/bin/bash
# read mac os inventory data
FILE="/Users/nykaa-it/Desktop/Bash Scripting/2 Computers in macOs _= sequia (15).csv"

while IFS=',' read -r computer secureboot model managed serial lastcheckin osversion fullname filevault gatekeeper drivefull enrollment
do
    echo "-----------------------------------"
    echo "Computer Name : $computer"
    echo "Model         : $model"
    echo "Serial Number : $serial"
    echo "OS Version    : $osversion"
    echo "Managed       : $managed"
    echo "Last Check-in : $lastcheckin"
    echo "FileVault     : $filevault"
    echo "Disk Used %   : $drivefull"
    echo "-----------------------------------"

done < <(tail -n +2 "$FILE")