-- Animations -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

-- Master switch (legacy: animations { enabled = yes })
hl.config({ animations = { enabled = true } })

-- Bezier curves (legacy: bezier = NAME, x0, y0, x1, y1)
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("linear",   { type = "bezier", points = { { 0.5, 0.5 }, { 0.5, 0.5 } } })
hl.curve("bezzz",    { type = "bezier", points = { { 0.16, 1 }, { 0.1, 1 } } })

-- Animation leaves (legacy: animation = NAME, on/off, speed, curve [, style])
hl.animation({ leaf = "windows",     enabled = true, speed = 5,   bezier = "bezzz" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 5,   bezier = "bezzz", style = "popin" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 5,   bezier = "bezzz", style = "popin" })
hl.animation({ leaf = "border",      enabled = true, speed = 10,  bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 100, bezier = "linear" }) -- add style = "loop" for the looping gradient
hl.animation({ leaf = "fade",        enabled = true, speed = 7,   bezier = "bezzz" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 4,   bezier = "bezzz", style = "slide" })
