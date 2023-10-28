local config = require "lapis.config"

config({ "development", "production" }, {
  server = "nginx",
  sqlite = {
    database = "database/db.sqlite",
  },
  session_name = "baby.strobel-suess.de",
  bcrypt_rounds = 10,
  code_cache = "off",
  num_workers = "1",
  deamon = "off",
})

config("production", {
  -- code_cache = "off",
  -- deamon = "off",
  num_workers = "5",
})

config({ "development", "production" }, require "secret")
