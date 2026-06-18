#!/bin/bash

echo "Starting Homebrew installation..."

# Check if Homebrew already exists
if command -v brew >/dev/null 2>&1; then
    echo "Homebrew already installed"
    exit 0
fi

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Homebrew installation completed"


# unistallation script
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
