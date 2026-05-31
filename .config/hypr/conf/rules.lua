-- Window & layer rules
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Window rules (legacy: windowrule = float, ...)
hl.window_rule({ match = { class = "feh" }, float = true })
hl.window_rule({ match = { class = "[Nn]sxiv" }, float = true, center = true })
hl.window_rule({ match = { class = "sxiv" }, float = true })
hl.window_rule({ match = { class = "mpv" }, float = true })
hl.window_rule({ match = { class = "vlc" }, float = true })
hl.window_rule({ match = { class = "thunar" }, float = true })
hl.window_rule({ match = { class = "org.gnome.Nautilus" }, float = true })
hl.window_rule({ match = { class = "steam" }, float = true })
hl.window_rule({ match = { class = "Steam" }, float = true })
hl.window_rule({ match = { class = "zoom" }, float = true })
-- hl.window_rule({ match = { class = "com.mitchellh.ghostty" }, opacity = "0.70" })

-- Layer rules
-- legacy: blurls = notifications / waybar
hl.layer_rule({ match = { namespace = "notifications" }, blur = true })
-- hl.layer_rule({ match = { namespace = "waybar" }, blur = true })

-- legacy: layerrule = blur/ignore_alpha for swaync surfaces
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true, ignore_alpha = 0.30 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true, ignore_alpha = 0.30 })
