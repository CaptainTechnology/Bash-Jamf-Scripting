#!/bin/bash

if [ -d "/Applications/Microsoft Defender.app" ]; then
    echo "Microsoft Defender is installed."
else
    echo "Microsoft Defender is NOT installed."
    jamf policy -event installDefender
fi

exit 0