local function redirect_if_not_logged_in(self)
  local exceptions = {
    wishlist = true,
    login = true,
  }

  if exceptions[self.route_name] then
    return
  end

  if not self.session.user then
    self.session.redirect_to = self.route_name
    self:write { redirect_to = self:url_for "login" }
  end
end

local function redirect_if_logged_in(self)
  if self.session.user and self.route_name == "login" then
    self:write { redirect_to = "/" }
  end
end

local function set_csrf_token(self)
  self.csrf_token = require("lapis.csrf").generate_token(self)
end

local function set_flash_from_session(self)
  if self.session.flash then
    self.flash = self.session.flash
    self.session.flash = nil
  end
end

return function(app)
  app:before_filter(redirect_if_not_logged_in)
  app:before_filter(redirect_if_logged_in)
  app:before_filter(set_csrf_token)
  app:before_filter(set_flash_from_session)
end
