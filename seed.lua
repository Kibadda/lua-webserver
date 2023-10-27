local User = require "models.User"
local config = require("lapis.config").get()
local bcrypt = require "bcrypt"

local michi = User:find { name = "michi" }

local password = bcrypt.digest(config.michi_password, config.bcrypt_rounds)

if not michi then
  User:create {
    name = "admin",
    password = password,
    is_admin = 1,
  }
else
  michi:update {
    password = password,
    is_admin = 1,
  }
end

local annabell = User:find { name = "annabell" }

local password = bcrypt.digest(config.annabell_password, config.bcrypt_rounds)

if not annabell then
  User:create {
    name = "admin",
    password = password,
    is_admin = 1,
  }
else
  annabell:update {
    password = password,
    is_admin = 1,
  }
end
