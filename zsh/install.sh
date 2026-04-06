#!/bin/zsh

set -eu

ZSH_CONFIG_DIR="$HOME/.config/zsh"
ZSHRC_FILE="$HOME/.zshrc"

# Resolve the directory where the script lives
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -vp "$ZSH_CONFIG_DIR"

# Copy config files from script directory
cp -v "$SCRIPT_DIR/zshrc"       "$ZSH_CONFIG_DIR/zshrc"
cp -v "$SCRIPT_DIR/zsh_aliases" "$ZSH_CONFIG_DIR/zsh_aliases"

# Add config only if it's not already present
if ! grep -q "ZSH_CONFIG_PATH" "$ZSHRC_FILE" 2>/dev/null; then
    cat << 'EOF' >> "$ZSHRC_FILE"

# --- Custom ZSH Config ---
export ZSH_CONFIG_PATH="$HOME/.config/zsh"
[[ -f "$ZSH_CONFIG_PATH/zshrc" ]] && source "$ZSH_CONFIG_PATH/zshrc"
# --- End Custom ZSH Config ---

EOF
    echo "ZSH configuration added to $ZSHRC_FILE"
else
    echo "Already configured (SKIPPED)" #?
fi
