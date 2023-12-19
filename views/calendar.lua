---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget
local config = require("lapis.config").get()

local Guess = require "models.Guess"

return Widget:extend(function(self)
  self:content_for("head", function()
    script { src = "/static/js/libs/fullcalendar.js" }
  end)

  if self.session.user and self.session.user.is_admin then
    widget(Guess:form())
  end

  div { id = "calendar", ["data-url"] = self:url_for "guesses", ["data-date"] = config.calculated_date }
end)
