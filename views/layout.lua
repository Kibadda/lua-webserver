---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget

local Navbar = require "views.components.navbar"

return Widget:extend(function(self)
  raw "<!DOCTYPE HTML>"
  html({ lang = "de" }, function()
    head(function()
      meta { charset = "UTF-8" }
      meta { name = "viewport", content = "width=device-width, initial-scale=1.0" }

      title(self.title or "Lapis")

      link { rel = "stylesheet", href = "/static/css/app.css" }
      script { type = "text/javascript", src = "/static/js/app.js", defer = true }
    end)

    body(function()
      widget(Navbar())

      main(function()
        self:content_for "inner"
      end)
    end)
  end)
end)
