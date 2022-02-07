# type: ignore[attr-defined]


import os

import typer


class SysCtl(object):
    def __init__(self, logger, dry_run=False) -> None:
        super().__init__()
        self.dry_run = dry_run
        self.logger = logger

    def run(self, command, abort_on_error=True):
        if not self.dry_run:
            self.logger.debug(f"SysCtl:run: '{command}'")
            result = os.system(command)  # nosec
            if result:
                if abort_on_error:
                    self.logger.critical(f"-> Command failed with error code '{result}'")
                    raise typer.Abort()
                else:
                    self.logger.warn(f"-> Command failed with error code '{result}'")
        else:
            self.logger.debug(f"SysCtl:run (Skipped): '{command}'")

    def installPackages(self, packages):
        self.logger.debug(f"SysCtl:installPackages: {packages}")
        self.run(f"sudo apt-get install {' '.join(packages)}")
