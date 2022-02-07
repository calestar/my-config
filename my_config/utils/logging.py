# type: ignore[attr-defined]
from enum import Enum


class LogLevel(Enum):
    Trace = 1
    Debug = 2
    Info = 3
    Warning = 4
    Error = 5
    Critical = 6


class Logger(object):
    def __init__(self, console) -> None:
        super().__init__()
        self.console = console
        self.level = LogLevel.Info

    def setLevel(self, level: LogLevel):
        self.level = level

    def log(self, level, message):
        if self.level.value <= level.value:
            self.console.print(message)

    def trace(self, message):
        self.log(LogLevel.Trace, f"[[green]TRACE[/]] {message}")

    def debug(self, message):
        self.log(LogLevel.Debug, f"[[green]DEBUG[/]] {message}")

    def info(self, message):
        self.log(LogLevel.Info, f"[[blue]INFO[/]] {message}")

    def warn(self, message):
        self.log(LogLevel.Warning, f"[[yellow]WARNING[/]] {message}")

    def error(self, message):
        self.log(LogLevel.Error, f"[[red]ERROR[/]] {message}")

    def critical(self, message):
        self.log(LogLevel.Critical, f"[[red]CRITICAL[/]] {message}")
