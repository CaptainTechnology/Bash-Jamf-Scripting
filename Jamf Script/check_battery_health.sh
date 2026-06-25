#!/bin/bash

# Check battery condition
batteryCondition=$(system_profiler SPPowerDataType | awk -F": " '/Condition/ {print $2}')
echo $batteryCondition
if [ "batteryCondition" -eq "Normal" ]
then
    echo "normal"
fi

# If battery is not normal, notify the user
if [ "$batteryCondition" != "Normal" ]; then
    osascript -e 'display dialog "Your Mac battery health is poor ("'"$batteryCondition"'"). Please contact the IT Support team for a battery check or replacement." buttons {"OK"} default button "OK" with icon caution'
else
    echo "Battery health is normal."
fi

exit 0