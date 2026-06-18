
#!/bin/bash

echo "Welcome to site check"

read -p "Enter the site name : " site

ping -c 1 $site

if [[ $? -eq 0 ]]
then
    echo "$site is Accessable"
else
    echo "$site is not Accessable"
fi
