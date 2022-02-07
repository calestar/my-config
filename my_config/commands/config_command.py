# type: ignore[attr-defined]
import typer

from my_config.commands.command_base import app, console
from my_config.utils.configuration_formatter import ConfigurationFormatter
from my_config.utils.configuration_installer import ConfigurationInstaller

app = typer.Typer()


@app.command()
def list(ctx: typer.Context) -> None:
    """Lists all available configurations for this system."""
    formatter = ConfigurationFormatter()
    configurations = ctx.obj.sysconfig.get_enabled_configurations()
    console.print("Available configurations:")
    for config in configurations:
        console.print(formatter.format(config))


@app.command()
def install(ctx: typer.Context, config_name: str) -> None:
    """Installs a configuration into the system."""
    installer = ConfigurationInstaller(ctx.obj)
    config = ctx.obj.sysconfig.find_configuration(config_name)
    installer.install(config)
    raise typer.Exit()
