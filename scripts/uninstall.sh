#!/bin/sh
# POSIX-compliant uninstall script for felix

set -eu

INSTALL_FILE="/usr/local/bin/felix"

echo "[*] Uninstalling felix..."

# Ensure script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "[!] Please run as root (sudo ./uninstall.sh)"
    exit 1
fi

# Remove installed binary if it exists
if [ -f "$INSTALL_FILE" ]; then
    rm -f "$INSTALL_FILE"
    echo "[+] Removed $INSTALL_FILE"
else
    echo "[!] felix is not installed at $INSTALL_FILE"
fi

echo "[+] Uninstall complete"
