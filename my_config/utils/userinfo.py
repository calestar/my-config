# type: ignore[attr-defined]
from enum import Enum

import typer


class InfoTypes(Enum):
    UserEmail = 1
    UserFullName = 2


class InfoTypeBase(object):
    def __init__(self, question) -> None:
        super().__init__()
        self.question = question

    def ask(self) -> str:
        return typer.prompt(self.question)


InfoConfigs = {
    InfoTypes.UserEmail: InfoTypeBase("Please enter your email: "),
    InfoTypes.UserFullName: InfoTypeBase("Please enter your full name: "),
}


class UserInfo(object):
    def __init__(self, logger) -> None:
        super().__init__()
        self.logger = logger
        self.results = {}

    def askUserInfos(self, infos):
        self.logger.debug(f"SysCtl:askUserInfos: {[info.name for info in infos]}")

        for info in infos:
            self.results[info] = InfoConfigs[info].ask()

    def get(self, info):
        return self.results[info]
