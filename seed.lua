local User = require "models.User"
local config = require("lapis.config").get()
local bcrypt = require "bcrypt"

local admin = User:find { name = "admin" }

local password = bcrypt.digest(config.admin_password, config.bcrypt_rounds)

if not admin then
  User:create {
    name = "admin",
    password = password,
    is_admin = 1,
  }
else
  admin:update {
    password = password,
    is_admin = 1,
  }
end
