#!/bin/bash

# -lt → less than
# -ge → greater than or equal
# -le → less than or equal
# -eq → equal (you already used)
# -ne -> not equal to
# && → logical AND
# ||

#!/bin/bash

read -p "Enter the marks: " mark

if [[ $mark -lt 0 ]]; then
    echo "Invalid marks"

elif [[ $mark -lt 33 ]]; then
    echo "Fail"

elif [[ $mark -ge 33 && $mark -lt 50 ]]; then
    echo "Pass"

elif [[ $mark -ge 50 && $mark -lt 75 ]]; then
    echo "Second Division"

elif [[ $mark -ge 75 && $mark -le 100 ]]; then
    echo "First Division"

else
    echo "Invalid input (greater than 100)"
fi
