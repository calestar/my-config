# type: ignore[attr-defined]
import pathlib
import shutil
from os import listdir
from os.path import join

from my_config.utils.module_loader import load_module

CURRENT_FILE_DIR = pathlib.Path(__file__).parent.resolve()


class SysConfig(object):
    def __init__(self) -> None:
        super().__init__()
        self.command_cache = dict()
        self.config_cache = list()

        self._discover_all_configs()

    def _command_exists(self, command, bypass_cache=False) -> bool:
        if bypass_cache or command not in self.command_cache:
            self.command_cache[command] = shutil.which(command) is not None

        return self.command_cache[command]

    def _discover_all_configs(self):
        if not self.config_cache:
            base_path = f"{CURRENT_FILE_DIR}/../configurations"
            for path in listdir(base_path):
                module = load_module(join(base_path, path))
                if module:
                    self.config_cache.append(module)

        return self.config_cache

    def all_configurations(self):
        return self.config_cache

    def setupConfigurations(self, userinfo, sysctl):
        for config in self.all_configurations():
            config.setup(self, userinfo, sysctl)

    def has_git(self) -> bool:
        return self._command_exists("git")

    def get_enabled_configurations(self):
        return [config for config in self.all_configurations() if config.isEnabled()]

    def find_configuration(self, name):
        results = [config for config in self.all_configurations() if config.name == name]
        return results[0]
