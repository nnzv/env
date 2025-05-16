-- awesome lib
local g   = require("gears")
local a   = require("awful")
local w   = require("wibox")
local b   = require("beautiful")

require("awful.autofocus")

-- theme
b.init("~/.config/awesome/default/theme.lua")
-- alt-key
modkey = "Mod1"

-- Layouts 
a.layout.layouts = { a.layout.suit.fair, a.layout.suit.floating }

a.screen.connect_for_each_screen(function(s)
    s.wbx = a.wibar({position = "bottom", screen = s})
    s.wbx:setup {
        layout = w.layout.align.horizontal,
        a.widget.textclock("%Y-%m-%dT%H:%M:%S", 1),
    }
    a.tag({"1","2","3","4","5"}, s, a.layout.layouts[1])
    -- tag.connect_signal("property::selected", function(t)
    --     s.wbx.visible = t.name ~= "2"
    -- end)
end)

-- Key bindings
globalkeys = g.table.join(
    a.key({ modkey,           }, "j",
        function ()
            a.client.focus.byidx( 1)
        end
    ),
    a.key({ modkey,           }, "k",
        function ()
            a.client.focus.byidx(-1)
        end
    ),
    a.key({modkey,            }, ".", 
              a.client.movetoscreen),
    -- Standard program
    a.key({ modkey }, "a",      function () a.spawn("alacritty") end),
    a.key({ modkey }, "r",                           awesome.restart),
    a.key({ modkey }, "q",                              awesome.quit),
    a.key({ modkey }, "space", function () a.layout.inc( 1)      end),
    a.key({ modkey }, "p", function()       a.spawn("dmenu_run") end)
)

-- Bind all key numbers to tags
for i = 1, 9 do
    globalkeys = g.table.join(globalkeys,
        -- View tag only.
        a.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = a.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end),
        -- Move client to tag.
        a.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end)
    )
end

-- Set keys
root.keys(globalkeys)

-- Rules to apply to new clients
a.rules.rules = {
    { 
        rule = {},
        properties = { 
            border_width  = b.border_width,
            border_color  = b.border_normal,
            focus         = a.client.focus.filter,
            raise         = true,
            keys          = g.table.join(
                                a.key({ modkey }, "f", function (c) c.fullscreen = not c.fullscreen c:raise() end),
                                a.key({ modkey }, "d", function (c) c:kill() end),
                                a.key({ modkey }, "s", function (c) c.sticky = not c.sticky c.ontop = c.floating  end, { group = "client"})
                            ),
            buttons       = g.table.join(
                                a.button({ }, 1, function (c)
                                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                                end),
                                a.button({ modkey }, 1, function (c)
                                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                                    a.mouse.client.move(c)
                                end),
                                a.button({ modkey }, 3, function (c)
                                    c:emit_signal("request::activate", "mouse_click", {raise = true})
                                    a.mouse.client.resize(c)
                                end)
                           ),
            screen        = a.screen.preferred,
            placement     = a.placement.no_overlap+a.placement.no_offscreen,
        }
    },
    -- {
    --     rule = {
    --         class = "Alacritty"
    --     },
    --     properties = {
    --         -- screen = a.screen.preferred, 
    --         tag = function(c) return a.screen.preferred(c).tags[2] end
    --     }
    -- }
}

client.connect_signal("focus", function(c) c.border_color = b.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = b.border_normal end)
