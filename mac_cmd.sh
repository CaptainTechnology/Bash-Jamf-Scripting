#!/bin/bash

# ===== DOMAIN / DIRECTORY =====
dsconfigad -show                                   # Check if Mac is bound to Active Directory
sudo dsconfigad -add company.local -username admin -password pass   # Bind Mac to domain
sudo dsconfigad -remove -username admin -password pass              # Unbind Mac from domain
id username                                        # Verify if user exists (local/domain)

# ===== USER LOOKUP =====
dscl . list /Users                                 # List all local users
dscl /Search -list /Users                          # List all users (local + domain)
dscacheutil -q user -a name username               # Fetch detailed user info

# ===== AUTHENTICATION =====
log show --predicate 'eventMessage contains "Authentication"' --last 1h   # Check login/auth logs
sudo killall opendirectoryd                    # Restart directory services to fix login issues

# ===== NETWORK / DNS =====
scutil --dns                                      # Display DNS configuration
nslookup google.com                               # Test DNS resolution
ping server.company.local                         # Check connectivity to server/domain controller
ifconfig                                          # Show network interfaces and IP

# ===== KERBEROS / SSO =====
klist                                             # Show Kerberos tickets
kinit user@DOMAIN.COM                             # Get Kerberos ticket (login manually)
kdestroy                                          # Clear Kerberos tickets

# ===== FILEVAULT / SECURITY =====
fdesetup status                                   # Check FileVault encryption status
fdesetup list                                     # List FileVault-enabled users

# ===== SOFTWARE / PACKAGES =====
pkgutil --pkgs                                    # List installed packages
pkgutil --files package.name                      # Show files installed by a package
sudo installer -pkg file.pkg -target /            # Install a package manually

# ===== SYSTEM INFO =====
whoami                                            # Show current logged-in user
hostname                                          # Show system hostname
sw_vers                                           # Show macOS version
system_profiler SPHardwareDataType                # Show hardware info (serial, model)

# ===== DISK / STORAGE =====
df -h                                             # Show disk usage
du -sh /Users/*                                   # Show size of each user folder
diskutil list                                     # List all disks and partitions

# ===== LOGS =====
log show --last 1h                                # Show system logs (last 1 hour)
log show --predicate 'process == "jamf"' --last 1h   # Show Jamf-related logs
tail -f /var/log/system.log                       # Live system log monitoring

# ===== JAMF COMMANDS =====
sudo jamf policy                                  # Trigger Jamf policies
sudo jamf recon                                   # Update inventory in Jamf
sudo jamf inventory                               # Send inventory data to Jamf
sudo jamf checkJSSConnection                      # Check Jamf server connectivity
sudo jamf removeFramework                         # Remove Jamf framework
sudo jamf enroll -prompt                          # Re-enroll device into Jamf

# ===== MDM / PROFILES =====
profiles list                                     # List installed configuration profiles
profiles status -type enrollment                  # Check MDM enrollment status
sudo profiles renew -type enrollment              # Renew MDM enrollment

# ===== DEVICE NAMING =====
scutil --get ComputerName                         # Get device name
sudo scutil --set ComputerName "MacBook-01"       # Set device name

# ===== CLEANUP =====
sudo rm -rf /Library/Caches/*                     # Clear system cache
rm -rf ~/Library/Caches/*                         # Clear user cache