# Nudge Deployment Using Jamf Pro

## Overview

This document explains how to deploy **Nudge** using the **Jamf Pro App Catalog**, configure the required settings, scope devices using Smart Groups, and enforce macOS updates after the configured deadline.

> **Important**
>
> Nudge **does not install macOS updates**. It only notifies users that a macOS update is required.
>
> After the deadline, updates should be enforced using:
>
> - **Recommended:** Jamf Pro Software Updates (DDM / Software Update Plans)
> - **Alternative:** Jamf Policy using `softwareupdate`

---

# Prerequisites

- Jamf Pro
- Jamf App Catalog enabled
- Managed macOS devices
- Apple Software Update configured
- Internet connectivity

---

# Step 1 – Create Extension Attribute

This Extension Attribute checks whether a macOS update is available.

### Navigation

```text
Settings → Computer Management → Extension Attributes
```

### Configuration

| Setting | Value |
|----------|-------|
| Name | macOS Update Available |
| Data Type | String |
| Input Type | Script |

### Script

```bash
#!/bin/bash

AVAILABLE_UPDATES=$(/usr/sbin/softwareupdate --list 2>/dev/null)

AVAILABLE_VERSION=$(echo "$AVAILABLE_UPDATES" | grep -oE 'macOS[[:space:]]+[A-Za-z]+[[:space:]]+[0-9]+(\.[0-9]+){1,2}' | head -1)

if [[ -n "$AVAILABLE_VERSION" ]]; then
    echo "<result>$AVAILABLE_VERSION</result>"
else
    echo "<result>No macOS update available</result>"
fi

exit 0
```

### Example Result

```text
macOS Sequoia 15.7.7
```

---

# Step 2 – Create Smart Group

### Navigation

```text
Computers → Smart Computer Groups → New
```

### Name

```text
SG - macOS ≤ 15.7.5 && Update Available
```

### Criteria

| Criteria | Operator | Value |
|----------|----------|-------|
| Operating System Version | Less than or equal | 15.7.5 |
| macOS Update Available | Is | macOS Sequoia 15.7.7 |

### Purpose

This Smart Group automatically includes devices that:

- Are running macOS **15.7.5 or below**
- Have **macOS Sequoia 15.7.7** available for installation

After updating successfully, devices automatically leave this Smart Group.

---

# Step 3 – Deploy Nudge

### Navigation

```text
Computers → Mac App Catalog
```

### Procedure

1. Click **New**
2. Search for **Nudge**
3. Select **Nudge**
4. Configure the installer.

| Setting | Value |
|----------|-------|
| Deployment Type | Install Automatically |
| Version | Latest |
| Scope | SG - macOS ≤ 15.7.5 && Update Available |

Click **Save**.

---

# Step 4 – Create Nudge Configuration Profile

### Navigation

```text
Computers → Configuration Profiles → New
```

## General

| Setting | Value |
|----------|-------|
| Name | Nudge Configuration |
| Level | Computer |

---

## Application & Custom Settings

| Setting | Value |
|----------|-------|
| Payload | Application & Custom Settings |
| Source | External Application |
| Preference Domain | `com.github.macadmins.Nudge` |

Use either:

- Your own tested JSON configuration

**OR**

Import the official schema:

https://github.com/macadmins/nudge/blob/main/Schema/jamf/com.github.macadmins.Nudge.json

---

## Production JSON

```json
{
  "osVersionRequirements": [
    {
      "requiredMinimumOSVersion": "15.5",
      "requiredInstallationDate": "2026-07-15T17:00:00Z",
      "targetedOSVersionsRule": "default"
    }
  ],
  "userInterface": {
    "simpleMode": false,
    "showDeferralCount": true,
    "forceFallbackLanguage": false
  },
  "userExperience": {
    "allowLaterDeferralButton": true,
    "allowUserQuitDeferrals": true,
    "allowedDeferrals": 5,
    "initialRefreshCycle": 1800,
    "imminentRefreshCycle": 600
  },
  "optionalFeatures": {
    "acceptableApplicationBundleIDs": [
      "com.apple.systempreferences",
      "com.apple.systemsettings"
    ]
  }
}
```

### Configuration Notes

| Setting | Description |
|----------|-------------|
| requiredMinimumOSVersion | Minimum required macOS version |
| requiredInstallationDate | Update deadline |
| targetedOSVersionsRule | Applies to eligible devices |
| allowedDeferrals | Maximum number of user deferrals |
| initialRefreshCycle | Reminder every 30 minutes (1800 seconds) |
| imminentRefreshCycle | Reminder every 10 minutes (600 seconds) |

---

# Step 5 – Scope Configuration Profile

Scope the profile to:

```text
SG - macOS ≤ 15.7.5 && Update Available
```

Save the Configuration Profile.

---

# Step 6 – Configure macOS Update Enforcement

After the configured deadline, enforce macOS updates using one of the following methods.

---

## Recommended Method

### Jamf Pro Software Updates (DDM / Software Update Plans)

Create a Software Update Plan in Jamf Pro.

Scope it to:

```text
SG - macOS ≤ 15.7.5 && Update Available
```

Benefits:

- Native Apple update mechanism
- Fully supported by Jamf
- Better user experience
- Automatic compliance
- Devices automatically leave the Smart Group after updating

---

## Alternative Method

Create a Jamf Policy.

### Trigger

```text
Recurring Check-in
```

### Execution Frequency

```text
Ongoing
```

### Files and Processes

Execute Command:

```bash
/usr/sbin/softwareupdate --install --all --restart
```

Scope the policy to:

```text
SG - macOS ≤ 15.7.5 && Update Available
```

---

# Deployment Checklist

- [ ] Extension Attribute created
- [ ] Smart Group created
- [ ] Nudge deployed from App Catalog
- [ ] Configuration Profile created
- [ ] JSON configured
- [ ] Configuration Profile scoped
- [ ] Software Update enforcement configured
- [ ] Deployment completed successfully

---

# Verification

Verify the Configuration Profile:

```bash
profiles show -type configuration | grep -i "com.github.macadmins.Nudge"
```

Verify LaunchAgent:

```bash
launchctl print gui/$(id -u)/com.github.macadmins.Nudge
```

Verify Managed Preferences:

```bash
sudo defaults read /Library/Managed\ Preferences/com.github.macadmins.Nudge
```

Verify current macOS version:

```bash
sw_vers
```

Check available software updates:

```bash
softwareupdate --list
```

---

# Useful Commands

Launch Nudge manually:

```bash
/Applications/Utilities/Nudge.app/Contents/MacOS/Nudge
```

Kill Nudge:

```bash
pkill Nudge
```

Run Jamf policy manually:

```bash
sudo jamf policy
```

Update inventory:

```bash
sudo jamf recon
```

---

# Troubleshooting

## Reset Nudge

```bash
#!/bin/bash

pkill Nudge 2>/dev/null

rm -f ~/Library/Preferences/com.github.macadmins.Nudge.plist
rm -rf ~/Library/Caches/com.github.macadmins.Nudge
rm -rf ~/Library/Application\ Support/Nudge
rm -rf ~/Library/Logs/Nudge
rm -rf ~/Library/Saved\ Application\ State/com.github.macadmins.Nudge.savedState

sudo rm -f /Library/Preferences/com.github.macadmins.Nudge.plist
sudo rm -rf /Library/Application\ Support/Nudge
sudo rm -rf /Library/Logs/Nudge

echo "Nudge reset completed successfully."
```

---

# References

- Nudge GitHub Repository  
  https://github.com/macadmins/nudge

- Nudge Documentation  
  https://github.com/macadmins/nudge/wiki

- Using Nudge with DDM and Jamf  
  https://jonbrown.org/blog/using-nudge-with-ddm-macos-updates-jamf/

---