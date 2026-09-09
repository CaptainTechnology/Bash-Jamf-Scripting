# { Must Know
 #  1. Jamf Core & MDM Enrollment
 sudo jamf recon                       # Update hardware/software inventory in Jamf Pro
 sudo jamf policy                      # Trigger pending policies immediately
 sudo jamf policy -id <policyID>       # Run a specific Jamf policy by its ID number
 sudo jamf manage                      # Re-apply the MDM management framework
 sudo jamf removeFramework             # Strip Jamf binary and MDM profile from the Mac
 sudo profiles renew -type enrollment  # Re-fetch DEP profile from Apple Business Manager
 sudo profiles status -type enrollment # Verify if the Mac is successfully MDM enrolled
 sudo profiles show -type configuration | grep -i "Nudge" # Verify specific profile presence
 
 #  2. Security, Privacy & FileVault

 sudo fdesetup validaterecovery        # Test if the FileVault recovery key is valid for the drive
 sudo fdesetup changerecovery -personal # Rotate recovery key (automatically syncs back to Jamf)
 sudo tccutil reset SystemPolicyAllFiles # Reset Full Disk Access (FDA) globally
 sudo tccutil reset All com.microsoft.VSCode # Reset all security permissions for a specific app
 csrutil status                        # Check System Integrity Protection (SIP) status
 /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on # Enable macOS Firewall
 
 #  3. Account & Identity Management

 dscl . list /Users UniqueID | awk '$2 >= 501 {print $1}'  # List actual human users (ignores system daemons)
 sudo sysadminctl -deleteUser <username> -keepHome         # Delete user but keep their data folder intact
 sudo sysadminctl -deleteUser <username>                   # Delete user completely
 sudo rm -rf /Users/<username>                             # Force delete a home folder (bypass GUI permission errors)
 sudo dscl . -passwd /Users/<username> <new_password>      # Change a local user's password
 sudo dsconfigad -remove -username admin -password <pass>  # Unbind Mac from Active Directory
 
 #  4. Diagnostics, Logs & Network

 tail -f /var/log/jamf.log             # Stream Jamf policy executions and installations live
 sudo pkill -f "jamf policy"           # Kill a hung or frozen Jamf policy running in the background
 log show --predicate 'subsystem == "com.apple.ManagedClient"' --last 1h # View raw Apple MDM traffic logs
 softwareupdate -ia                    # Silently download and install all available Apple updates
 system_profiler SPHardwareDataType    # View Serial Number, Chip, and RAM configuration
 scutil --dns                          # View current DNS resolver configuration
 
 5. Application Scripting & Snippets
 # Get the Bundle ID by application name
 osascript -e 'id of app "Safari"'

# }



# Get the Bundle ID by application file path
mdls -name kMDItemCFBundleIdentifier "/Applications/Google Chrome.app"

# Launch an app or URL via terminal
open -a safari https://www.google.com



#!/bin/bash
# ==============================================================================
# macOS & Jamf Pro Command Reference Cheat Sheet
# Role: Desktop Support Engineer / Mac Admin
# WARNING: This is a REFERENCE file. Do not run this script top-to-bottom.
# ==============================================================================
exit 0 

# ==============================================================================
# 1. JAMF CORE & MDM ENROLLMENT
# ==============================================================================
sudo jamf checkJSSConnection                 # Test connectivity to Jamf Pro server
sudo jamf recon                              # Force inventory update (submit to Jamf Pro)
sudo jamf policy                             # Run all pending policies (ongoing trigger)
sudo jamf policy -id <policyID>              # Run a specific policy by ID
sudo jamf policy -event <trigger>            # Run policy by custom trigger name
sudo jamf manage                             # Re-apply MDM management / launchd configs
sudo jamf removeFramework                    # Remove Jamf binary + framework
sudo jamf version                            # Show installed jamf binary version
sudo jamf help                               # List all available jamf verbs

sudo profiles status -type enrollment        # Check MDM enrollment status
sudo profiles renew -type enrollment         # Renew MDM enrollment profile
sudo profiles list                           # List all installed config profiles
sudo profiles show -type enrollment          # Show enrollment profile details
sudo profiles remove -identifier <id>        # Remove a specific profile
sudo profiles validate -type enrollment -path <file.mobileconfig>
profiles show -type configuration | grep -i "com.github.macadmins.Nudge" # Verify specific profile

# ==============================================================================
# 2. USER & ACCOUNT MANAGEMENT
# ==============================================================================
whoami                                       # Current terminal user
who                                          # Logged-in users
stat -f%Su /dev/console                      # Current GUI user (more reliable)

dscl . list /Users UniqueID | awk '$2 >= 501 {print $1}'  # List actual human users (ignores system daemons)
id <username>                                # UID, GID and groups

sudo sysadminctl -addUser <username> -fullName "<Full Name>" -password <password>         # Create standard user
sudo sysadminctl -addUser <username> -fullName "<Full Name>" -password <password> -admin  # Create admin
sudo dscl . -passwd /Users/<username> <new_password>                                      # Change password

sudo sysadminctl -deleteUser <username> -keepHome  # Delete user, keep Home folder
sudo sysadminctl -deleteUser <username>            # Delete user completely
sudo rm -rf /Users/<username>                      # Force delete a home folder (bypass GUI permission errors)

dscl . -list /Groups                               # List all groups


# ==============================================================================
# 3. SECURITY, PRIVACY & FILEVAULT
# ==============================================================================
sudo fdesetup status                         # FileVault enabled/disabled
sudo fdesetup validaterecovery               # Validate the FileVault recovery key
sudo fdesetup list                           # List FileVault-enabled users
sudo fdesetup enable -user <username>        # Enable FileVault for a user
sudo fdesetup changerecovery -personal       # Rotate personal recovery key (syncs back to Jamf)
csrutil status                               # Check SIP (System Integrity Protection) status
# csrutil disable                            # Disable SIP (requires Recovery Mode)

sudo security list-keychains                 # List keychains
security find-certificate -a -p /Library/Keychains/System.keychain  # Certs installed

# Reset Privacy Permissions (TCC)
sudo tccutil reset SystemPolicyAllFiles      # Reset Full Disk Access globally
sudo tccutil reset All com.microsoft.VSCode  # Reset permissions for a specific app
sudo tccutil reset All com.google.Chrome

# Firewall Management
/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on   # Turn Firewall On
/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off  # Turn Firewall Off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate # Get Firewall Status

# ==============================================================================
# 4. SYSTEM, HARDWARE & DISK INFO
# ==============================================================================
system_profiler SPHardwareDataType           # Serial number, model, chip, RAM
system_profiler SPSoftwareDataType           # OS version, boot volume, uptime
sw_vers                                      # macOS version / build quickly
sysctl -n machdep.cpu.brand_string           # CPU info
sysctl -n hw.model                           # Mac model identifier
scutil --get ComputerName                    # Computer name
hostname                                     # Full hostname

diskutil list                                # List all physical disks and partitions
diskutil apfs list                           # APFS containers and volumes
diskutil info /                              # Info on boot volume
df -h                                        # Human-readable disk usage
du -sh /path/to/folder                       # Size of a specific folder
# diskutil eraseDisk APFS <name> disk2       # Erase a disk (DESTRUCTIVE!)

# ==============================================================================
# 5. NETWORKING
# ==============================================================================
ifconfig | grep "inet "                      # Show all IPv4 addresses
networksetup -listallhardwareports           # Show hardware port mapping
ipconfig getifaddr en0                       # Get IP address of en0 (usually Wi-Fi)
networksetup -getmacaddress Wi-Fi            # Get Wi-Fi MAC address
networksetup -getinfo Wi-Fi                  # Show Wi-Fi IP, subnet, router details
networksetup -getairportnetwork en0          # Show connected Wi-Fi SSID

scutil --dns                                 # Show DNS resolver configuration
dscacheutil -q host -a name <hostname>       # Check macOS hostname resolution
curl -Iv https://<jamf-url>                  # Test HTTPS/Jamf server connectivity
nc -zv <jamf-url> 443                        # Test TCP port 443 connectivity

# ==============================================================================
# 6. SOFTWARE, PACKAGES & DIAGNOSTICS
# ==============================================================================
installer -pkg /path/to/package.pkg -target /         # Install a .pkg silently
softwareupdate -l                                     # List available Apple updates
softwareupdate -ia                                    # Install all available Apple updates
softwareupdate --install-rosetta --agree-to-license   # Install Rosetta 2 silently

log show --predicate 'process == "jamf"' --last 1h    # Filter unified log for jamf
log show --predicate 'subsystem == "com.apple.ManagedClient"' --last 1h # MDM traffic logs
log stream --predicate 'subsystem == "com.apple.mdmclient"'   # Live MDM log stream
tail -f /var/log/jamf.log                             # Live tail jamf log
tail -f /var/log/install.log                          # Live tail installer log

sudo pkill jamf                                       # Kill the jamf process
sudo pkill -f "jamf policy"                           # Kill a hung jamf policy

sudo launchctl list | grep jamf                       # Check jamf-related daemons/agents
sudo launchctl kickstart -k system/com.apple.mdmclient.daemon   # Restart MDM daemon


