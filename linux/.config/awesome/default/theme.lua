local themes_path = require("gears.filesystem").get_themes_dir()
local dpi = require("beautiful.xresources").apply_dpi

local t = {}

t.font = "Spleen 12"

t.tasklist_disable_icon = true

t.fg_normal  = "#ffffff"
t.fg_focus   = "#00ff00"
t.fg_urgent  = "#ffffff"
t.bg_normal  = "#000000"
t.bg_focus   = "#000000"
t.bg_urgent  = "#cd00cd"
t.bg_systray = t.bg_normal

t.useless_gap   = dpi(5.0)
t.border_width  = dpi(0.6)
t.border_normal = "#000000"
t.border_focus  = "#ff0000"

return t
