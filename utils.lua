local M = {}

function M.split(str, pattern)
  pattern = pattern or "%s"

  local t = {}
  for token in string.gmatch(str, "[^" .. pattern .. "]+") do
    t[#t + 1] = token
  end

  return t
end

---@param datetime string
function M.format_date(datetime)
  local split = M.split(datetime)

  local date = M.split(split[1], "-")

  return date[3] .. "." .. date[2] .. "." .. date[1] .. " " .. split[2]
end

return M
