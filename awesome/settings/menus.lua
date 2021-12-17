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
   {"VSCode","/usr/bin/code", "/usr/share/code/resources/app/resources/linux/code.png"},
   {"Chromium","/usr/bin/chromium"}
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

