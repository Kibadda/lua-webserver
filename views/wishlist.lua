---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget

return Widget:extend(function(self)
  div({ class = "wishlist" }, function()
    ul(function()
      div({ class = "horizontal-line" }, function()
        for _, item in ipairs(self.items) do
          li(item)
        end
      end)
    end)
  end)
end)
