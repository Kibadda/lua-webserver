---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget

local sites = {
  {
    text = "Wunschliste",
    name = "wishlist",
    logged_in = false,
  },
  {
    text = "Kalender",
    name = "calendar",
    logged_in = true,
  },
  -- {
  --   text = "Blog",
  --   name = "blog",
  --   logged_in = true,
  -- },
}

return Widget:extend(function(self)
  raw "<!DOCTYPE HTML>"
  html({ lang = "de" }, function()
    head(function()
      meta { charset = "UTF-8" }
      meta { name = "viewport", content = "width=device-width, initial-scale=1.0" }

      title(self.title or "Lapis")

      link { rel = "stylesheet", href = "/static/css/app.css" }
      script { type = "text/javascript", src = "/static/js/app.js", defer = true }

      self:content_for "head"
    end)

    body(function()
      nav(function()
        ul(function()
          for _, site in ipairs(sites) do
            if not site.logged_in or self.session.user then
              li({ class = { active = self.route_name == site.name } }, function()
                a({ href = self:url_for(site.name) }, site.text)
              end)
            end
          end

          if self.session.user then
            li({ class = "auth" }, function()
              form({ id = "logout-form", class = "hidden", method = "POST", action = self:url_for "logout" }, function()
                input { type = "hidden", name = "csrf_token", value = self.csrf_token }
              end)

              a({ href = "#", id = "logout-button" }, "Logout")
            end)
          else
            li({ class = { "auth", active = self.route_name == "login" } }, function()
              a({ href = self:url_for "login" }, "Login")
            end)
          end
        end)
      end)

      main(function()
        if self.flash then
          div({ class = { self.flash.status, "flash" } }, self.flash.message)
        end

        self:content_for "inner"
      end)
    end)
  end)
end)
