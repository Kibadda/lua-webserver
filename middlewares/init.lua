local function redirect_if_not_logged_in(self)
  local exceptions = {
    index = true,
    login = true,
  }

  if exceptions[self.route_name] then
    return
  end

  if not self.session.user then
    if self.route_name then
      self.session.rediret_to = self.route_name
    end
    self:write { redirect_to = self:url_for "login" }
  end
end

local function redirect_if_logged_in(self)
  if self.session.user and self.route_name == "login" then
    self:write { redirect_to = self:url_for "index" }
  end
end

local function set_csrf_token(self)
  self.csrf_token = require("lapis.csrf").generate_token(self)
end

return function(app)
  app:before_filter(redirect_if_not_logged_in)
  app:before_filter(redirect_if_logged_in)
  app:before_filter(set_csrf_token)
end
