#!/bin/sh
# POSIX-compliant setup script for felix

set -eu

INSTALL_DIR="/usr/local/bin"
SOURCE_FILE="felix.sh"
TARGET_FILE="felix"

echo "[*] Installing felix..."

# Ensure script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "[!] Please run as root (sudo ./setup.sh)"
    exit 1
fi

# Check source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "[!] $SOURCE_FILE not found in current directory"
    exit 1
fi

# Create install directory if missing
if [ ! -d "$INSTALL_DIR" ]; then
    mkdir -p "$INSTALL_DIR"
fi

# Install
install -m 755 "$SOURCE_FILE" "$INSTALL_DIR/$TARGET_FILE"

echo "[+] felix installed to $INSTALL_DIR/$TARGET_FILE"
echo "[+] You can now run: felix example.com"
