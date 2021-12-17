local awful = require("awful")

-- GLOBAL KEYBINDINGS
globalkeys = awful.util.table.join(globalkeys,
    --PROMPT EXECUTE
    awful.key({ modkey },            "q",     function () mypromptbox[mouse.screen]:run() end),
    --MOD+TAB -- instead of switching to last client, rotate trough all clients
    awful.key({ modkey }, "Tab",
        function ()
            awful.client.focus.byidx(1)
            if client.focus then
                client.focus:raise()
            end
        end)
)

-- CLIENT KEYS (work on current clients-windows)
clientkeys = awful.util.table.join(clientkeys,
    --KILL active client
    awful.key({ modkey, "Shift"   }, "x",      function (c) c:kill()                         end)
)
