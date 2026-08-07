-- Look and feel -- https://wiki.hypr.land/Configuring/Basics/Variables/
-- Covers: cursor, general (borders/gaps), group/groupbar, decoration (rounding/blur/shadow).

hl.config({
    cursor = {
        no_hardware_cursors = true,
    },
})

hl.config({
    general = {
        gaps_in = 10,
        gaps_out = 20,
        border_size = 3,
        -- ["col.active_border"] = { colors = { "rgba(F9588Fff)", "rgba(ff8585ff)", "rgba(8598ffff)" }, angle = 320 },
        ["col.active_border"] = { colors = { "rgba(5d40f0ff)", "rgba(ff8585ff)", "rgba(8598ffff)" }, angle = 320 },
        ["col.inactive_border"] = "rgba(595959aa)",

        layout = "dwindle",
    },
})

hl.config({
    group = {
        ["col.border_active"] = { colors = { "rgba(5d40f0ff)", "rgba(ff8585ff)", "rgba(8598ffff)" }, angle = 270 },
        ["col.border_inactive"] = "rgba(595959aa)",
        ["col.border_locked_active"] = { colors = { "rgba(5d40f0ff)", "rgba(ff8585ff)", "rgba(8598ffff)" }, angle = 270 },
        ["col.border_locked_inactive"] = "rgba(595959aa)",

        groupbar = {
            render_titles = false,
            gradients = false,
            height = 14,
            ["col.active"] = "rgba(8598ffff)",
            ["col.inactive"] = "rgba(8598ff66)",
            ["col.locked_active"] = "rgba(ff8585ff)",
            ["col.locked_inactive"] = "rgba(ff858566)",
        },
    },
})

hl.config({
    decoration = {
        rounding = 0,

        blur = {
            enabled = true,
            size = 3,
            passes = 3,
            new_optimizations = true,
        },

        -- Must stay enabled: hyprglass needs the shadow decoration present in the
        -- render pipeline (it auto-enables it at load, but a config reload would
        -- flip it back off). Visual values are free to be whatever you like.
        shadow = {
            enabled = true,
            range = 10,
            render_power = 3,
            color = "rgba(00000000)", -- fully transparent: decoration present, nothing drawn
        },
    },
})
