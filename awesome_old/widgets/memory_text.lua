memory_widget = widget({ type = "textbox" })

vicious.cache(vicious.widgets.mem)
vicious.register(memory_widget, vicious.widgets.mem, "Memory usage: $2MB/$3MB", 61)

