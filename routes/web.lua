return function(app)
  app:get("wishlist", "/", function(self)
    self.title = "Wunschliste"

    return { render = true }
  end)

  app:get("blog", "/blog", function(self)
    self.title = "Blog"

    return { render = true }
  end)
end
