#!/bin/bash

set -eu

TARGET_DIR="$HOME/.config/Code/User"

# Resolve the directory where the script lives
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source settings.json from script directory
SOURCE_FILE="$SCRIPT_DIR/settings.json"
TARGET_FILE="$TARGET_DIR/settings.json"

# Create target if it doesn't exist
mkdir -vp "$TARGET_DIR"

# Backup existing settings.json if present
if [[ -f "$TARGET_FILE" ]]; then
	cp -v "$TARGET_FILE" "$TARGET_FILE.bak"
fi

# Copy new settings.json into VS Code user directory
cp -v "$SOURCE_FILE" "$TARGET_FILE"
