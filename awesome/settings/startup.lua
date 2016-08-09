require("myrc.run_once")
local awful = require("awful")

--run_once("chromium-browser http://127.0.0.1:4000/")
--run_once("pidgin")
--run_once("synclient tapbutton1=1")
run_once("urxvtd","urxvtd --quiet --opendisplay --fork")
