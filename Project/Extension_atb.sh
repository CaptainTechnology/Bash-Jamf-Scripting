# #!/bin/bash

# status=$(defaults read /Library/Preferences/com.apple.alf globalstate 2>/dev/null)
# echo $status
# if [[ "$status" -ge 1 ]]; then
#     echo "<result>Enabled</result>"
#     echo "Enabled"
# else
#     echo "<result>Disabled</result>"
#     echo "Disabled"
# fi

#!/bin/bash

status=$(/usr/bin/defaults read /Library/Preferences/com.apple.alf globalstate 2>/dev/null || echo 0)

if [[ "$status" -ge 1 ]]; then
    echo "Firewall: Enabled"
else
    echo "Firewall: Disabled"
fi

# sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
# Password:
# Firewall is enabled. (State = 1)