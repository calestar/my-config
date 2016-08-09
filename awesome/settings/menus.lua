local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")

-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

programsmenu = {
   {"Chrome","/usr/bin/google-chrome", "/opt/google/chrome/product_logo_32.png"},
   {"Chromium","/usr/bin/chromium-browser"}
}

mymainmenu = awful.menu({ items = { { "programs", programsmenu },
                                    { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it

