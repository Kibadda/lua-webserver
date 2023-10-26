local lapis = require "lapis"
local app = lapis.Application()
local respond_to = require("lapis.application").respond_to
app:enable "etlua"
app.layout = require "views.layout"

app:match(
  "index",
  "/",
  respond_to {
    GET = function()
      return { render = true }
    end,
    POST = function(self)
      local WishlistItem = require "models.WishlistItem"
      WishlistItem:create(self.params)
      return { redirect_to = self:url_for "index" }
    end,
  }
)

app:get("wishlist", "/wishlist", function()
  return { render = true }
end)

return app
