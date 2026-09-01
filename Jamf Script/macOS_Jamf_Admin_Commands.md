

sudo fdesetup validaterecovery 
# validate the filevalt key
dscl . list /Users UniqueID | awk '$2 >= 501 {print $1}' 
# check all local user even hidden user
# Admin
# nykaa-it

<!-- defaults write com.apple.screencapture location /Desktop/your_folder_Screenshot --> Change Screenshot location

sudo sysadminctl -deleteUser username -> delete the user only no home folder
sudo rm -rf /Users/Admin -> delete user as well as home folder
# ( this was second admin account but I was not able to run sudo rm -rf /Users/Admin , permission denied but with the help of jamf I deleted it )

# Change Firewall Status-> On / Off or get status
/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate 

sudo tccutil reset SystemPolicyAllFiles # reset the system full disk access prefrenses
sudo tccutil reset All com.microsoft.VSCode # for specific appliation full disk acess will be reset
sudo tccutil reset All com.google.Chrome
sudo jamf recon
sudo jamf policy

# csrutil disable -> disable the SIP

# These both script kill the already running jamf policy

# sudo pkill jamf
# sudo pkill -f "jamf policy" 
# tail -f /var/log/jamf.log -> check current status of jamf logs



<!-- profiles show -type configuration | grep -i "com.github.macadmins.Nudge" -> verify the profile is installed or not -->

# remove system from domain
sudo dsconfigad -remove -username admin -password password@123

# check boundle id ,
# If you know the application name:
osascript -e 'id of app "Safari"' 
# If you know the application's path:
mdls -name kMDItemCFBundleIdentifier "/Applications/Google Chrome.app" 
# com.microsoft.wdav -> don't add "com.microsoft.wdav" in smart group

# open -a safari https://www.google.com -> open safari
# open -a safari image.png -> open image

# option + cursor -> go to the specific 

#disable the firevault before enrolling the devices becouse conflict can be arrise during enrollment


# macOS Command Reference — Jamf Admin Cheat Sheet

A working reference of terminal commands commonly used by Jamf Pro administrators for
scripting, Extension Attributes, policies, and troubleshooting.

---

## 1. The `jamf` Binary (core commands)

```bash
sudo jamf checkJSSConnection        # Test connectivity to Jamf Pro server
sudo jamf recon                     # Force inventory update (submit to Jamf Pro)
sudo jamf policy                    # Run all applicable policies (ongoing trigger)
sudo jamf policy -id <policyID>     # Run a specific policy by ID
sudo jamf policy -event <trigger>   # Run policy by custom trigger name
sudo jamf manage                    # Re-apply MDM management / launchd configs
sudo jamf removeFramework           # Remove Jamf binary + framework (careful!)
sudo jamf version                   # Show installed jamf binary version
sudo jamf help                      # List all available jamf verbs
sudo jamf log -tail                 # Tail the jamf.log live
```

Log location: `/var/log/jamf.log`

---

## 2. System & Hardware Info

```bash
system_profiler SPHardwareDataType          # Serial number, model, chip, RAM
system_profiler SPSoftwareDataType          # OS version, boot volume, uptime
sw_vers                                     # macOS version / build quickly
sysctl -n machdep.cpu.brand_string          # CPU info
sysctl -n hw.model                          # Mac model identifier
ioreg -l | grep IOPlatformSerialNumber      # Serial number (alt method)
uptime                                      # System uptime
scutil --get ComputerName                   # Computer name
scutil --get LocalHostName                  # Bonjour/local hostname
hostname                                    # Full hostname
```

---

## 3. MDM / Profiles / Enrollment

```bash
sudo profiles status -type enrollment       # Check MDM enrollment status
sudo profiles renew -type enrollment        # Renew MDM enrollment profile
sudo profiles list                          # List all installed config profiles
sudo profiles -P                            # Same, verbose (deprecated but common)
sudo profiles show -type enrollment         # Show enrollment profile details
sudo profiles remove -identifier <id>       # Remove a specific profile
sudo profiles validate -type enrollment -path <file.mobileconfig>
```

Check MDM push connectivity issues via:
```bash
log show --predicate 'subsystem == "com.apple.ManagedClient"' --last 1h
```

---

## 4. User & Account Management

```bash
#!/bin/bash

whoami                                      # Current terminal user
who                                         # Logged-in users
stat -f%Su /dev/console                     # Current GUI user

dscl . -list /Users UniqueID | awk '$2 >= 501 {print $1}'        # Normal users only
id <username>                               # UID, GID and groups
# dscl . -read /Users/<username> UniqueID PrimaryGroupID RealName UserShell  # User details


sudo sysadminctl -addUser <username> -fullName "<Full Name>" -password <password>  # Create user
sudo sysadminctl -addUser <username> -fullName "<Full Name>" -password <password> -admin  # Create admin
sudo dscl . -passwd /Users/<username> <new_password>  # Change password
resetpassword # work in recovery mode
sudo sysadminctl -deleteUser <username>    # Delete user
sudo sysadminctl -deleteUser <username> -keepHome  # Delete user, keep Home

dscl . -list /Groups                      # List all groups
groups <username>                         # User's groups
dscl . -read /Groups/<groupname> GroupMembership  # Group members

sudo dseditgroup -o create <groupname>    # Create group
sudo dseditgroup -o edit -a <username> -t user <groupname>  # Add user to group
sudo dseditgroup -o edit -d <username> -t user <groupname>  # Remove user from group
sudo dseditgroup -o delete <groupname>    # Delete group

dsmemberutil checkmembership -U <username> -G admin  # Check admin membership

```

---

## 5. FileVault & Security

```bash
sudo fdesetup status                        # FileVault enabled/disabled
sudo fdesetup validaterecovery              # Validate recovery key
sudo fdesetup list                          # List FileVault-enabled users
sudo fdesetup validaterecovery              #validate the recovery key
sudo fdesetup enable -user <username>       # Enable FileVault for a user
sudo fdesetup changerecovery -personal      # Rotate personal recovery key -> it will update the recovey key in jamf as well
sudo profiles show -type bootstraptoken     # Check bootstrap token escrow status
sudo spctl --status                         # Gatekeeper status
csrutil status                              # SIP (System Integrity Protection) status
sudo security list-keychains                # List keychains
security find-certificate -a -p /Library/Keychains/System.keychain  # Certs installed


---

## 6. Networking

ifconfig                                      # Show all network interfaces and details
ifconfig | grep "inet "                       # Show all IPv4 addresses
ifconfig | grep "inet6 "                      # Show all IPv6 addresses
ifconfig | grep "ether "                     # Show all MAC addresses
networksetup -listallhardwareports            # Show hardware port ↔ interface mapping
ipconfig getifaddr en0                        # Get IP address of en0
ifconfig en0 | grep ether                     # Get MAC address of en0
networksetup -getmacaddress Wi-Fi             # Get Wi-Fi MAC address
networksetup -getinfo Wi-Fi                   # Show Wi-Fi IP, subnet, router and IPv6 details
networksetup -getairportnetwork en0           # Show connected Wi-Fi SSID
networksetup -listpreferredwirelessnetworks en0 # Show saved/preferred Wi-Fi networks

scutil --dns                                  # Show DNS resolver configuration
nslookup <hostname>                           # Perform basic DNS lookup
dig <hostname>                                # Perform detailed DNS lookup
dig +short <hostname>                         # Show resolved IP address only
dscacheutil -q host -a name <hostname>        # Check macOS hostname resolution
ping -c 4 <hostname>                          # Test basic network connectivity
ping -c 4 8.8.8.8                             # Test Internet without DNS
curl -Iv https://<jamf-url>                  # Test HTTPS/Jamf server connectivity
nc -zv <jamf-url> 443                         # Test TCP port 443 connectivity

---

## 7. Disk & Storage

```bash
diskutil list                               # List all disks/partitions
diskutil info /                             # Info on boot volume (APFS container, etc.)
diskutil apfs list                          # APFS container/volume details
df -h                                       # Human-readable disk usage
du -sh /path/to/folder                      # Size of a folder
diskutil eraseDisk APFS <name> disk2        # Erase a disk (destructive!)

diskutil list                         # Physical disks and partitions
diskutil apfs list                   # APFS containers and volumes
diskutil info "Macintosh HD"         # Macintosh HD details
diskutil info "Macintosh HD - Data"  # Data volume details
df -h                                # Disk usage
mount                                # Mounted filesystems
diskutil apfs listCryptoUsers        # APFS/FileVault crypto users
fdesetup status                      # FileVault status
```

---

## 8. Package / Software Installation (used heavily in Jamf scripts)

```bash
installer -pkg /path/to/package.pkg -target /   # Install a .pkg silently
softwareupdate -l                               # List available Apple updates
softwareupdate -ia                              # Install all available Apple updates
softwareupdate --install-rosetta --agree-to-license   # Install Rosetta 2 silently
pkgutil --pkgs                                  # List installed package receipts
pkgutil --pkg-info <package.id>                 # Info on a specific installed pkg
pkgutil --forget <package.id>                   # Remove a package receipt (careful)
```

---

## 9. Logging & Diagnostics

```bash
log show --predicate 'process == "jamf"' --last 1h     # Filter unified log for jamf
log stream --predicate 'subsystem == "com.apple.mdmclient"'   # Live MDM log stream
tail -f /var/log/jamf.log                       # Live tail jamf log
tail -f /var/log/install.log                    # Installer log
sudo log collect --output ~/Desktop/diag.logarchive --last 1h   # Export log archive
```

---

## 10. launchd / Services

```bash
sudo launchctl list | grep jamf             # Check jamf-related daemons/agents
sudo launchctl list com.jamfsoftware.task.1 # Check specific jamf scheduled task
sudo launchctl unload /Library/LaunchDaemons/com.jamfsoftware.task.1.plist
sudo launchctl load /Library/LaunchDaemons/com.jamfsoftware.task.1.plist
sudo launchctl kickstart -k system/com.apple.mdmclient.daemon   # Restart MDM daemon
```

---

## 11. Spotlight & Applications

```bash
mdfind "kMDItemFSName == '*.app'"           # Find apps via Spotlight index
mdfind -name <AppName>                      # Find app/file by name
sudo mdutil -E /                            # Rebuild Spotlight index
system_profiler SPApplicationsDataType      # List installed applications (used in EAs)
```

---

## 12. Time Machine / Backup (less common but useful)

```bash
tmutil status                               # Backup status
tmutil listbackups                          # List available backups
```

---

## 13. Handy One-Liners for Jamf Scripts / Extension Attributes

```bash
# Get logged-in user (safe for EAs, handles loginwindow edge case)
loggedInUser=$(scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ { print $3 }')

# Get current logged-in user's home directory
userHome=$(dscl . -read /Users/"$loggedInUser" NFSHomeDirectory | awk '{print $2}')

# Get free disk space in GB
diskutil info / | awk -F'[()]' '/Free Space|Available Space/ {print $2}' | awk '{print $1}'

# Check if a specific app is installed
[ -d "/Applications/Google Chrome.app" ] && echo "Installed" || echo "Not Installed"

# Get battery cycle count (for hardware EAs on laptops)
system_profiler SPPowerDataType | grep "Cycle Count"

# Check Apple Silicon vs Intel
arch=$(uname -m)   # "arm64" or "x86_64"
```

---

### Tips for Jamf-specific use
- Always test scripts with `sudo` locally before pushing as a Jamf policy — Jamf runs scripts as root.
- Wrap EA output in `<result>...</result>` tags when writing Extension Attribute scripts.
- `jamf policy -id` is great for testing a specific policy without waiting for the ongoing trigger.
- `log show`/`log stream` with predicates is your best friend for MDM profile push failures — much more reliable than just checking `jamf.log`.

