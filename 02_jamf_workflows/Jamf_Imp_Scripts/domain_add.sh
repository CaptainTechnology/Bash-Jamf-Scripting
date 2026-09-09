#!/bin/bash

# Set your variables
DOMAIN="your.domain.com"           # Replace with your domain
AD_ADMIN="your_ad_username"     # Replace with an AD admin username
AD_PASSWORD="your_ad_password"  # Replace with the password (or consider secure handling)
COMPUTER_NAME="YourMacName"            # Replace with the Mac’s name

# Ensure system is in the correct state
sudo /usr/sbin/scutil --set ComputerName "$COMPUTER_NAME"

# Bind to the domain
sudo dsconfigad -add "$DOMAIN" \
    -username "$AD_ADMIN" \
    -password "$AD_PASSWORD" \
    -computer "$COMPUTER_NAME" \
    -protocol SMB \
    -ou "/Computers/YourOU"    # Optional: specify OU path if needed

# Optional: Verify the binding
dsconfigad -show