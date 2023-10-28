local User = require "models.User"
local config = require("lapis.config").get()
local bcrypt = require "bcrypt"

for _, user_data in ipairs(config.admins or {}) do
  local user = User:find { name = user_data.name }

  local password = bcrypt.digest(user_data.password, config.bcrypt_rounds)

  if not user then
    User:create {
      name = user_data.name,
      password = password,
      is_admin = 1
    }
  end
end
