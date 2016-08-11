-- AWESOME CONFIG
-- Initial code from: Tomas Pruzina (tomas.pruzina@gmail.com)
-- Description: Awesome config, tested on Gentoo's awesome 3.5.1

-- Standard awesome library
local gears = require("gears")
awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")

-- EXTENSIONS (functions etc)
local myro  = require("myrc.run_once")  -- run app as long it's not running already

-- VARIABLES
terminal = "urxvt"
editor = "vim"
editor_cmd = terminal .. " -e " .. editor
configpath="/home/"..os.getenv("USER").."/.config/awesome/"

-- THEME
-- default theme
beautiful.init("/usr/share/awesome/themes/default/theme.lua")

-- Backgrounds
require("settings.wallpaper")

-- Default modkey (DEFAULT Mod4 = WinKey)
modkey = "Mod4"

-- TAGS (screens) && LAYOUTS
require("settings.tags")

-- MENUS (menubar, etc)
require("settings.menus")

-- Default wibox stuff (gentoo config)
require("stock.wiboxrc")

-- Key && mouse bindings
require("stock.binds")
require("settings.custom_binds")
root.keys(globalkeys) -- this actually sets the keys

-- WINDOW RULES
-- rules per app (placement, floating, etc)
require("settings.window_rules")

-- SIGNALs function to execute when a new client appears.
require("stock.signals")

-- STARTUP apps
require("settings.startup")

local myerr = require("myrc.error")     -- error reporting

