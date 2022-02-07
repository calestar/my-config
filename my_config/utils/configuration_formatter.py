# type: ignore[attr-defined]


class ConfigurationFormatter(object):
    def format(self, configuration):
        return f" - [blue]{configuration.name}[/]: {configuration.description}"
