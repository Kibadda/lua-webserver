local csrf = require "lapis.csrf"
local respond_to = require("lapis.application").respond_to
local capture_errors = require("lapis.application").capture_errors

return function(app)
  app:get("index", "/", function()
    return { render = "wishlist" }
  end)

  app:match(
    "login",
    "/login",
    respond_to {
      GET = function()
        return { render = true }
      end,
      POST = capture_errors(function(self)
        csrf.assert_token(self)
      end),
    }
  )
end
