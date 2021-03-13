--[[ TODO
An API with many helpful functions for mining turtles.
Calls the function on the local turtle.
@author Miller Hollinger
v0.3
]]

-- APIS to load:
-- TurtleHelpersAPI
-- ArgVerifierAPI


local t = turtle;

--[[
Mines a rectangular prism with given dimensions.
  length, int: How far from the turtle's face to dig.
  width, int: How far from the turtle's right side to dig. This will be used
    as the 'length' variable in mineStrip.
  [height=2], int <= 3: How tall to make the strip.
  [smart=false], bool: If the turtle should smart mine.
    Smart mining is:
      - The turtle automatically refuels
      - If it can't refuel, it returns to where it started
]]
local distance = 0
function minePrism(length, width, height, smart)
  -- Validate arguments.
  ArgVerifierAPI.verifyArgs({length, width, height, smart},
    {nil, nil, 2, false})

  turtle.turnRight()

  -- TODO Find out how to get a file's relative path.


  for i=1, length, 1 do
    mineStripHeight(width, height)

    if i % 2 == 1 then
      turtle.turnLeft()
      sureBreakHeight(height)
      turtle.turnLeft()
      sureBreakHeight(height)
    else
      turtle.turnRight()
      sureBreakHeight(height)
      turtle.turnRight()
      sureBreakHeight(height)
    end

    -- Smart mining.
    if smart and i % 2 == 0 then
      local fuelLow = TurtleHelpersAPI.smartRefuel()
      local hasSpace = TurtleHelpersAPI.hasInventorySpace()
      if fuelLow or not hasSpace then
        if fuelLow then
          print("! - fuel is low.")
        end
        if not hasSpace then
          print("! - inventory full.")
        end
        print("! - returning home, distance= " .. distance)
        TurtleHelpersAPI.moveRepeating(distance)
        print("done - turtle returned.")
        return
      end
    end

    distance = distance + 1

    if distance % 5 == 0 then
      print("ok - rows complete= " .. distance)
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
    error("provided height " .. height .. " invalid (must be <= 3, >= 1)")
  end
end

--[[
Mines a strip of the given length straight forward, including the
place the turtle starts at (length = 1 means no movement).
Repeatedly breaks the targeted blocks until there is nothing there to
prevent getting stuck on gravel or sand.
  length, int: How far to dig in a strip.
  up, bool: If the block above should be broken each space.
  down, bool: If the block below should be broken each space.
]]
function mineStrip(length, up, down)
  for i=1, length, 1 do
    if up then
      sureBreak("up")
    end

    if down then
      sureBreak("down")
    end

    if (i + 1) < length then
      sureBreak("forward")
      t.forward()
    end
  end
end

--[[
Surely breaks blocks of the selected height.
  height, int <= 3: The height to break.
]]
function sureBreakHeight(height)
  if height >= 1 then
    sureBreak("forward")
  end
  if height >= 2 then
    sureBreak("up")
  end
  if height == 3 then
    sureBreak("down")
  end
end

--[[
Surely breaks the selected block, that is, breaks until
there is nothing but air there.
  direction, string={"forward", "up", "down"}: The direction to break in.
]]
function sureBreak(direction)
  if direction == "forward" then
    while turtle.inspect() do
      t.dig()
    end
  elseif direction == "up" then
    while turtle.inspectUp() do
      t.digUp()
    end
  elseif direction == "down" then
    while turtle.inspectDown() do
      t.digDown()
    end
  else
    error("invalid direction: " .. direction)
  end
end
