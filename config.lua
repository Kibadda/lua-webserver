local config = require "lapis.config"

config("development", {
  server = "nginx",
  code_cache = "off",
  num_workers = "1",
  sqlite = {
    database = "database/db.sqlite",
  },
  session_name = "wishlist_session",
})

config("development", require "secret")
