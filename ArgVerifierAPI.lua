--[[
A fast and convenent way to set required and default args.
@author Miller Hollinger
v0.1
]]

--[[
Verifies the given arguments and returns the resulting arguments.
  actual: A list of arguments that were passed to the function.
  match: A list of 'requirement form' arguments.
    any non-nil value provides a default.
    nil means the matching argument in actual has no default and will error
      if the actual is nil, i.e. it is a required argument.
]]
function verifyArgs(actual, match)
  local out = {}

  for i, v in ipairs(actual) do
    if match[i] ~= nil then -- Default value.
      if actual[i] == nil then -- Use default.
        table.insert(match[i])
      else -- Use actual.
        table.insert(actual[i])
      end
    else -- No default.
      if actual[i] == nil then -- Error.
        error("Invalid argument in position " .. i)
      else -- Use actual.
        table.insert(actual[i])
      end
    end
  end
end
