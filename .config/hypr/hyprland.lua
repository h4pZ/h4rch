-- ____________________________________________________________________________________
-- Hyprland configuration (native Lua, for Hyprland 0.55+).
--
-- This is the entry point. The actual config is split into focused modules under
-- conf/ and pulled in with require() below. Each require()d file is its own lua
-- "scope", so an error in one file won't abort the others.
-- Docs: https://wiki.hypr.land/Configuring/Start/
-- ____________________________________________________________________________________

require("conf/monitors")
require("conf/environment")
require("conf/autostart")
require("conf/input")
require("conf/looknfeel")
require("conf/animations")
require("conf/layouts")
require("conf/binds")
require("conf/rules")
require("conf/hyprglass")
