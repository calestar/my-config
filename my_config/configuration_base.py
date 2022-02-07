# type: ignore[attr-defined]


class ConfigurationBase:
    def setup(self, sysconfig, userinfo, sysctl):
        self.sysconfig = sysconfig
        self.userinfo = userinfo
        self.sysctl = sysctl

    def setName(self, name):
        self.name = name

    def setDescription(self, description):
        self.description = description

    def isEnabled(self):
        return True
