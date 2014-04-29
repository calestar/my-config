
memory_widget = awful.widget.progressbar()
awful.widget.layout.margins[memory_widget.widget] = { left = 2, right = 2 }

memory_widget:set_width(10)
memory_widget:set_vertical(true)
memory_widget:set_background_color("#494B4F")
memory_widget:set_border_color(nil)

memory_widget:set_gradient_colors({ "#AECF96", "#88A175", "#FF5656" })

vicious.cache(vicious.widgets.mem)
vicious.register(memory_widget, vicious.widgets.mem, "$1", 61)

