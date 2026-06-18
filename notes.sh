#!/bin/bash
# create your won typeof

# typeof() {
#   local var="$1"

#   # Check integer
#   if [[ "$var" =~ ^-?[0-9]+$ ]]; then
#     echo "integer"

#   # Check float
#   elif [[ "$var" =~ ^-?[0-9]+\.[0-9]+$ ]]; then
#     echo "float"

#   # Check boolean
#   elif [[ "$var" == "true" || "$var" == "false" ]]; then
#     echo "boolean"

#   # Default
#   else
#     echo "string"
#   fi
# }


#!/bin/bash

for file in 0*; do
  # Remove only leading zero(s)
  new_name=$(echo "$file" | sed 's/^0*//')
  
  # Avoid empty filename (edge case like "000")
  if [ -z "$new_name" ]; then
    continue
  fi

  mv "$file" "$new_name"
done