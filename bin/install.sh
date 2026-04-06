#!/bin/bash

set -eu

TARGET_DIR="$HOME/.local/bin"

# Resolve the directory where the script lives
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/src"

# Create target if it doesn't exist
mkdir -vp "$TARGET_DIR"

# Copy all bins and make them executable
for bin in "$SOURCE_DIR"/*; do
    [ -f "$bin" ] || continue
    cp -v "$bin" "$TARGET_DIR/"
    chmod +x "$TARGET_DIR/$(basename "$bin")"
done

echo
echo "[INFO] All bins from $SOURCE_DIR installed to $TARGET_DIR"
echo "[WARN] Make sure $TARGET_DIR is in your PATH"

# Add to PATH if not already (temporary)
SHELL_RC="$HOME/.zshrc"   # change to ~/.bashrc if using Bash

if ! grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' "$SHELL_RC"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_RC"
    echo "[INFO] Added $TARGET_DIR to PATH in $SHELL_RC."
    echo "[WARN] Reload your shell."
else
    echo "[INFO] $TARGET_DIR already in PATH in $SHELL_RC"
fi
