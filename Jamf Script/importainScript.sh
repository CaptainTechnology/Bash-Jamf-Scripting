

# sudo fdesetup validaterecovery 
# # -> validate the filevalt key
# dscl . list /Users UniqueID | awk '$2 >= 501 {print $1}' 
# check all local user even hidden user
# Admin
# nykaa-it

# sudo sysadminctl -deleteUser username -> delete the user only no home folder
# sudo rm -rf /Users/Admin -> delete user as well as home folder
# ( this was second admin account but I was not able to run sudo rm -rf /Users/Admin , permission denied but with the help of jamf I deleted it )


# csrutil disable -> disable the SIP


# These both script kill the already running jamf policy

# sudo pkill jamf
# sudo pkill -f "jamf policy" 




# check boundle id ,
# If you know the application name:
osascript -e 'id of app "Safari"' 
# If you know the application's path:
mdls -name kMDItemCFBundleIdentifier "/Applications/Google Chrome.app" 
# com.microsoft.wdav -> don't add "com.microsoft.wdav" in smart group
