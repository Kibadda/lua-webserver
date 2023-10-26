local schema = require "lapis.db.schema"
local types = schema.types

return {
  [1] = function()
    schema.create_table("wishlist_items", {
      { "id", types.integer { primary_key = true } },
      { "name", types.text },
      { "url", types.text { null = true } },
    })
  end,
  [2] = function()
    schema.create_table("users", {
      { "id", types.integer { primary_key = true } },
      { "name", types.text },
      { "password", types.text },
      { "is_admin", types.integer { default = 0 } },
    })
  end,
}
