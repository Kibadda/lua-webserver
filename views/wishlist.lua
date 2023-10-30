---@diagnostic disable:undefined-global
local Widget = require("lapis.html").Widget

local Item = require "models.Item"

local items = Item:select()

return Widget:extend(function(self)
  if self.session.user and self.session.user.is_admin then
    widget(Item:form())
  end

  if #items == 0 then
    h2 "🎉 Im Moment haben wir schon alles. 🎉"
  else
    h2 "Was sich unser Baby zur Geburt noch wünscht:"

    p "Falls Ihr uns etwas von dieser Liste schenken möchtet, dann schreibt uns doch bitte an."

    div({ class = "wishlist" }, function()
      for _, item in ipairs(items) do
        widget(item:html())
      end
    end)
  end
end)
