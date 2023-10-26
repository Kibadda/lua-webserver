---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget

local WishlistItem = require "models.WishlistItem"

return Widget:extend(function(self)
  div({ class = "wishlist" }, function()
    ul(function()
      div({ class = "horizontal-line" }, function()
        for _, item in ipairs(WishlistItem:select()) do
          li(item.name)
        end
      end)
    end)
  end)
end)
