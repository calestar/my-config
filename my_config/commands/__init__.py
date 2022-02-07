# type: ignore[attr-defined]

import my_config.commands.command_base
import my_config.commands.config_command
import my_config.commands.version_command

app = command_base.app
app.add_typer(config_command.app, name="config")

console = command_base.console
