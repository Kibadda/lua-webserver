---@diagnostic disable:undefined-global
local Model = require("lapis.db.model").Model
local Widget = require("lapis.html").Widget

local Guess = Model:extend("guesses", {
  timestamp = true,
})

function Guess.form()
  return Widget:extend(function(self)
    form({ class = "guess-create", method = "POST", action = self:url_for "guess.create" }, function()
      input { type = "hidden", name = "csrf_token", value = self.csrf_token }
      input { type = "text", name = "name", placeholder = "Name" }
      input { type = "date", name = "date", placeholder = "Datum" }
      element("select", { name = "gender" }, function()
        option({ hidden = true, disabled = true, selected = true }, "--- Auswählen ---")
        option({ value = "Mädchen" }, "Mädchen")
        option({ value = "Junge" }, "Junge")
      end)
      button({ type = "submit" }, "Speichern")
    end)
  end)
end

return Guess
