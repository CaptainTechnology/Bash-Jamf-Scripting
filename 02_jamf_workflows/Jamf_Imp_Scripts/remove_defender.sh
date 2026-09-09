#!/bin/bash

APP="Microsoft Defender"

# Check if Defender is installed
if [ ! -d "/Applications/Microsoft Defender.app" ]; then
    echo "$APP is not installed."
    exit 0
fi

# Quit Defender if running
if pgrep -x "$APP" >/dev/null; then
    echo "Closing $APP..."
    osascript -e 'tell application "Microsoft Defender" to quit'
    sleep 10
    pkill -9 -x "$APP" 2>/dev/null
fi

echo "Running Microsoft Defender uninstaller..."

# Replace this path with your organization's official Defender uninstall script
"/Library/Application Support/Microsoft/Defender/uninstall/uninstall.sh"

# Update Jamf inventory
# jamf recon

echo "Microsoft Defender has been removed."

exit 0