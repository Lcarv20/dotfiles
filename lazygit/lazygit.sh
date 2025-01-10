#!/bin/bash

CONFIG_DIR="$HOME/.config/lazygit"
DARK_CONFIG="$CONFIG_DIR/config-dark.yml"
LIGHT_CONFIG="$CONFIG_DIR/config-light.yml"
CURRENT_CONFIG="$CONFIG_DIR/config.yml"

# Detect macOS appearance
APPEARANCE=$(defaults read -g AppleInterfaceStyle 2>/dev/null)

if [ "$APPEARANCE" == "Dark" ]; then
  cp "$DARK_CONFIG" "$CURRENT_CONFIG"
  export LS_COLORS="$(vivid generate one-dark)"
else
  cp "$LIGHT_CONFIG" "$CURRENT_CONFIG"
  export LS_COLORS="$(vivid generate one-light)"
fi

lazygit
