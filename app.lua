local lapis = require "lapis"
local app = lapis.Application()
app:enable "etlua"
app.layout = require "views.layout"

app:get("index", "/", function()
  return {
    render = "index",
  }
end)

app:get("wishlist", "/wishlist", function(self)
  self.items = {
    "Teddybär",
    "Badewanne",
    "Klamotten",
    "Hilfe",
    "Blumen",
  }

  return {
    render = "wishlist",
  }
end)

return app
