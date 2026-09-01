DDM Os reminder 

1. Install swiftdialog on mac System. ( using policy )
2. donwload the DDM OS reminder folder from github (https://github.com/dan-snelson/DDM-OS-Reminder/releases/tag/v4.1.0)
3. sudo -s
cd /path/to/DDM-OS-Reminder-main
zsh assemble.zsh com.anees --interactive # or any reverse domain 
Configure comany branding and deadhline etc
three file will be genrated for production 3
(i) /Users/nykaa-it/Desktop/Bash-Jamf-Scripting/DDM-OS-Reminder-4.1.0/Artifacts/com.anees.dorm-2026-08-30-142639-prod-unsigned.mobileconfig
(ii) DDM-OS-Reminder-4.1.0/Artifacts/com.anees.dorm-2026-08-30-142639-prod.plist
(iii) DDM-OS-Reminder-4.1.0/Artifacts/ddm-os-reminder-com.anees-2026-08-30-142639-prod.zsh
4. drag and drop mobconfig file in jamf pro ( configuration profile) scope and deploy
5. Add the software update policy from jamf pro ( software update or using blueprint use blueprint this can be modified later)
6. add and deploye the (ddm-os-reminder-com.anees-2026-08-30-142639-prod.zsh) from jamf pro using policy
now a scipt will be added in /Library/Management/com.anees/dor.zsh

for quick testing run this commond : sudo zsh /Library/Management/com.anees/dor.zsh

to remove a min update download logo from DDM Os reminder Pop Up just below the banner : replace and add below thing
dialogArgs=(
 --title "${title}"
--message "${message}"
--icon "${icon}"
--iconsize 250
# --overlayicon "${overlayicon}" # Comment this
--overlayicon none # Add this line
--infobox "${infobox}"
--button1text "${button1text}"
--messagefont "size=14"
--quitkey "k"
--width 800
--height 650
"${blurscreen}"
"${additionalDialogOptions[@]}"
 )






 # useful commond

 tail -f /var/log/com.anees.log # check the log when teh ddm reminder will be visible

 if made any changes in configuration profile run the ddm os reminder script again so that (/Library/Management/com.anees/dor.zsh) here the script update other wise old will be visible

sudo zsh /Library/Management/com.anees/dor.zsh # Manually trigger the reminder dialog (testing UI/logic)

# Force-reload and restart the daemon immediately (apply new schedule)
# sudo launchctl kickstart -k system/com.anees.dor

i have set new configurain at 11:30 wait it should be appear


