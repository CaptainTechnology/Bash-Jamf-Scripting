#!/bin/bash


# awk '{print $0}' 24_2_sample.txt #print everthing
# awk '{print $NF}' 24_2_sample.txt #print last field NF (number of field)
# awk '{print $1,$2}' 24_2_sample.txt # print field 1 and 2

# #search a word
# awk '/Paul/{print}' 24_2_sample.txt

# # print line number
# awk '{print NR}' 24_2_sample.txt

# print line number and data
# awk '{print NR,$0}' 24_2_sample.txt
# awk '{print $20}' 24_2_sample.txt

# print specific line Row
# awk 'NR==2 {print $0}' 24_2_sample.txt

# print range rows and line numbers
# awk 'NR==2,NR==5 {print NR,$0}' 24_2_sample.txt # print row from 2 to 5

#print blank line in

# awk 'NF==0 {print NR,$0}' 24_2_sample.txt 


# search multiple words, this is case sensative Paul and paul are not equal

# awk '/Paul|Raju|Alex/ {print $0}' 24_2_sample.txt

# ignore case sensative
# awk '/paul/ {print $0}' 24_2_sample.txt
# awk 'BEGIN{IGNORECASE=1} /paul/ {print $0}' 24_2_sample.txt # this does't allow in bash

# awk 'tolower($0) ~  /paul/ {print $0}' 24_2_sample.txt
# grep -i "paul" 24_2_sample.txt # good for this type of task

grep -i "alex" 24_2_sample.txt | awk '{print $1}'
grep -i "alex" 24_2_sample.txt | awk 'NR==1{print $1}' # print first occurance only





# # Extract the 3rd column
# loggedInUser=$(ls -l /dev/console | awk '{print $3}')
# echo "$(ls -l /dev/console)" # crw-------  1 nykaa-it  staff  0 Aug  4 17:58 /dev/console

# echo "The user is: $loggedInUser"