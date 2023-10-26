local config = require "lapis.config"

config({ "development", "production" }, {
  server = "nginx",
  sqlite = {
    database = "database/db.sqlite",
  },
  session_name = "baby.strobel-suess.de",
})

config("development", {
  code_cache = "off",
  num_workers = "1",
  deamon = "off",
})

config("production", {
  code_cache = "on",
  num_workers = "5",
  deamon = "on",
})

config({ "development", "production" }, require "secret")
