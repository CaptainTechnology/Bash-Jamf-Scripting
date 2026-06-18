#!/bin/bash

echo "===== BASH ARRAY GUIDE ====="
echo

# Create array
arr=(1 2 3 "banana" "mango")

# Access
echo "First: ${arr[0]}"
arr=(1 2 3)

echo ${arr[2]}      # 3
echo "${arr[2]}"    # 3 (safe - recommended)

echo $arr[2]        # 12 (WRONG)
echo "$arr[2]"      # 12 (WRONG)
echo "All (@): ${arr[@]}"
echo "All (*): ${arr[*]}"
echo

# Length
echo "Length: ${#arr[@]}"
echo

# Slice
echo "First 3: ${arr[@]:0:3}"
echo "From index 2: ${arr[@]:2}"
echo "2 elements: ${arr[@]:2:2}"
echo

# Add elements
arr+=("orange")
arr+=(9 10 11)
echo "After add: ${arr[@]}"
echo

# Remove elements
unset arr[3]
unset arr[1] arr[3]
echo "After remove: ${arr[@]}"
echo

# Indexes
echo "Indexes: ${!arr[@]}"
echo

# Update
arr[0]="grapes"
echo "After update: ${arr[@]}"
echo

# Reset array
temp=(a b c)
temp=()
echo "Temp cleared: ${temp[@]}"
echo

# Assoc array
declare -A user=([name]="Anees" [role]="Engineer")
echo "User: ${user[name]} (${user[role]})"
echo

# String → array
text="one two three"
read -a words <<< "$text"
echo "Words: ${words[@]}"
echo



# # Check value
# search="mango"
# found=false
# for item in "${arr[@]}"; do
#   [[ "$item" == "$search" ]] && found=true && break
# done
# echo "Contains: $found"
# echo



# # Loop values
# for item in "${arr[@]}"; do
#   echo "Val -> $item"
# done
# echo

# # Loop index
# for i in "${!arr[@]}"; do
#   echo "Idx $i = ${arr[$i]}"
# done
# echo

# # Loop assoc
# for key in "${!user[@]}"; do
#   echo "$key = ${user[$key]}"
# done
# echo

# echo "===== END ====="