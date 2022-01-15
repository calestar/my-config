# type: ignore[attr-defined]
from my_config.commands.base import app
from my_config.commands.install import install
from my_config.commands.version import version

if __name__ == "__main__":
    app()
