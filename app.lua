local lapis = require "lapis"
local app = lapis.Application()

local middlewares = require "middlewares.init"
local routes = require "routes.init"

app:enable "etlua"
app.layout = require "views.layout"

middlewares(app)
routes(app)

return app
