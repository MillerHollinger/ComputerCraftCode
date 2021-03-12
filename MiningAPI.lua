--[[ TODO
An API with many helpful functions for mining turtles.
Calls the function on the local turtle.
@author Miller Hollinger
v0.1
]]

os.loadAPI() -- TODO Give correct file path

local t = turtle;

--[[
Mines a rectangular prism with given dimensions.
  length, int: How far from the turtle's face to dig.
  width, int: How far from the turtle's right side to dig. This will be used
    as the 'length' variable in mineStrip.
  [height=2], int <= 3: How tall to make the strip.
  [smart=false], bool: If the turtle should respect smart mining rules.
]]
function minePrism(length, width, height, smart)
  -- Validate arguments.
  ArgVerifierAPI.verifyArgs({length, width, height, smart},
    {nil, nil, 2, false})

  -- TODO Create a function arg verifier API to cut down code like the above.
  -- ALso, find out how to get a file's relative path.

  for i=1, length, 1 do
    mineStripHeight(width, height)
    -- TODO Implement smart.
  end
end

--[[
Mines a strip of the given height straight forward.
  length, int: How far to dig in a strip.
  height, int <= 3: How high to dig.
]]
function mineStripHeight(length, height)
  if height == 1 then
    mineStrip(length, false, false)
  elseif height == 2 then
    mineStrip(length, true, false)
  elseif height == 3 then
    mineStrip(length, true, true)
  else
    error("Provided height " .. height .. " invalid (must be <= 3, >= 1)")
  end
end

--[[
Mines a strip of the given length straight forward, including the
place the turtle starts at (length = 1 means no movement).
  length, int: How far to dig in a strip.
  up, bool: If the block above should be broken each space.
  down, bool: If the block below should be broken each space.
]]
function mineStrip(length, up, down)
  for i=1, length, 1 do
    if up then
      t.digUp()
    end
    if down then
      t.digDown()
    end

    if (i + 1) < length then
      t.dig()
      t.forward()
    end
  end
end
