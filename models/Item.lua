---@diagnostic disable:undefined-global
local Model = require("lapis.db.model").Model
local Widget = require("lapis.html").Widget

local Item, Item_mt = Model:extend("items", {
  timestamp = true,
})

function Item.form()
  return Widget:extend(function(self)
    form({ class = "item-create", method = "POST", action = self:url_for "wishlist.create" }, function()
      input { type = "hidden", name = "csrf_token", value = self.csrf_token }
      input { type = "text", name = "name", placeholder = "Name" }
      input { type = "url", name = "url", placeholder = "Link" }
      button({ type = "submit" }, "Speichern")
    end)
  end)
end

function Item_mt:html()
  local item = self
  return Widget:extend(function(context)
    div({ class = { "item", done = item.buyer } }, function()
      div({ class = "name" }, function()
        if item.buyer then
          del(item.name)
        else
          text(item.name)
        end
      end)

      if item.url then
        a({ class = "url", href = item.url, target = "_blank" }, "Link")
      end

      if not item.buyer and context.session.user and context.session.user.is_admin then
        form({ method = "POST", action = context:url_for("wishlist.edit", { id = item.id }) }, function()
          input { type = "hidden", name = "csrf_token", value = context.csrf_token }
          input { type = "text", name = "buyer" }
          button({ type = "submit" }, "Erledigt")
        end)
      end
    end)
  end)
end

return Item
