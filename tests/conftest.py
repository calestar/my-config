# type: ignore[attr-defined]
import pathlib
from os import listdir
from os.path import isfile, join

CURRENT_FILE_DIR = pathlib.Path(__file__).parent.resolve()


def get_all_shared_steps_modules():
    steps_base_path = f"{CURRENT_FILE_DIR}/steps"
    return [f"steps.{f}".rsplit(".", 1)[0] for f in listdir(steps_base_path) if isfile(join(steps_base_path, f)) and f.endswith(".py")]


def get_all_shared_fixtures_modules():
    fixtures_base_path = f"{CURRENT_FILE_DIR}/fixtures"
    return [
        f"fixtures.{f}".rsplit(".", 1)[0] for f in listdir(fixtures_base_path) if isfile(join(fixtures_base_path, f)) and f.endswith(".py")
    ]


pytest_plugins = get_all_shared_steps_modules() + get_all_shared_fixtures_modules()
