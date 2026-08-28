# Set the wallpaper in macos

Set Wallpaper in macOS Using Jamf Pro

# Create the Wallpaper Package

Create the folder:
/usr/local/Company Resources/

Add the wallpaper:
/usr/local/Company Resources/wallpaper.jpg

Create the package using Jamf Composer.

Set Owner: root

Set Group: wheel

Apply ownership to enclosed items.

# Create a Smart/Static Group

Create a Smart Group or Static Group.

Add the Macs that should receive the wallpaper.

# Create a Policy

Create a Jamf Pro Policy.

Add the wallpaper package.

Set the appropriate trigger/frequency.

Scope the policy to the relevant Smart/Static Group.

The policy deploys the wallpaper to:
/usr/local/Company Resources/wallpaper.jpg

# Create Configuration Profile

Go to:
Computers → Configuration Profiles → Restrictions → Functionality

Enable Lock Desktop Picture.

Set the wallpaper location:
/usr/local/Company Resources/wallpaper.jpg

Scope the profile to the same relevant group.

Flow

Wallpaper.jpg
      ↓
Jamf Composer
      ↓
Wallpaper.pkg
      ↓
Jamf Policy
      ↓
/usr/local/Company Resources/wallpaper.jpg
      ↓
Configuration Profile
      ↓
Lock Desktop Picture

Result: The wallpaper is deployed and locked on the scoped Macs. user will not be able to change the wallpaper


Note : if something already is there in company resource folder wallpaper will not overwrite it only wallper will be added in this folder. Great things.
macOS Desktop Wallpaper Configuration via Jamf Pro

# If Desktop Picture is located under macOS functionality settings that contain multiple restrictions, we can use iMazing Profile Editor to configure only the wallpaper. We can then deploy the configuration through Jamf Pro without affecting other macOS functionality.

# Configuration Steps
Open iMazing Profile Editor.
Select Mac as the platform.
Search for or navigate to Desktop Picture.

Select Lock Desktop Picture and specify the wallpaper path:

location : /usr/local/Company Resources/wallpaper.jpg
Save the profile locally using Command + S as a .mobileconfig file and test it directly on the Mac.
After successful testing, export the profile as a .plist from iMazing Profile Editor for uploading to the Jamf Pro configuration.

# In Jamf Pro, create a new Configuration Profile and name it Set - Wallpaper.
# Select the appropriate Custom Application option and specify the domain:

domain : com.apple.desktop
upload : Upload the exported .plist file.
Configure the Scope and select the required Mac devices.
Save and deploy the configuration profile.
Verify that the wallpaper is successfully applied to the scoped Macs.