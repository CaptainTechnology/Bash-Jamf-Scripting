#!/bin/bash

# -lt → less than
# -ge → greater than or equal
# -le → less than or equal
# -eq → equal (you already used)
# -ne -> not equal to
# && → logical AND
# ||

#!/bin/bash

# read -p "Enter the marks: " mark

# if [[ $mark -lt 0 ]]; then
#     echo "Invalid marks"

# elif [[ $mark -lt 33 ]]; then
#     echo "Fail"

# elif [[ $mark -ge 33 && $mark -lt 50 ]]; then
#     echo "Pass"

# elif [[ $mark -ge 50 && $mark -lt 75 ]]; then
#     echo "Second Division"

# elif [[ $mark -ge 75 && $mark -le 100 ]]; then
#     echo "First Division"

# else
#     echo "Invalid input (greater than 100)"
# fi


# read -p "Enter Your Age : " age

# if [[ $age -lt 0 || $age -gt 80 ]]
# then
#     echo "You can't vote due to age limit"
# elif [[ $age -lt 18 ]]
# then 
#     echo "You can't vote, You are below 18"
# elif [[ $age -ge 18 ]]
# then
#     echo "You can Vote"
# else
#     echo "Invalid Input"
# fi

# if [[ 1 -gt 10 ]]
# then
#     echo "yes"
# else
#     echo "No"
# fi