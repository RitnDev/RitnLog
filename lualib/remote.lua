local flib = require(ritnlog.defines.flib)

local ritnlog_interface =
{
  trace_event = function(mod_name, data)
    data.remote = {
        enabled = true,
        mod_name = mod_name,
    }
    return flib.trace_event(data)
  end,
}


if not remote.interfaces["ritnlog"] then
  remote.add_interface("ritnlog", ritnlog_interface)
end