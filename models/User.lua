local Model = require("lapis.db.model").Model

local User = Model:extend "users"

function User:verify(params)
  local user = User:find {
    name = params.name,
  }

  if not user then
    return nil
  end

  -- TODO: better check
  if params.password ~= user.password then
    return nil
  end

  return user
end

return User
