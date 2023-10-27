local Model = require("lapis.db.model").Model

local User = Model:extend("users", {
  timestamp = true,
})

function User:verify(params)
  local user = User:find {
    name = params.name,
  }

  if not user or not require("bcrypt").verify(params.password, user.password) then
    return nil, "wrong name or password"
  end

  return user
end

return User
