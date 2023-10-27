---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget

local Blog = require "models.Blog"

local blogs = Blog:select "order by created_at desc"

return Widget:extend(function()
  for _, blog in ipairs(blogs) do
    widget(blog:html())
  end
end)
