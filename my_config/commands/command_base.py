# type: ignore[attr-defined]
from dataclasses import dataclass

import typer
from rich.console import Console

from my_config.utils.logging import Logger, LogLevel
from my_config.utils.sysconfig import SysConfig
from my_config.utils.sysctl import SysCtl
from my_config.utils.userinfo import UserInfo

console = Console()


@dataclass
class Common:
    sysconfig: SysConfig
    userinfo: UserInfo
    sysctl: SysCtl


app = typer.Typer(
    name="my-config",
    help="Simple CLI used to manage local configuration and easier personal machine/VM bootstrap",
    add_completion=True,
)


@app.callback()
def common(
    ctx: typer.Context,
    verbose: bool = typer.Option(False, help="More output"),
    quiet: bool = typer.Option(False, help="Less output"),
    dryRun: bool = typer.Option(False, "--dry-run", help="Don't actually do anything"),
):
    if verbose and quiet:
        console.print(f"[red]Error[/]: Can't have both verbose and quiet")
        raise typer.Abort()

    logger = Logger(console)
    sysconfig = SysConfig()
    userinfo = UserInfo(logger)
    sysctl = SysCtl(logger, dry_run=dryRun)

    level = LogLevel.Info
    if verbose:
        level = LogLevel.Trace
    elif quiet:
        level = LogLevel.Warning

    logger.setLevel(level)
    sysconfig.setupConfigurations(userinfo, sysctl)

    ctx.obj = Common(sysconfig, userinfo, sysctl)
