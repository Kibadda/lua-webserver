local config = require "lapis.config"

config({ "development", "production" }, {
  server = "nginx",
  cache = false,
  sqlite = {
    database = "database/db.sqlite",
  },
  session_name = "baby.strobel-süß.de",
  bcrypt_rounds = 10,
  num_workers = "1",
  port = "80",
  nginx_ssl = "",
  nginx_ssl_certificates = "",
})

config("production", {
  cache = true,
  num_workers = "5",
  port = "443 ssl",
  nginx_ssl = [[
  server {
    listen 80;
    server_name _;
    return 301 https://$host$request_uri;
  }
  ]],
  nginx_ssl_certificates = [[
  ssl_certificate /home/lua-webserver/certificates/fullchain.pem;
  ssl_certificate_key /home/lua-webserver/certificates/privkey.pem;
  ]],
})

config({ "development", "production" }, require "secret")
