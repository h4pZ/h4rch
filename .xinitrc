#!/bin/sh
# PATH
export PATH=$PATH:$HOME/.local/bin
export BROWSER=/usr/bin/firefox

# For japanese.
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

fcitx5 -d &

# Hotkeys.
sxhkd &

# Start Compositor.
picom --experimental-backends -b &

# Setup display positions.
xrandr --output DVI-D-0 --off --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off &

# Setup background.
feh --bg-fill ~/.config/wall &

# Eye candy.
flashfocus &

# Start Notification center
deadd-notification-center &

# Media keys.
xbindkeys &

# Start Drive
insync start &
nextcloud --background &

# Polybar.
$HOME/.config/polybar/launch.sh &

# Disable black screen when idle.
xset s off
xset s off -dpms

# Gnome keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# Start the WM.
bspwm
