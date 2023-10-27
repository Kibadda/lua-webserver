---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget

local Item = require "models.Item"

local items = Item:select()

return Widget:extend(function()
  h2 "Was sich unser Baby für seine/ihre Geburt noch wünscht:"

  div({ class = "wishlist" }, function()
    if #items == 0 then
      div({ class = "item" }, function()
        div({ class = "name" }, "Wir haben schon alles...")
        div({ class = "url" }, "Aber wir bedanken uns trotzdem :D")
      end)
    else
      for _, item in ipairs(Item:select()) do
        div({ class = "item" }, function()
          div({ class = "name" }, item.name)
          if item.url then
            a({ class = "url", href = item.url, target = "_blank" }, item.url)
          end
        end)
      end
    end
  end)

  p "Falls Ihr uns etwas von dieser Liste schenken möchtet, dann schreibt uns doch bitte an."
end)
