
memory_widget = awful.widget.textbox()

vicious.cache(vicious.widgets.mem)
vicious.register(memory_widget, vicious.widgets.mem, "$1 ($2MB/$3MB)", 13)


