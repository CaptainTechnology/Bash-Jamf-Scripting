#!/bin/bash

echo "===== BASH STRING GUIDE ====="
echo

# Create string
str="Hello World"
echo "String: $str"
# Length
echo "Length: ${#str}"

# # Concatenate
name="Anees"
full="$str $name"
echo "Concat: $full"
# echo

# # Substring
echo "First 5: ${str:0:5}"

# echo "From 6: ${str:6}"
# echo

# # Replace
echo "Replace: ${str/World/Bash}"
echo "Replace all: ${str//l/L}"
echo

# # Upper / Lower
# echo "Upper: ${str^^}"
# echo "Lower: ${str,,}"
# echo

# # Remove part
echo "Remove prefix: ${str#Hello }"
echo "Remove suffix: ${str% World}"
# echo

# # Check contains
# [[ "$str" == *"World"* ]] && echo "Contains: Yes" || echo "Contains: No"
# echo

# # Compare
# a="test"
# b="test"
# [[ "$a" == "$b" ]] && echo "Equal: Yes" || echo "Equal: No"
# echo

# # Empty check
# empty=""
# [[ -z "$empty" ]] && echo "Empty: Yes"
# [[ -n "$str" ]] && echo "Not empty: Yes"
# echo

# # Split to array
# text="one two three"
# read -a words <<< "$text"
# echo "Words: ${words[@]}"
# echo

# # Loop characters
# for ((i=0; i<${#str}; i++)); do
#   echo "Char $i: ${str:$i:1}"
# done
# echo

# # Loop words
# for word in $str; do
#   echo "Word: $word"
# done
# echo

# echo "===== END ====="