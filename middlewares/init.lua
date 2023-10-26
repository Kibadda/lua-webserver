local function no_logged_in_user(self)
  if self.route_name ~= "login" and not self.session.user then
    if self.route_name then
      self.session.rediret_to = self.route_name
    end
    self:write { redirect_to = self:url_for "login" }
  end
end

local function csrf_token(self)
  self.csrf_token = require("lapis.csrf").generate_token(self)
end

return function(app)
  app:before_filter(no_logged_in_user)
  app:before_filter(csrf_token)
end
