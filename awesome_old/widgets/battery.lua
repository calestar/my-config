
battery_widget = awful.widget.progressbar()
awful.widget.layout.margins[battery_widget.widget] = { left = 2, right = 2 }

battery_widget:set_width(10)
battery_widget:set_vertical(true)
battery_widget:set_background_color("#494B4F")
battery_widget:set_border_color(nil)

battery_widget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

vicious.cache(vicious.widgets.bat)
vicious.register(battery_widget, vicious.widgets.bat, "$2", 61, "BAT0")

