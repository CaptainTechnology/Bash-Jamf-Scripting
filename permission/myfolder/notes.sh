#!/bin/bash
# create your won typeof

typeof() {
  local var="$1"

  # Check integer
  if [[ "$var" =~ ^-?[0-9]+$ ]]; then
    echo "integer"

  # Check float
  elif [[ "$var" =~ ^-?[0-9]+\.[0-9]+$ ]]; then
    echo "float"

  # Check boolean
  elif [[ "$var" == "true" || "$var" == "false" ]]; then
    echo "boolean"

  # Default
  else
    echo "string"
  fi
}

