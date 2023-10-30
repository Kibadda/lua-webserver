local cached = require("lapis.cache").cached

return function(app)
  app:get(
    "wishlist",
    "/",
    cached {
      when = function(self)
        return not self.session.user
      end,
      function(self)
        self.title = "Wunschliste"

        return { render = true }
      end,
    }
  )

  app:get("blog", "/blog", function(self)
    self.title = "Blog"

    return { render = true }
  end)
end
