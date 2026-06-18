#!/bin/bash

bug=4
i=0

while true; do
  echo "Checking bugs..."
  ((i++))
  sleep 1

  if (( i == bug )); then
    echo "Bug found!"
    break
  fi
done