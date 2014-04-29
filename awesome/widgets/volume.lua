---- Source : http://awesome.naquadah.org/wiki/Farhavens_volume_widget
--require("awful")

-- Basic config
local cardid  = 0
local channel = "Master"

volume_widget = awful.widget.progressbar()
awful.widget.layout.margins[volume_widget.widget] = { left = 2, right = 2 }

volume_widget:set_width(10)
volume_widget:set_vertical(true)
volume_widget:set_background_color("#494B4F")
volume_widget:set_border_color(nil)
volume_widget:set_gradient_colors({ "#AECF96", "#88A175", "#FF5656" })

vicious.register(volume_widget, vicious.widgets.volume, "$1", 1, channel, cardid)

-- Volume management
function volume (mode)
  if mode == "up" then
    io.popen("amixer -q -c " .. cardid .. " sset " .. channel .. " 5%+"):read("*all")
  elseif mode == "down" then
    io.popen("amixer -q -c " .. cardid .. " sset " .. channel .. " 5%-"):read("*all")
  end
end

-- Key mapping
volume_keys = awful.util.table.join(
  awful.key({ modkey,           }, "F11",    function () volume("down") end),
  awful.key({ modkey,           }, "F12",    function () volume("up") end)
)

