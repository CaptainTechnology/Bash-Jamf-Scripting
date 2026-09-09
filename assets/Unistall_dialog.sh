#!/bin/zsh

LOG="/var/log/swiftdialog-uninstall.log"

echo "===== SwiftDialog Uninstall Started: $(date) =====" >> "$LOG"

# 1. Terminate running instances
killall "Dialog" 2>/dev/null
killall "dialogcli" 2>/dev/null

# 2. Unload and remove LaunchDaemons/LaunchAgents (if present from older versions)
if [[ -f "/Library/LaunchDaemons/au.csiro.dialog.plist" ]]; then
    launchctl unload "/Library/LaunchDaemons/au.csiro.dialog.plist" 2>/dev/null
    rm -f "/Library/LaunchDaemons/au.csiro.dialog.plist"
    echo "Removed LaunchDaemon" >> "$LOG"
fi

# 3. Remove Binary
if [[ -e "/usr/local/bin/dialog" ]]; then
    rm -f "/usr/local/bin/dialog"
    echo "Removed /usr/local/bin/dialog" >> "$LOG"
else
    echo "/usr/local/bin/dialog not found" >> "$LOG"
fi

# 4. Remove App Support & Preference Files
if [[ -d "/Library/Application Support/Dialog" ]]; then
    rm -rf "/Library/Application Support/Dialog"
    echo "Removed Dialog application support directory" >> "$LOG"
else
    echo "Dialog application support directory not found" >> "$LOG"
fi

rm -f "/Library/Preferences/au.csiro.dialog.plist" 2>/dev/null
rm -f "/var/log/dialog.log" 2>/dev/null

# 5. Forget Package Receipts (Both standard and legacy CLI receipts)
pkgutil --forget au.csiro.dialog >/dev/null 2>&1
pkgutil --forget au.csiro.dialogcli >/dev/null 2>&1

# 6. Verification
if [[ ! -e "/usr/local/bin/dialog" ]] && [[ ! -d "/Library/Application Support/Dialog" ]]; then
    echo "SwiftDialog successfully removed" >> "$LOG"
    echo "SwiftDialog successfully removed"
    exit 0
else
    echo "SwiftDialog removal incomplete" >> "$LOG"
    echo "SwiftDialog removal incomplete"
    exit 1
fi