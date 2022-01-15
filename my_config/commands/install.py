# type: ignore[attr-defined]
import typer

from my_config.commands.base import app, console


@app.command()
def install() -> None:
    """Installs packages or configuration into the system."""
    console.print("[red]TODO[/]")
    raise typer.Exit()
