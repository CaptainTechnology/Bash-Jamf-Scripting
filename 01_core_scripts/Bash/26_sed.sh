#!/bin/bash
# sed 's/SEARCH_TERM/REPLACE_TERM/' filename

# text="The MacBook is a great Mac."
# echo "$text" | sed 's/Mac/Apple/' # The AppleBook is a great Mac.

# text="The MacBook is a great Mac."
# echo "$text" | sed 's/Mac/Apple/g' # The AppleBook is a great Apple.

# file="/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/26.1_sed.txt"

# sed -i '' 's/Apple/Bash/g' $file #edit file and replace Apple with Bash

# sed -i '' '3d' $file #delete 3rd line

# # sed -i '' '/hello/d' $file
# # sed -i '' '/Hello/d' $file

config="/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/26.1_sed.txt"

sed -i '' 's/FirewallEnabled=False/FirewallEnabled=True/' "$config"

sed -i '' 's/Filevault Status=Disable/Filevault Status=Enable/' "$config"