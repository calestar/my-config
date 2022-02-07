# type: ignore[attr-defined]
from my_config.configuration_base import ConfigurationBase
from my_config.utils.userinfo import InfoTypes


class GitConfiguration(ConfigurationBase):
    def isEnabled(self):
        return True

    def requiredPackages(self):
        return ["git", "git-gui", "gitk"]

    def requiredUserInfos(self):
        return [InfoTypes.UserFullName, InfoTypes.UserEmail]

    def onInstall(self):
        self.sysctl.run("git config --global core.editor vim")
        self.sysctl.run("git config --global color.branch auto")
        self.sysctl.run("git config --global color.diff auto")
        self.sysctl.run("git config --global color.status auto")
        self.sysctl.run(f'git config --global user.name "{self.userinfo.get(InfoTypes.UserFullName)}"')
        self.sysctl.run(f"git config --global user.email {self.userinfo.get(InfoTypes.UserEmail)}")
