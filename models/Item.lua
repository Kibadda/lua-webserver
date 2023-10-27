---@diagnostic disable:undefined-global
local Model = require("lapis.db.model").Model
local Widget = require("lapis.html").Widget

local Item, Item_mt = Model:extend("items", {
  timestamp = true,
})

function Item_mt:html()
  local item = self
  return Widget:extend(function()
    div({ class = "item" }, function()
      div({ class = "name" }, item.name)
      if item.url then
        a({ class = "url", href = item.url, target = "_blank" }, item.url)
      end
    end)
  end)
end

return Item
