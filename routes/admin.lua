local capture_errors = require("lapis.application").capture_errors
local assert_error = require("lapis.application").assert_error
local cache = require("lapis.cache")

return function(app)
  app:post(
    "wishlist.create",
    "/wunschliste",
    capture_errors(function(self)
      require("lapis.csrf").assert_token(self)

      local Item = require "models.Item"

      Item:create {
        name = self.params.name,
        url = self.params.url,
      }

      cache.delete_path "/"

      return { redirect_to = self:url_for "wishlist" }
    end)
  )

  app:post(
    "wishlist.edit",
    "/wunschliste/:id",
    capture_errors(function(self)
      require("lapis.csrf").assert_token(self)

      local Item = require "models.Item"

      local item = assert_error(Item:find(self.params.id))

      item:update { buyer = self.params.buyer or "" }

      cache.delete_path "/"

      return { redirect_to = self:url_for "wishlist" }
    end)
  )
end
