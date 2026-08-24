-- hyprglass -- liquid glass effect on transparent windows
-- https://github.com/hyprnux/hyprglass
--
-- The plugin registers its Lua API only once it is loaded (autostart.lua runs
-- `hyprpm reload -n`). On the very first config parse of a session the plugin is
-- not up yet, so `hl.plugin.hyprglass` is nil and this whole file no-ops --
-- Hyprland re-parses the config after the plugin loads, and that pass applies it.
-- Hence the guard: it is not optional.

if not hl.plugin.hyprglass then
    return
end

local hg = hl.plugin.hyprglass

-- ____________________________________________________________________________
-- Global

hg.config({
    -- Whitelist mode: off everywhere, opted in per-window via the
    -- +hyprglass_enabled tag below. Ghostty is the only client with a
    -- translucent background (ghostty cfg: background-opacity = 0.8), and it is
    -- the only place the glass has anything to show through.
    enabled = false,
    default_theme = "dark",

    -- Applies to every glassed window, which -- given `enabled = false` above --
    -- means ghostty and nothing else. No per-window tagging needed, and it
    -- covers windows opened before and after a reload alike.
    -- Built-ins: high_contrast, subtle, clear, glass. "custom" is defined below.
    default_preset = "custom",

    -- Glass replaces Hyprland's blur on glassed windows: the plugin sets the
    -- `noblur` property on them, otherwise the blur:new_optimizations cache
    -- (captured before plugin decorations render) hides the glass on static
    -- windows -- the "only shows while dragging" symptom. Leave this on unless
    -- you want to manage `noblur` window rules by hand.
    manage_window_blur = true,

    -- Layer surfaces (waybar, swaync) stay off -- see the bottom of this file.
    layers = { enabled = false },
})

-- ____________________________________________________________________________
-- Tuning preset -- every overridable setting, dark variant
--
-- Why a preset and not a plain `dark = {}` in hg.config above: values resolve as
--   preset (theme variant -> shared -> inherited) -> theme override -> global -> default
-- The preset tier wins, so with a preset active a global `dark = {}` block is
-- silently ignored for anything the preset defines. Putting the knobs in the
-- preset's own dark variant makes all of them live.
--
-- Seeded with the built-in `glass` values, so this starts out looking identical
-- to what you had. Edit freely, then `hyprctl reload`.

hg.preset("custom", {
    inherits = "glass",

    dark = {
        -- ── Frost ──────────────────────────────────────────────────────────
        blur_strength        = 0.0,        -- blur radius scale (value * 12.0 px). 0.0 = no frost
        blur_iterations      = 2,          -- int, gaussian passes, 1-5. higher = smoother + costlier

        -- ── Edge / lens ────────────────────────────────────────────────────
        refraction_strength  = 8.0,        -- edge refraction. docs say 0.0-1.0, but `glass` ships 8.0
        chromatic_aberration = 0.0,
        edge_thickness       = 0.02,       -- 0.0-0.15, bezel width as fraction of smallest dimension
        lens_distortion      = 0.0,        -- 0.0-1.0, centre dome magnification

        -- ── Highlights ─────────────────────────────────────────────────────
        fresnel_strength     = 0.0,        -- 0.0-1.0, edge glow
        specular_strength    = 0.0,        -- 0.0-1.0, top-biased highlight

        -- ── Body ───────────────────────────────────────────────────────────
        glass_opacity        = 1.0,        -- 0.0-1.0, overall effect opacity
        tint_color           = 0xffffff00, -- RRGGBBAA. last two digits = tint strength (00 = untinted)

        -- ── Tone mapping (theme-specific; these are the dark defaults) ──────
        brightness           = 1.00,       -- multiplier
        contrast             = 1.00,       -- around midpoint
        saturation           = 1.00,       -- 0 = greyscale, 1 = full
        vibrancy             = 0.00,       -- selective saturation boost
        vibrancy_darkness    = 0.0,        -- 0-1, vibrancy influence on dark areas
        adaptive_dim         = 0.0,        -- 0-1, dims bright areas behind the glass
        adaptive_boost       = 0.0,        -- 0-1, lifts dark areas behind the glass
    },
})

-- ____________________________________________________________________________
-- Per-window overrides (tags)
--
--   +hyprglass_disabled          force off (wins over _enabled)
--   +hyprglass_enabled           force on
--   +hyprglass_theme_dark|light  theme
--   +hyprglass_preset_<name>     preset
--
-- Try presets live, no reload:  hyprctl dispatch tagwindow +hyprglass_preset_glass

-- Ghostty only. Everything else is opaque, so glass would cost work and render
-- nothing visible.
hl.window_rule({ match = { class = "com.mitchellh.ghostty" }, tag = "+hyprglass_enabled" })

-- NOTE: do not match on transient state (fullscreen, floating, focus) here.
-- `tag +x` is sticky -- Hyprland applies it on match but never withdraws it when
-- the window stops matching. A `fullscreen = true` rule permanently kills glass
-- on any window you fullscreen once, long after it leaves fullscreen.
-- Class matches are safe because a class never changes.

