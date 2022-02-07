# type: ignore[attr-defined]
import pytest

from my_config.utils.sysconfig import SysConfig


@pytest.fixture
def sysconfig():
    return SysConfig()
