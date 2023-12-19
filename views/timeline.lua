---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget

local Event = require("models.Event")

local events = Event:select "order by date asc"

return Widget:extend(function(self)
  div({ class = "timeline" }, function()
    for _, event in ipairs(events) do
      event:html()
    end
  end)
end)
