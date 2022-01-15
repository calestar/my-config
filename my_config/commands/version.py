# type: ignore[attr-defined]
import typer

from my_config import version as tool_version
from my_config.commands.base import app, console


@app.command()
def version() -> None:
    """Gets the current version of the tool."""
    console.print(f"[yellow]my-config[/] version: [bold blue]{tool_version}[/]")
    raise typer.Exit()
