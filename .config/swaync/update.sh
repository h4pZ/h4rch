#!/bin/bash
CONFIG="$HOME/.config/swaync/config.json"
CACHE="$HOME/.cache/swaync"

# --- If CC is already open, just close it and exit ---
cc_open=$(hyprctl layers -j 2>/dev/null \
    | jq 'any(.. | objects | .namespace? == "swaync-control-center")' 2>/dev/null)

if [ "$cc_open" = "true" ]; then
    swaync-client -t -sw
    exit 0
fi

# --- Read from cache (written by daemon.sh) ---
pkg_text=$(cat "$CACHE/pkg.txt"   2>/dev/null || echo "󰣇  loading...")
vpn_text=$(cat "$CACHE/vpn.txt"   2>/dev/null || echo "󰒃  loading...")
nvda_text=$(cat "$CACHE/nvda.txt" 2>/dev/null || echo "󰻠 NVDA  loading...")

# --- Patch config in one jq pass ---
tmp=$(mktemp)
if jq \
    --arg pkg  "$pkg_text" \
    --arg vpn  "$vpn_text" \
    --arg nvda "$nvda_text" \
    '
    .["widget-config"]["label#pkgupdates"].text = $pkg |
    .["widget-config"]["label#vpnstatus"].text  = $vpn |
    .["widget-config"]["label#nvda"].text       = $nvda
    ' "$CONFIG" > "$tmp"; then
    mv "$tmp" "$CONFIG"
else
    rm -f "$tmp"
    exit 1
fi

swaync-client -R
swaync-client -t -sw
