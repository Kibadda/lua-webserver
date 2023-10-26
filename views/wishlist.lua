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

  if self.session.user then
    form({ method = "POST", action = self:url_for "logout" }, function()
      input { type = "hidden", name = "csrf_token", value = self.csrf_token }
      button({ type = "submit" }, "Logout")
    end)
  end
end)
