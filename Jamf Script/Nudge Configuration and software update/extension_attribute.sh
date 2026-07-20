#!/bin/bash

# Get available software updates
AVAILABLE_UPDATES=$(/usr/sbin/softwareupdate --list 2>/dev/null)

# Look for a macOS version (e.g. 15.7.7, 16.0)
AVAILABLE_VERSION=$(echo "$AVAILABLE_UPDATES" | grep -oE 'macOS[[:space:]]+[A-Za-z]+[[:space:]]+[0-9]+(\.[0-9]+){1,2}' | head -1)

if [[ -n "$AVAILABLE_VERSION" ]]; then
    echo "<result>$AVAILABLE_VERSION</result>"
else
    echo "<result>No macOS update available</result>"
fi

exit 0