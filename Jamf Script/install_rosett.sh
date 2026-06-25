#!/bin/bash

if [[ $(uname -m) == "arm64" ]]; then
    if ! /usr/bin/pgrep oahd >/dev/null 2>&1; then
        echo "Installing Rosetta..."
        /usr/sbin/softwareupdate --install-rosetta --agree-to-license/
    else
        echo "Rosetta already installed."
    fi
else
    echo "Intel Mac - Rosetta not required."
fi

exit 0