# type: ignore[attr-defined]
import importlib.util
from os.path import exists, isdir, isfile, join

import yaml


def load_module(path):
    config_file_path = join(path, "config.yml")
    if isdir(path) and exists(config_file_path) and isfile(config_file_path):
        with open(config_file_path, "r") as stream:
            config = yaml.safe_load(stream).get("config")

        config_name = config.get("name")
        module_name = f"my-config.external-configs.{config_name}"
        module_path = join(path, config.get("module"))
        class_name = config.get("class")
        spec = importlib.util.spec_from_file_location(module_name, module_path)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        ctor = getattr(module, class_name)
        instance = ctor()
        instance.setName(config_name)
        instance.setDescription(config.get("description"))
        return instance
