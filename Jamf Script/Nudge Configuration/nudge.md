# Nudge Deployment Using Jamf Pro

Documentation : https://jonbrown.org/blog/using-nudge-with-ddm-macos-updates-jamf/ 

## Overview

This guide explains how to deploy **Nudge** using **Jamf Pro App Catalog**, configure the required settings, and launch the Nudge user interface.

---

# Step 1: Deploy Nudge

### Navigation

```text
Computers → Mac App > App Catelog
```

### Procedure

1. Click **New**.
2. Search for **Nudge**.
3. Select **Nudge**.
4. Configure the installer.

| Setting         | Value                     |
| --------------- | ------------------------- |
| Deployment Type | Install Automatically     |
| Version         | Latest                    |
| Scope           | Test Device / Smart Group |

5. Click **Save**.

---

# Step 2: Create Configuration Profile

### Navigation

```text
Computers → Configuration Profiles → New
```

### General

| Setting | Value               |
| ------- | ------------------- |
| Name    | Nudge Configuration |
| Level   | Computer            |

### Application & Custom Settings

| Setting           | Value                         |
| ----------------- | ----------------------------- |
| Payload           | Application & Custom Settings |
| Source            | External Application          |
| Preference Domain | `com.github.macadmins.Nudge`  |

double click your and install in local system Nudge configuration file created and tested by yourself Nude configuration with testing
 **or** 
 Nude Configuratio file downloaded from belew url > then below configuration is needed ( you can chage by yourself as well)
 https://github.com/macadmins/nudge/blob/main/Schema/jamf/com.github.macadmins.Nudge.json


---

## Nudge Configuration (Documentation)

> **Note:** This version includes comments for learning. Remove comments before importing into Jamf Pro.

```jsonc
{
  // macOS update requirements
  "osVersionRequirements": [
    {
      // Minimum macOS version required
      "requiredMinimumOSVersion": "15.5",

      // Update deadline (UTC)
      "requiredInstallationDate": "2026-07-15T17:00:00Z",

      // Apply to all eligible devices
      "targetedOSVersionsRule": "default"
    }
  ],

  // User Interface
  "userInterface": {

    // Full UI
    "simpleMode": false,

    // Display remaining deferrals
    "showDeferralCount": true,

    // Use system language
    "forceFallbackLanguage": false
  },

  // User Experience
  "userExperience": {

    // Show "Later" button
    "allowLaterDeferralButton": true,

    // Allow users to defer updates
    "allowUserQuitDeferrals": true,

    // Maximum deferrals
    "allowedDeferrals": 5,

    // Reminder every 30 minutes
    "initialRefreshCycle": 1800,

    // Reminder every 10 minutes near deadline
    "imminentRefreshCycle": 600
  },

  // Allow these applications while Nudge is open
  "optionalFeatures": {
    "acceptableApplicationBundleIDs": [
      "com.apple.systempreferences",
      "com.apple.systemsettings"
    ]
  }
}
```

### Scope

Assign the Configuration Profile to the required **Device** or **Smart Group**, then click **Save**.

---

# Step 3: Create Nudge Launch Policy

### Navigation

```text
Computers → Policies → New
```

### General

| Setting             | Value                               |
| ------------------- | ----------------------------------- |
| Display Name        | Run - Nudge UI                      |
| Trigger             | Recurring Check-in (or as required) |
| Execution Frequency | Ongoing                             |

### Files and Processes

**Execute Command**

```bash
/Applications/Utilities/Nudge.app/Contents/MacOS/Nudge
```

Scope the policy to the required **Device** or **Smart Group**, then click **Save**.

---

# Step 4: Verify Configuration Profile

Run the following command:

```bash
profiles show -type configuration | grep -i "com.github.macadmins.Nudge"
```

**Expected Result**

```text
com.github.macadmins.Nudge
```

This confirms that the Nudge Configuration Profile is installed successfully.

---

# Production JSON (Jamf Import)

> Use this version when importing into Jamf Pro.

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

> **Note:** If you set `"initialRefreshCycle": 18000`, the reminder interval becomes **5 hours**. For a **30-minute** interval, use **1800**.

---

# Deployment Checklist

* ☐ Nudge installed from App Catalog
* ☐ Configuration Profile created
* ☐ JSON configured
* ☐ Configuration Profile scoped
* ☐ Launch Policy created
* ☐ Policy scoped
* ☐ Configuration Profile verified
* ☐ Nudge UI launched successfully
