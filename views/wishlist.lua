---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget

local Item = require "models.Item"

local items = Item:select "where buyer is null"

return Widget:extend(function()
  if #items == 0 then
    h2 "🎉 Im Moment haben wir schon alles. 🎉"
  else
    h2 "Was sich unser Baby für seine/ihre Geburt noch wünscht:"

    div({ class = "wishlist" }, function()
      for _, item in ipairs(items) do
        widget(item:html())
      end
    end)

    p "Falls Ihr uns etwas von dieser Liste schenken möchtet, dann schreibt uns doch bitte an."
  end
end)
