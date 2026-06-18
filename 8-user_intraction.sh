
#!/bin/bash

# name=captain
# echo $name


# read name

# echo "User Name is : $name"

# read -p "Enter the user name : " userName

# echo "User Name is : $userName"


read -p "Enter multiple names (space-separated): " -a names

echo "All names are: ${names[@]}"

# Access individually
echo "First name: ${names[0]}"
echo "Second name: ${names[1]}"