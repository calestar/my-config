
-- Initialize widget
cpu_widget = awful.widget.graph()
awful.widget.layout.margins[cpu_widget.widget] = { left = 2, right = 2 }

-- Graph properties
cpu_widget:set_width(50)
cpu_widget:set_background_color("#494B4F")
cpu_widget:set_color("#FF5656")
cpu_widget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })

-- Register widget
vicious.register(cpu_widget, vicious.widgets.cpu, "$1")

