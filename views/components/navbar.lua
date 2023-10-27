---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget

local sites = {
  {
    text = "Wunschliste",
    name = "wishlist",
    logged_in = false,
  },
  {
    text = "Blog",
    name = "blog",
    logged_in = true,
  },
}

return Widget:extend(function(self)
  nav(function()
    ul(function()
      for _, site in ipairs(sites) do
        if not site.logged_in or self.session.user then
          li({ class = self.route_name == site.name and "active" or nil }, function()
            a({ href = self:url_for(site.name) }, site.text)
          end)
        end
      end

      if self.flash then
        div({ class = self.flash.status .. " flash" }, self.flash.message)
      end

      if self.session.user then
        li({ class = "auth" }, function()
          form({ id = "logout-form", class = "hidden", method = "POST", action = self:url_for "logout" }, function()
            input { type = "hidden", name = "csrf_token", value = self.csrf_token }
          end)

          a({ href = "#", id = "logout-button" }, "Logout")
        end)
      else
        li({ class = "auth" .. (self.route_name == "login" and " active" or "") }, function()
          a({ href = self:url_for "login" }, "Login")
        end)
      end
    end)
  end)
end)
