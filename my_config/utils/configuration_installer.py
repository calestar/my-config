# type: ignore[attr-defined]


def flatten(t):
    results = [item for sublist in t for item in sublist]

    return list(set(results))


class ConfigurationInstaller(object):
    def __init__(self, context) -> None:
        super().__init__()
        self.context = context

    def install(self, configurations):
        if not isinstance(configurations, list):
            configurations = [configurations]

        requiredUserInfos = flatten([configuration.requiredUserInfos() for configuration in configurations])
        self.context.userinfo.askUserInfos(requiredUserInfos)

        requiredPackages = flatten([configuration.requiredPackages() for configuration in configurations])
        self.context.sysctl.installPackages(requiredPackages)

        for configuration in configurations:
            self.context.sysctl.logger.info(f"Installing {configuration.name}")
            configuration.onInstall()
