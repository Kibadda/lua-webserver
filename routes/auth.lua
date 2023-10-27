local respond_to = require("lapis.application").respond_to
local capture_errors = require("lapis.application").capture_errors

return function(app)
  app:match(
    "login",
    "/login",
    respond_to {
      GET = function(self)
        self.title = "Login"

        return { render = true }
      end,
      POST = capture_errors(function(self)
        require("lapis.csrf").assert_token(self)

        local User = require "models.User"

        local user, error = User:verify(self.params)

        if not user then
          self.session.flash = {
            message = error,
            status = "error",
          }

          return { redirect_to = self:url_for "login" }
        end

        self.session.user = user

        if self.session.redirect_to then
          local redirect_to = self.session.redirect_to
          self.session.redirect_to = nil
          return { redirect_to = self:url_for(redirect_to) }
        end

        return { redirect_to = "/" }
      end),
    }
  )

  app:post("logout", "/logout", function(self)
    require("lapis.csrf").assert_token(self)

    self.session.user = nil

    return { redirect_to = "/" }
  end)
end
