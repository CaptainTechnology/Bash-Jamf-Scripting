#!/bin/bash

# (
#  # ==============================================================================
#  # 📚 GREP REFERENCE NOTES
#  # ==============================================================================
#  # The grep command is used to search for text patterns within files. 
#  # It is a powerful way to find specific text in large files or across many files.
#  #
#  # Syntax: grep 'pattern' filename
#  #
#  # Common Flags:
#  # -i : Search ignoring case differences (uppercase or lowercase)
#  # -r : Search through all files in a directory and its subdirectories
#  # -v : Find lines that do not match the pattern
#  #
#  # Examples:
#  # file="/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/25.1_grep.txt"
#  # grep "Activation" $file       # Exact match
#  # grep -i "AcTivAtiOn" $file    # Case-insensitive
#  # grep "AcTivAtiOn" $file       # Will fail without -i
#  # ==============================================================================
 
 
#  # ==============================================================================
#  # 🚀 EXECUTABLE SCRIPT
#  # ==============================================================================
 
#  # 1. Define Variables
#  search_term="Provisioning UDID: 57FFC120-A62E-5CD6-A8AC-947EA54C7C42"
#  target_dir="/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting"
 
#  # 2. Execute Search (Run once for efficiency)
#  # Double-quoting variables is required when they contain spaces!
#  raw_output=$(grep -r --exclude="25_grep.sh" "$search_term" "$target_dir")
 
#  # 3. Parse the Output
#  # Extract ONLY the file location by splitting at the colon (-F':')
#  location=$(echo "$raw_output" | awk -F':' '{print $1}')
 
#  # Extract the results starting from line 2 to the end
#  result=$(echo "$raw_output" | awk 'NR>=2')
 
#  # (Commented Out) Separate the value based on the ':' separator and print the rest
#  # matched_text=$(echo "$raw_output" | awk -F':' '{print $2,$3}')
 
#  # 4. Print Results
#  # echo "Raw Grep Output :"
#  # echo "$raw_output"
#  # echo "File location : $location"
#  # echo "Result : $result"
# )

#practical for jamf extension attribute

# model Number

row_output=$(system_profiler SPHardwareDataType)

# echo $row_output
# # echo "$row_output" | grep -i "Model Name"
# echo "$row_output" | grep -i "Total Number of Cores" | awk -F ':' '{print $2}'

cores=$( system_profiler SPHardwareDataType | grep -i "Total Number of Cores" | awk -F ':' '{print $2}')
if [[ $cores -eq 4 ]]
then
    echo "Fourth core"
else
    echo "Not fourth core"
fi