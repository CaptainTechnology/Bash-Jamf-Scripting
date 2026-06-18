
#!/bin/bash

# Get free memory (in MB)
FREE_MEM=$(top -l 1 | awk '/PhysMem/ {print $6}' | sed 's/M//')

# Threshold
THRESHOLD=500

if [ $FREE_MEM -lt $THRESHOLD ]; then
    echo "⚠️ WARNING: Low Memory! Free memory is ${FREE_MEM}MB"
else
    echo "✅ Memory OK: ${FREE_MEM}MB free"
fi


# explaination 
# top -l 1 > statu.txt
# nykaa-it@24-M-FVFDHBDGM6KH Bash Scripting % cat statu.txt| awk PhysMem
# nykaa-it@24-M-FVFDHBDGM6KH Bash Scripting % cat statu.txt| awk "/PhysMem/"
# PhysMem: 8150M used (2508M wired, 1653M compressor), 167M unused.
# nykaa-it@24-M-FVFDHBDGM6KH Bash Scripting % cat statu.txt| awk "/PhysMem/" | "{print $6}"
# zsh: command not found: {print }
# nykaa-it@24-M-FVFDHBDGM6KH Bash Scripting % cat statu.txt| awk "/PhysMem/" | '{print $6}'
# zsh: command not found: {print $6}
# nykaa-it@24-M-FVFDHBDGM6KH Bash Scripting % cat statu.txt| awk "/PhysMem/" | awk '{print $6}'
# 1653M
# nykaa-it@24-M-FVFDHBDGM6KH Bash Scripting % cat statu.txt| awk "/PhysMem/" | awk '{print $6}' | sed 's/M//'
# 1653
# nykaa-it@24-M-FVFDHBDGM6KH Bash Scripting % 