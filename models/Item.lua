local Model = require("lapis.db.model").Model

local Item = Model:extend("items", {
  timestamp = true,
})

return Item
