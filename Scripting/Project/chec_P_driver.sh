#!/bin/bash

if lpinfo -m | grep -iq "kyocera"; then
    echo "<result>Installed</result>"
else
    echo "<result>Not Installed</result>"
fi

# create the extension attribute to check the status of the printer installed or not

