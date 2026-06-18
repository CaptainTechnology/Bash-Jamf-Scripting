#!/bin/bash

echo "1. Show Date"
echo "2. List Files/Folders"
echo "3. Enter Name (captain/jack)"

read -p "Enter your choice: " choice

case $choice in
  1)
    echo "Today's date is:"
    date
    ;;
  
  2)
    echo "Files and folders:"
    ls
    ;;
  
  "captain"|jack)
    echo "User entered: $choice"
    ;;
  
  *)
    echo "Invalid choice"
    ;;
esac