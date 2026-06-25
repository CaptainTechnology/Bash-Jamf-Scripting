#!/bin/bash

serial=$(system_profiler SPHardwareDataType | awk '/Serial Number/{print $4}')
newName="OrhanTech-$serial"
echo $newName
# scutil --set ComputerName "$newName"
# scutil --set LocalHostName "$newName"
# scutil --set HostName "$newName"

jamf recon

exit 0