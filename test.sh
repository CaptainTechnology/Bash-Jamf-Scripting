#!/bin/zsh --no-rcs
# shellcheck shell=bash

####################################################################################################
#
# swiftDialog Inspect Mode for Installomator (Banner CLI Override)
#
####################################################################################################

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin/

# Script Version
scriptVersion="4.0"
SCRIPT_NAME="Installomator_M365"

# Load is-at-least for version comparison
autoload -Uz is-at-least

####################################################################################################
#
# Logged-in User & System Variables
#
####################################################################################################

LOGGED_IN_USER=$( scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
loggedInUserID=$( /usr/bin/id -u "${LOGGED_IN_USER}" )
JAMF_LOGGED_IN_USER=${3:-"$LOGGED_IN_USER"}
SD_FIRST_NAME="${(C)JAMF_LOGGED_IN_USER%%.*}"   

# Dynamic Greeting
SD_DIALOG_GREETING=$((){print Good ${argv[2+($1>11)+($1>18)]}} ${(%):-%D{%H}} morning afternoon evening)

# System Info for Infobox
FREE_DISK_SPACE=$(($( /usr/sbin/diskutil info / | /usr/bin/grep "Free Space" | /usr/bin/awk '{print $6}' | /usr/bin/cut -c 2- ) / 1024 / 1024 / 1024 ))
MACOS_NAME=$(sw_vers -productName)
MACOS_VERSION=$(sw_vers -productVersion)
MAC_RAM=$(($(sysctl -n hw.memsize) / 1024**3))" GB"
MAC_CPU=$(sysctl -n machdep.cpu.brand_string)

####################################################################################################
#
# Swift Dialog & Installomator Variables
#
####################################################################################################

SW_DIALOG="/usr/local/bin/dialog"
MIN_SD_REQUIRED_VERSION="3.1.0"
[[ -e "${SW_DIALOG}" ]] && SD_VERSION=$( ${SW_DIALOG} --version) || SD_VERSION="0.0.0"

DIALOG_INSTALL_POLICY="install_SwiftDialog"
SUPPORT_FILE_INSTALL_POLICY="install_SymFiles"

organizationInstallomatorFile="/Library/Management/AppAutoPatch/Installomator/Installomator.sh"
installomatorLog="/var/log/Installomator.log"
applicationIcon="https://usw2.ics.services.jamfcloud.com/icon/hash_8bf6549c22de3db831aafaf9c5c02d3aa9a928f4abe377eb2f8cbeab3959615c"

scriptLog="/Library/Application Support/GiantEagle/SupportFiles/logs/${SCRIPT_NAME}.log"
dialogInspectModeJSONFile=$( /usr/bin/mktemp -u /var/tmp/dialogJSONFile_InspectMode.XXXX )

####################################################################################################
#
# Script Functions
#
####################################################################################################

function updateScriptLog() {
    LOG_DIR=${scriptLog%/*}
    [[ ! -d "${LOG_DIR}" ]] && /bin/mkdir -p "${LOG_DIR}"
    echo "$(/bin/date '+%Y-%m-%d %H:%M:%S'): ${1}" | tee -a "${scriptLog}"
}

function info()  { updateScriptLog "[INFO]  ${1}"; }
function error() { updateScriptLog "[ERROR] ${1}"; }
function fatal() { updateScriptLog "[FATAL] ${1}"; exit 1; }

function runAsUser() {
    /bin/launchctl asuser "$loggedInUserID" /usr/bin/sudo -u "$LOGGED_IN_USER" "$@"
}

function check_swift_dialog_install () {
    info "Ensuring that swiftDialog version is installed..."
    if [[ ! -x "${SW_DIALOG}" ]]; then
        info "Swift Dialog is missing - Installing from JAMF"
        /usr/local/bin/jamf policy -event ${DIALOG_INSTALL_POLICY}
        SD_VERSION=$( ${SW_DIALOG} --version)        
    fi

    if ! is-at-least "${MIN_SD_REQUIRED_VERSION}" "${SD_VERSION}"; then
        info "Swift Dialog is outdated - Installing version '${MIN_SD_REQUIRED_VERSION}' from JAMF..."
        /usr/local/bin/jamf policy -event ${DIALOG_INSTALL_POLICY}
    else    
        info "Swift Dialog is currently running: ${SD_VERSION}"
    fi
}

function check_support_files () {
    if [[ ! -e "/Library/Application Support/GiantEagle/SupportFiles/GE_SD_BannerImage.png" ]]; then
        info "Banner image missing. Triggering Jamf policy: ${SUPPORT_FILE_INSTALL_POLICY}"
        /usr/local/bin/jamf policy -event ${SUPPORT_FILE_INSTALL_POLICY}
    fi
}

function create_infobox_message() {
    # Formatted strictly for JSON parsing
    SD_INFO_BOX_MSG="**System Info**\n\n${MAC_CPU}\n\nSerial: {serialnumber}\n\nRAM: ${MAC_RAM}\n\nDisk: ${FREE_DISK_SPACE}GB Free\n\nOS: {osname} {osversion}"
}

function createInspectConfig() {
    if ! /bin/cat > "${dialogInspectModeJSONFile}" <<EOF
{
    "preset": "preset1",
    "infobox": "${SD_INFO_BOX_MSG}",
    "title": "${SD_DIALOG_GREETING}, ${SD_FIRST_NAME}!",
    "message": "Please wait while we install your Microsoft 365 applications. The installation progress is automatically monitored.",
    "icon": "${applicationIcon}",
    "iconsize": 120,
    "size": "standard",
    "logMonitor": {
        "path": "${installomatorLog}",
        "preset": "installomator",
        "autoMatch": true,
        "startFromEnd": true
    },
    "sideMessage": [
        "Thank you for your patience.",
        "Microsoft Word is on its way — create polished documents with ease.",
        "Microsoft Excel is installing — turn raw data into powerful decisions.",
        "Microsoft PowerPoint is coming — make every presentation unforgettable.",
        "Microsoft Outlook is installing — your email, calendar, and contacts.",
        "Microsoft OneNote is on its way — capture ideas wherever inspiration strikes.",
        "OneDrive is installing — access your files from any device, anywhere.",
        "Microsoft Teams is on its way — collaborate, meet, and chat all in one app."
    ],
    "sideInterval": 8,
    "highlightColor": "#FF904C",
    "button1text": "Please wait...",
    "button1disabled": true,
    "autoEnableButton": true,
    "autoEnableButtonText": "Close",
    "items": [
        {
            "id": "microsoftword",
            "displayName": "Microsoft Word",
            "paths": ["/Applications/Microsoft Word.app"],
            "icon": "https://usw2.ics.services.jamfcloud.com/icon/hash_51ae4c1e37bfbde2097e14712c3c13885157d632105804bcfaa912a627649b4c"
        },
        {
            "id": "microsoftexcel",
            "displayName": "Microsoft Excel",
            "paths": ["/Applications/Microsoft Excel.app"],
            "icon": "https://usw2.ics.services.jamfcloud.com/icon/hash_9df1c82089b6a3ef006dc6a94995782e1809d6f9767c189a1608067a9f651ca9"
        },
        {
            "id": "microsoftpowerpoint",
            "displayName": "Microsoft PowerPoint",
            "paths": ["/Applications/Microsoft PowerPoint.app"],
            "icon": "https://usw2.ics.services.jamfcloud.com/icon/hash_caadba785f099cec2bb510388390f5239c735a30723ba81b8a0e51792c4adff3"
        },
        {
            "id": "microsoftoutlook",
            "displayName": "Microsoft Outlook",
            "paths": ["/Applications/Microsoft Outlook.app"],
            "icon": "https://usw2.ics.services.jamfcloud.com/icon/hash_e5b0c5b42d26e39431ecc7445ff0122e7d1a73d3487f55ca91b99523136b825d"
        },
        {
            "id": "microsoftonenote",
            "displayName": "Microsoft OneNote",
            "paths": ["/Applications/Microsoft OneNote.app"],
            "icon": "https://usw2.ics.services.jamfcloud.com/icon/hash_e17f32e5366c1d5a3f29f67f8b38470144ecaf597435d2d46523fc1757382ec7"
        },
        {
            "id": "microsoftonedrive",
            "displayName": "OneDrive",
            "paths": ["/Applications/OneDrive.app"],
            "icon": "https://usw2.ics.services.jamfcloud.com/icon/hash_72e08cf3b2dc4d168dc62faf4fc6821b0e0ec79f3382b1567a02b35176024adc"
        },
        {
            "id": "microsoftteamsnew",
            "displayName": "Microsoft Teams",
            "paths": ["/Applications/Microsoft Teams.app"],
            "icon": "https://usw2.ics.services.jamfcloud.com/icon/hash_60344669638073113f3ca25e0a60e7080b5141536dbb62d8920d6e21fa70f877"
        }
    ]
}
EOF
    then
        fatal "Failed to create Dialog inspect config file"
    else
        info "Dialog inspect config JSON created successfully."
    fi
}

installomatorInstallInspectItem() {
    local installomatorLabel installomatorExitCode dialogPID

    create_infobox_message
    createInspectConfig

    # Launch Dialog with the hardcoded CLI arguments to force the Banner
    runAsUser DIALOG_INSPECT_CONFIG="${dialogInspectModeJSONFile}" "${SW_DIALOG}" \
        --inspect-mode \
        --bannerimage "/Library/Application Support/GiantEagle/SupportFiles/GE_SD_BannerImage.png" \
        --quitkey "k" &
        
    dialogPID=$!
    info "Inspect Mode PID: ${dialogPID}"

    # Parse JSON for items and loop Installomator
    while IFS=$'\t' read -r installomatorLabel appPath; do
        if [[ -n "${appPath}" && -d "${appPath}" ]]; then
            info "Skipping '${installomatorLabel}': ${appPath} already exists"
            continue
        fi
        
        info "Installing '${installomatorLabel}' …"
        "${organizationInstallomatorFile}" "${installomatorLabel}" DEBUG=0 NOTIFY=silent 2>&1 | while IFS= read -r installomatorOutputLine; do
            updateScriptLog "  -> Installomator (${installomatorLabel}): ${installomatorOutputLine}"
        done
        
        installomatorExitCode=${pipestatus[1]}
        if [[ ${installomatorExitCode} -ne 0 ]]; then
            error "Installomator failed for '${installomatorLabel}' (exit code: ${installomatorExitCode})"
        else
            info "Installomator completed for '${installomatorLabel}'"
        fi
    done < <(/usr/bin/jq -r '.items[] | [.id, .paths[0]] | @tsv' "${dialogInspectModeJSONFile}")

    info "Waiting for Inspect Mode (PID: ${dialogPID}) to close …"
    wait "${dialogPID}"
    info "Inspect Mode closed."
}

function quitScript() {
    info "Exiting script."
    if [[ -n "${dialogPID}" ]] && kill -0 "${dialogPID}" 2>/dev/null; then
        kill "${dialogPID}" 2>/dev/null || true
    fi
    /bin/rm -f /var/tmp/dialogJSONFile_*
    exit 0
}

####################################################################################################
#
# Program Execution
#
####################################################################################################

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    fatal "ERROR: This script must be run as root; exiting."
fi

if [[ ! -x "${organizationInstallomatorFile}" ]]; then
    fatal "Installomator not found at ${organizationInstallomatorFile}; exiting."
fi

check_swift_dialog_install
check_support_files
installomatorInstallInspectItem
quitScript