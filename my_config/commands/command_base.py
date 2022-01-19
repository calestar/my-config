# type: ignore[attr-defined]
import typer
from rich.console import Console

from my_config import version as tool_version

app = typer.Typer(
    name="my-config",
    help="Simple CLI used to manage local configuration and easier personal machine/VM bootstrap",
    add_completion=True,
)

console = Console()
