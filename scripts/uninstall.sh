#!/bin/sh

# Uninstall script for Felix

echo "Uninstalling Felix..."
echo "====================="

# Remove symlinks
if [ -L /usr/local/bin/felix ]; then
    echo "Removing symlink from /usr/local/bin..."
    rm /usr/local/bin/felix
fi

if [ -L "$HOME/.local/bin/felix" ]; then
    echo "Removing symlink from $HOME/.local/bin..."
    rm "$HOME/.local/bin/felix"
fi

echo ""
echo "Felix has been uninstalled."
echo "Note: Script files in this directory were not removed."
echo "You can delete this directory manually if desired."
