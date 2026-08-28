-- Keybindings -- https://wiki.hypr.land/Configuring/Basics/Binds/
-- Dispatchers: https://wiki.hypr.land/Configuring/Basics/Dispatchers/

-- Applications / actions
hl.bind("SUPER + Z", hl.dsp.exec_cmd("ghostty"))
-- legacy: [float; size 800 600; center] ghostty  -- exec_cmd rules are a flat table of window-rule effects
hl.bind("SUPER + SHIFT + Z", hl.dsp.exec_cmd("ghostty", { float = true, size = { 800, 600 }, center = true }))
hl.bind("SUPER + C", hl.dsp.window.close())                  -- legacy: killactive
-- hl.bind("SUPER + SHIFT + Q", hl.dsp.exit())               -- legacy line was commented out
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus", { float = true, size = { 800, 500 }, center = true }))
hl.bind("SUPER + Q", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + B", hl.dsp.window.float({ action = "toggle" }))  -- legacy: togglefloating
-- Maximize, not true fullscreen. Hyprland disables the whole decoration pass for
-- FSMODE_FULLSCREEN (Renderer.cpp: `decorate && ... internal != FSMODE_FULLSCREEN`),
-- which kills borders *and* the hyprglass decoration. FSMODE_MAXIMIZED keeps them,
-- so the glass survives. client = -1 leaves the app's own fullscreen state alone.
hl.bind("SUPER + F", hl.dsp.window.fullscreen_state({ internal = 1, client = -1 }))
-- True fullscreen: app is told it is fullscreen (video, games). No decorations,
-- so no border and no glass -- that is the tradeoff, not a bug.
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + R", hl.dsp.exec_cmd("killall rofi || ~/.config/rofi/launchers/type-3/launcher.sh"))
hl.bind("SUPER + P", hl.dsp.window.pseudo())                 -- dwindle
hl.bind("SUPER + T", hl.dsp.layout("togglesplit"))          -- dwindle (legacy: layoutmsg togglesplit)
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("hyprlock --grace 3"))
hl.bind("SUPER + CTRL + SHIFT + D", hl.dsp.exec_cmd("systemctl suspend && hyprlock"))
hl.bind("SUPER + CTRL + SHIFT + S", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("~/.config/swaync/update.sh"))

-- hyprtasking workspace overview (legacy: hyprtasking:toggle, all).
-- Plugin dispatchers are exposed as plain functions under hl.plugin.<name>, not
-- under hl.dsp, so this is bound as a closure rather than a dispatcher object.
hl.bind("SUPER + O", function() hl.plugin.hyprtasking.toggle("all") end)

-- Move focus with mainMod + hjkl
hl.bind("SUPER + h", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + l", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + k", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + j", hl.dsp.focus({ direction = "d" }))

-- Move window (vim bindings)
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Resize (vim, fine step) -- legacy resizeactive is a relative resize
hl.bind("SUPER + CTRL + h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind("SUPER + CTRL + l", hl.dsp.window.resize({ x = 20,  y = 0, relative = true }))
hl.bind("SUPER + CTRL + k", hl.dsp.window.resize({ x = 0,   y = -20, relative = true }))
hl.bind("SUPER + CTRL + j", hl.dsp.window.resize({ x = 0,   y = 20, relative = true }))

-- Switch workspaces with mainMod + [0-9]  (0 -> workspace 10)
for i = 1, 10 do
    local key = (i == 10) and "0" or tostring(i)
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
-- legacy movetoworkspacesilent => move without following (follow = false)
for i = 1, 10 do
    local key = (i == 10) and "0" or tostring(i)
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Scroll through workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Audio
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd([[f=$(mktemp /tmp/shot-XXXXXX.png); grim -g "$(slurp -d -w 0)" "$f" && wl-copy --type image/png < "$f" && notify-send "Screenshot captured" "<img src='$f'/>"; rm -f "$f"]]))
hl.bind("SUPER + Print", hl.dsp.exec_cmd([[f=$(mktemp /tmp/shot-XXXXXX.png); grim "$f" && wl-copy --type image/png < "$f" && notify-send "Desktop screenshot copied" "<img src='$f'/>"; rm -f "$f"]]))
hl.bind("SUPER + SHIFT + Print", hl.dsp.exec_cmd([[f=$HOME/Screenshots/$(uuidgen).png; grim -g "$(slurp)" "$f" && notify-send "Screenshot saved" "<img src='$f'/>"]]))
hl.bind("SUPER + CTRL + Print", hl.dsp.exec_cmd([[f=$HOME/Screenshots/desktop-$(date +%Y-%m-%d_%H-%M-%S).png; grim "$f" && notify-send "Desktop screenshot saved" "<img src='$f'/>"]]))

-- Color picker
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a -n"))

-- Sticky / pin
hl.bind("SUPER + S", hl.dsp.window.pin())

-- Groups
hl.bind("SUPER + g", hl.dsp.group.toggle())
hl.bind("SUPER + tab", hl.dsp.group.next())                  -- legacy: changegroupactive
hl.bind("SUPER + SHIFT + tab", hl.dsp.group.prev())          -- legacy: changegroupactive b
hl.bind("SUPER + W", hl.dsp.group.lock_active({ action = "toggle" }))  -- legacy: lockactivegroup toggle

-- Move window or group (legacy: movewindoworgroup). group_aware moves the window in/out
-- of groups along the given direction, which is the movewindoworgroup behavior.
hl.bind("SUPER + ALT + H", hl.dsp.window.move({ direction = "l", group_aware = true }))
hl.bind("SUPER + ALT + L", hl.dsp.window.move({ direction = "r", group_aware = true }))
hl.bind("SUPER + ALT + K", hl.dsp.window.move({ direction = "u", group_aware = true }))
hl.bind("SUPER + ALT + J", hl.dsp.window.move({ direction = "d", group_aware = true }))

-- Resize (coarse step) -- relative resize
hl.bind("SUPER + CTRL + L", hl.dsp.window.resize({ x = 40,  y = 0, relative = true }))
hl.bind("SUPER + CTRL + H", hl.dsp.window.resize({ x = -40, y = 0, relative = true }))
hl.bind("SUPER + CTRL + K", hl.dsp.window.resize({ x = 0,   y = -40, relative = true }))
hl.bind("SUPER + CTRL + J", hl.dsp.window.resize({ x = 0,   y = 40, relative = true }))
