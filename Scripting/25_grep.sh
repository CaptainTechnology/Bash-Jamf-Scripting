#!/bin/bash

file="/Users/nykaa-it/Desktop/Bash-Jamf-Scripting/Scripting/25.1_grep.txt"

# The grep command is used to search for text patterns within files. It's a powerful way to find specific text in large files or across many files.

# grep 'pattern' filename

# -i - Search ignoring case differences (uppercase or lowercase)
# -r - Search through all files in a directory and its subdirectories
# -v - Find lines that do not match the pattern

grep "Activation" $file # exact match
grep -i "activation" $file # 
grep "AcTivAtiOn" $file
