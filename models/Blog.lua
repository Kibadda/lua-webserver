---@diagnostic disable:undefined-global
local Model = require("lapis.db.model").Model
local Widget = require("lapis.html").Widget
local utils = require "utils"

local Blog, Blog_mt = Model:extend("blogs", {
  timestamp = true,
})

function Blog_mt:card()
  local blog = self
  return Widget:extend(function()
    article({ class = "blog" }, function()
      div({ class = "picture" }, function()
        img { src = "/static/images/" .. (blog.picture or "placeholder.png"), alt = "Blog Post " .. blog.id }
      end)

      div({ class = "text" }, function()
        h1(blog.title)
        p(blog.description)
      end)

      small(utils.format_date(blog.created_at))
    end)
  end)
end

return Blog
