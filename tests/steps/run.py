# type: ignore[attr-defined]
import pytest
from pytest_bdd import parsers, then, when
from typer.testing import CliRunner

from my_config import version
from my_config.__main__ import app

runner = CliRunner()


@when(parsers.parse('I run my-config with arguments "{arguments}"'), target_fixture="command_result")
def run_with_args(arguments):
    result = runner.invoke(app, arguments.split(" "))

    return result


@then("output should contain the current version")
def output_current_version(command_result):
    assert version in command_result.stdout


@then("command ran successfully")
def output_current_version(command_result):
    assert command_result.exit_code == 0
