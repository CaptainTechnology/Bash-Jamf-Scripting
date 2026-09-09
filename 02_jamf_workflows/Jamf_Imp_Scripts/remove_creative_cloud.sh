

# step by step process, suppose remove the creative cloud from the user device in for those liecense is not assinged
# 1. create static computer group and add unliecense users
# 2. creat smart group to unautorized creative cloud devices and add assined user group and add unliecense users and add smart application boundle id and applicatio title etc.
# 3. Create a policy and check
# 4. downloaded adobe illustrator and adobe photoshop
# 5. open the photoshop and illustrator


#!/bin/bash

##############################################################################
# Adobe Creative Cloud Removal Notification
##############################################################################

JAMFHELPER="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"

TITLE="Adobe Creative Cloud Removal"

HEADING="Action Required"

DESCRIPTION="Your Adobe Creative Cloud license is no longer assigned to your account.

Please save your work within the next 15 minutes.

After 15 minutes, Adobe Creative Cloud and Adobe applications will be closed automatically and the uninstall process will begin.

Any unsaved work will be lost.

If you believe you still require Adobe software, please contact the IT Service Desk."

ICON="/System/Library/CoreServices/CoreTypes.bundle/Contents/Resources/AlertStopIcon.icns"

"$JAMFHELPER" \
-windowType utility \
-title "$TITLE" \
-heading "$HEADING" \
-description "$DESCRIPTION" \
-icon "$ICON" \
-button1 "OK" \
-defaultButton 1 \
-timeout 900 &

##############################################################################
# Wait 15 minutes
##############################################################################

sleep 900

echo "Closing Adobe applications..."

processes=(
"Creative Cloud"
"Adobe"
"Photoshop"
"Illustrator"
"Acrobat"
"InDesign"
"After Effects"
"Premiere Pro"
"Media Encoder"
"CoreSync"
"CCXProcess"
"Adobe Desktop Service"
)

for process in "${processes[@]}"; do
    pkill -9 -f "$process" 2>/dev/null
done

sleep 5

##############################################################################
# Adobe Uninstall
##############################################################################

echo "Starting Adobe uninstall..."

# ---------------------------------------------------------------------------
# Replace the following line with your organization's supported Adobe
# enterprise uninstall command or package.
# ---------------------------------------------------------------------------

# Example:
# /path/to/AdobeUninstaller --all

##############################################################################
# Update Jamf Inventory
##############################################################################



exit 0
