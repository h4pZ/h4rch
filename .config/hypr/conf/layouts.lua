-- Layouts -- https://wiki.hypr.land/Configuring/Layouts/

hl.config({
    dwindle = {
        preserve_split = true, -- you probably want this
        force_split = 2,       -- always split to the right (new = right or bottom)
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        focus_fit_method = 1,
        follow_focus = true,
        direction = "right",
    },
})
