# type: ignore[attr-defined]
from my_config.commands.command_base import app
from my_config.commands.install_command import install
from my_config.commands.version_command import version

if __name__ == "__main__":
    app()
