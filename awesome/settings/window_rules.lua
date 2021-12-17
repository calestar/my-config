local awful = require("awful")
local beautiful = require("beautiful")

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
        {       rule = { },
                properties = {
                        border_width = beautiful.border_width,
                        border_color = beautiful.border_normal,
                        focus = awful.client.focus.filter,
                        keys = clientkeys,
                        buttons = clientbuttons
                }
        },
        {
                rule = { class = "URxvt"},
                properties = {
                        tag = tags[1][2]
                },
        },
        {
                rule = { class = "Chromium-browser"},
                properties = {
                        tag = tags[1][1]
                },
        },
        {
                rule = { class = "Code" },
                properties = {
                        tag = tags[1][4],
                        switchtotag = tags[1][4]
                }
        }
}
-- }}}


