local auth = require "routes.auth"
local web = require "routes.web"
local admin = require "routes.admin"

return function(app)
  auth(app)
  web(app)
  admin(app)
end
