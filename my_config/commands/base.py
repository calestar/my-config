# type: ignore[attr-defined]
import typer
from rich.console import Console

from my_config import version as tool_version

app = typer.Typer(
    name="my-config",
    help="Awesome `my-config` is a Python cli/package created with https://github.com/TezRomacH/python-package-template",
    add_completion=True,
)
console = Console()


@app.command()
def version() -> None:
    """Gets the current version of the tool."""
    console.print(f"[yellow]my-config[/] version: [bold blue]{tool_version}[/]")
    raise typer.Exit()
