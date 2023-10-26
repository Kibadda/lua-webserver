---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget

return Widget:extend(function(self)
  form({ class = "login", method = "POST", action = self:url_for "login" }, function()
    input { type = "hidden", name = "csrf_token", value = self.csrf_token }
    input { type = "text", name = "name", placeholder = "Name" }
    input { type = "password", name = "password", placeholder = "Passwort" }
    button({ type = "submit" }, "Login")
  end)
end)
