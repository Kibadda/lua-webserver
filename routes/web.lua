local cached = require("lapis.cache").cached
local config = require("lapis.config").get()

return function(app)
  app:get(
    "wishlist",
    "/",
    cached {
      when = function(self)
        return not self.session.user and config.cache
      end,
      function(self)
        self.title = "Wunschliste"

        return { render = true }
      end,
    }
  )

  app:get(
    "calendar",
    "/kalender",
    cached {
      when = function(self)
        return not self.session.user and config.cache
      end,
      function(self)
        self.title = "Kalender"

        return { render = true }
      end,
    }
  )

  app:post(
    "calendar",
    "/kalender",
    cached {
      when = function(self)
        return not self.session.user.is_admin and config.cache
      end,
      function()
        local Guess = require "models.Guess"

        local guesses = Guess:select()

        local json = {}

        for _, guess in ipairs(guesses) do
          json[#json + 1] = {
            title = guess.name,
            start = guess.date,
            color = guess.gender == "Mädchen" and "pink" or "lightblue",
            textColor = "black",
          }
        end

        return { json = json }
      end,
    }
  )

  -- app:get(
  --   "blog",
  --   "/blog",
  --   cached {
  --     when = function(self)
  --       return not self.session.user.is_admin and config.cache
  --     end,
  --     function(self)
  --       self.title = "Blog"

  --       return { render = true }
  --     end,
  --   }
  -- )
end
