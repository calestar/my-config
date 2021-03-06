local awful = require("awful")
local beautiful = require("beautiful")

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
        {
                rule = { class = "Firefox"},
                properties= { tag = tags[1][1] },
        },
        {
                rule = { class = "Chromium-Browser"},
                properties= { tag = tags[1][1] },
        },
        {
                rule = { class = "gimp" },
                properties = { floating = true }
        },
        {
                rule = { class = "Remmina" },
                properties = { floating = true,
                               tag = tags[1][7],
                               switchtotag = tags[1][7]}
        },
        {
                rule = { class = "Vpnui" },
                properties = { floating = true,
                               tag = tags[1][7],
                               switchtotag = tags[1][7]}
        },

}
-- }}}


