#!/bin/bash

osascript <<EOF
display dialog "Your Mac will restart in 15 minutes for important updates. Please save your work." buttons {"OK"} default button "OK"
EOF

exit 0