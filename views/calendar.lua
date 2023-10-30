---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget
local config = require("lapis.config").get()

local Guess = require "models.Guess"

return Widget:extend(function(self)
  if self.session.user.is_admin then
    widget(Guess:form())
  end

  script { src = "https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js" }

  div { id = "calendar", ["data-date"] = config.calculated_date }
end)
