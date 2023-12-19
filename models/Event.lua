---@diagnostic disable:undefined-global
local Model = require("lapis.db.model").Model
local Widget = require("lapis.html").Widget

local Event, Event_mt = Model:extend("events", {
  timestamp = true,
})

function Event_mt:html()
  local event = self
  return Widget:extend(function()
    div({ class = "event", ["date-is"] = event.date }, function()
      h1(event.title)
      if event.description then
        p(event.description)
      end
    end)
  end)
end

return Event
