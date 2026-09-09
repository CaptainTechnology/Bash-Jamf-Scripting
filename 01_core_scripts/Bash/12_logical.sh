#!/bin/bash

read -p "Enter age: " age
read -p "Enter country: " country
read -p "Do you have ID (yes/no): " has_id
read -p "Enter username: " username

echo "----- Result -----"

# 1. AND (&&) → both conditions must be true
if (( age >= 18 )) && [[ $country == "India" ]]; then
    echo "Eligible to vote in India"
else
    echo "Not eligible to vote"
fi

# 2. OR (||) → at least one condition true
if (( age >= 18 )) || [[ $has_id == "yes" ]]; then
    echo "Allowed entry (age or ID valid)"
else
    echo "Entry denied"
fi

# 3. NOT (!) → reverse condition
if [[ ! $username == "admin" ]]; then
    echo "You are NOT admin"
else
    echo "Welcome Admin"
fi

# 4. Combination (&& + || + !)
if (( age > 18 )) && [[ $country == "India" || $country == "USA" ]] && [[ ! $username == "blocked" ]]; then
    echo "Access granted"
else
    echo "Access denied"
fi