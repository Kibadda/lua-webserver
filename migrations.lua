local schema = require "lapis.db.schema"
local types = schema.types

return {
  [1] = function()
    schema.create_table("items", {
      { "id", types.integer { primary_key = true } },
      { "name", types.text },
      { "url", types.text { null = true } },
      { "buyer", types.text { null = true } },
      { "created_at", types.text },
      { "updated_at", types.text },
    })
  end,
  [2] = function()
    schema.create_table("users", {
      { "id", types.integer { primary_key = true } },
      { "name", types.text },
      { "password", types.text },
      { "is_admin", types.integer { default = 0 } },
      { "created_at", types.text },
      { "updated_at", types.text },
    })
  end,
}
