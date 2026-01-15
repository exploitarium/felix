#!/bin/sh

# Setup script for Felix

set -e

echo "Setting up Felix - Advanced Subdomain Liveness Checker"
echo "======================================================"

# Check for curl
if ! command -v curl >/dev/null 2>&1; then
    echo "Installing curl..."
    if command -v apt-get >/dev/null 2>&1; then
        apt-get update && apt-get install -y curl
    elif command -v yum >/dev/null 2>&1; then
        yum install -y curl
    elif command -v brew >/dev/null 2>&1; then
        brew install curl
    elif command -v pacman >/dev/null 2>&1; then
        pacman -S curl
    else
        echo "Please install curl manually and run setup again"
        exit 1
    fi
fi

# Make main script executable
chmod +x felix.sh

# Create symlink in /usr/local/bin if possible
if [ -d /usr/local/bin ] && [ -w /usr/local/bin ]; then
    echo "Creating symlink in /usr/local/bin..."
    ln -sf "$(pwd)/felix.sh" /usr/local/bin/felix 2>/dev/null || true
    echo "You can now run 'felix' from anywhere!"
elif [ -d "$HOME/.local/bin" ]; then
    echo "Creating symlink in $HOME/.local/bin..."
    mkdir -p "$HOME/.local/bin"
    ln -sf "$(pwd)/felix.sh" "$HOME/.local/bin/felix"
    echo "Add $HOME/.local/bin to your PATH if not already:"
    echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
else
    echo "Add current directory to your PATH or run ./felix.sh"
fi

# Create example subdomains file
if [ ! -f subdomains.txt ]; then
    echo "Creating example subdomains.txt..."
    cat > subdomains.txt << 'EOF'
# Example subdomains file for Felix
# Add one subdomain per line

example.com
test.example.com
admin.example.com
api.example.com
mail.example.com
EOF
    echo "Created example subdomains.txt"
fi

echo ""
echo "Setup complete!"
echo "==============="
echo "Usage examples:"
echo "  ./felix.sh -f subdomains.txt"
echo "  ./felix.sh example.com"
echo "  ./felix.sh --help"
echo ""
echo "For more options, see README.md"
