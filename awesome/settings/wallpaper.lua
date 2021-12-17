local beautiful = require("beautiful")
local gears = require("gears")
require("lfs")

-- Helpers
function file_exists(path)
  return lfs.attributes(path,'mode') ~= nil and path
end

-- Setup the wallpapers
if beautiful.wallpaper then
  for s = 1, screen.count() do
    local filename = configpath.."/.background_screen_"..s
    if file_exists(filename) then
      gears.wallpaper.maximized(filename, s, true)
    end
  end
end


