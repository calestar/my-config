# type: ignore[attr-defined]
import shutil


def test_command_exists(sysconfig):
    assert sysconfig._command_exists("ls", bypass_cache=True)


def test_command_does_not_exist(sysconfig):
    assert not sysconfig._command_exists("iamnotacommand", bypass_cache=True)


def test_command_cache(mocker, sysconfig):
    mocker.patch("shutil.which")
    shutil.which.return_value = True
    assert not sysconfig.command_cache

    sysconfig._command_exists("whatever")
    shutil.which.assert_called_once_with("whatever")
    assert "whatever" in sysconfig.command_cache

    shutil.which.reset_mock()
    sysconfig._command_exists("whatever")
    assert shutil.which.assert_not_called

    shutil.which.reset_mock()
    sysconfig._command_exists("whatever", bypass_cache=True)
    shutil.which.assert_called_once_with("whatever")
