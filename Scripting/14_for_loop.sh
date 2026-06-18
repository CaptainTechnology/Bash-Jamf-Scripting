
#!/bin/bash

echo "----- Example 1: Basic for loop -----"
# for i in 1 2 3 4 5
# do
#   echo "Number: $i"
# done

# for i in 1 2 3 4 5
# do 
#     echo "Number is : $i"
# done


# echo "----- Example 2: Range {1..5} -----"
# for i in {1..5}
# do
#   echo $i
# done

# echo "----- Example 3: Range with step {1..10..2} -----"

# for i in {1..10..2}
# do
#   echo $i
# done


# echo "----- Example 5: Array loop -----"
# arr=(A B C)
# echo "${arr[@]}"
# echo "${arr[@]}"
# for item in "${arr[@]}"
# do
#   echo $item
# done

# echo "----- Example 6: Loop through files -----"
# echo file in *
# echo * # files

# for file in *
# do
#   echo "File: $file"
# done

# echo "----- Example 7: Even/Odd check -----"

# for (( i=1; i<=5; i++ ))
# do
#   if (( i % 2 == 0 )); 
#   then
#     echo "$i is Even"
#   else
#     echo "$i is Odd"
#   fi
# done

# # get data from 

# for word in $(cat test.txt)
# do
#   echo "$word"
# done

# for i in 1 2 3 4 5 6 7 8 9 10
# do
#     echo "Number is : $i"
# done

# for i in {1..10}
# do  
#     echo "Num is : $i"
# done

myArr=(1 2 3 hello captain jack)
length=${#myArr[@]}

for ((i=0; i<$length; i++))
do
    echo ${myArr[i]}
done

