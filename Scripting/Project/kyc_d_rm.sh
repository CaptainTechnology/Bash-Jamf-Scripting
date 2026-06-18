#!/bin/bash

echo "===== Kyocera Driver Removal Started ====="

# Remove Kyocera printer queues only
lpstat -p 2>/dev/null | awk '{print $2}' | while read -r printer
do
    printer_info=$(lpoptions -p "$printer" 2>/dev/null)

    if echo "$printer_info" | grep -iq "kyocera"; then
        echo "Removing printer queue: $printer"
        lpadmin -x "$printer"
    fi
done

# Remove Kyocera driver folders
echo "Removing Kyocera driver folders..."

rm -rf "/Library/Printers/Kyocera"
rm -rf "/Library/Application Support/Kyocera"

# Remove Kyocera PPD files
echo "Removing Kyocera PPD files..."

find "/Library/Printers/PPDs" \
-type f \( -iname "*kyocera*" -o -iname "*kx*" \) \
-delete 2>/dev/null

# Remove Kyocera preference files
echo "Removing Kyocera preference files..."

rm -f /Library/Preferences/com.kyocera.*

# Refresh macOS printing service
echo "Refreshing printing service..."

launchctl kickstart -k system/org.cups.cupsd 2>/dev/null

sleep 5

echo "===== Kyocera Driver Removal Completed Successfully ====="

exit 0