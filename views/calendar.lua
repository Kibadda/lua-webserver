---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget
local config = require("lapis.config").get()

local Guess = require "models.Guess"

return Widget:extend(function(self)
  if self.session.user.is_admin then
    widget(Guess:form())
  end

  script { src = "/static/js/libs/fullcalendar.js" }

  div { id = "calendar", ["data-date"] = config.calculated_date }
end)
