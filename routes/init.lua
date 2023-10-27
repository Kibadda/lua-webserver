local auth = require "routes.auth"
local web = require "routes.web"

return function(app)
  auth(app)
  web(app)
end
