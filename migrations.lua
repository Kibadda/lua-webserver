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
}
