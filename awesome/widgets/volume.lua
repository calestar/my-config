---- Source : http://awesome.naquadah.org/wiki/Farhavens_volume_widget
--require("awful")

-- Basic config
local cardid  = 0
local channel = "Master"

-- Widget (progress bar)
volume_widget = widget({ type = "progressbar", name = "widget", align = "right" })
volume_widget.width = 12
volume_widget.height = 1
volume_widget.border_padding = 1
volume_widget.border_width = 1
volume_widget.ticks_count = 8
volume_widget.gap = 0
volume_widget.vertical = true

volume_widget:bar_properties_set("vol",
{
  ["bg"] = "#000000",
  ["fg"] = "green",
  ["fg_center"] = "yellow",
  ["fg_end"] = "red",
  ["fg_off"] = "black",
  ["border_color"] = "#999933",
  ["min_value"] = 0,
  ["max_value"] = 100,
  ["reverse"] = false
})

-- Volume management
function volume (mode, widget)
  if mode == "update" then
    local fd = io.popen("amixer -c " .. cardid .. " -- sget " .. channel)
    local status = fd:read("*all")
    fd:close()
    local volume = string.match(status, "(%d?%d?%d)%%")
    if (volume == nil) then
        return;
    end
    volume = string.format("% 3d", volume)
    status = string.match(status, "%[(o[^%]]*)%]")
    if string.find(status, "on", 1, true) then
      widget:bar_properties_set("vol", {["bg"] = "#000000"})
    else
      widget:bar_properties_set("vol", {["bg"] = "#cc3333"})
    end
    widget:bar_data_add("vol", volume)
  elseif mode == "up" then
    io.popen("amixer -q -c " .. cardid .. " sset " .. channel .. " 5%+"):read("*all")
    volume("update", widget)
  elseif mode == "down" then
    io.popen("amixer -q -c " .. cardid .. " sset " .. channel .. " 5%-"):read("*all")
    volume("update", widget)
  else
    io.popen("amixer -c " .. cardid .. " sset " .. channel .. " toggle"):read("*all")
    volume("update", widget)
  end
end

-- Hook to update in case of external modification
awful.hooks.timer.register(10, function () volume("update", volume_widget) end)

-- Key mapping
volume_keys = awful.util.table.join(
  awful.key({ modkey,           }, "F11",    function () volume("down", volume_widget) end),
  awful.key({ modkey,           }, "F12",    function () volume("up",   volume_widget) end)
)

