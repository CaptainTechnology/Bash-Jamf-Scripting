
#!/bin/bash

# name="captain"

# echo $name
# name="jack"
# echo $name

#store commond into the variable
hostname=$(hostname)
present_files=$(ls -l)
echo $present_files
#or 
# ls -l
echo $hostname

# readonly New_host_name="24-M-FVFDHBDGM6KH"
# New_host_name="25-M-FVFDHBDGM6KH"
# echo $New_host_name

# scutil --set HostName $New_host_name
# scutil --set LocalHostName $New_host_name
# scutil --set ComputerName $New_host_name

# jamf recon

# echo "New Host Name : $hostname"