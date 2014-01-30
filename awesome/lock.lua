-- Source: http://awesome.naquadah.org/wiki/FAQ
-- Needs: apt-get install xlockmore

lock_keys = awful.util.table.join(
  awful.key({ modkey, "Control" }, "l", function () awful.util.spawn("dm-tool lock") end)
)
