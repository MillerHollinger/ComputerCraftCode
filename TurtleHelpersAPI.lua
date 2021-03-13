--[[
An API with general helpers for turtles.
@author Miller Hollinger
v0.1
]]

--[[
Returns if the turtle has any empty slots.
]]
function hasInventorySpace()
  for i=1, 16, 1 do
    if turtle.getItemCount(i) == 0 then
      return true;
    end
  end
  return false;
end

--[[
Returns if the turtle 'needs a refuel' or if refueling can cease.
Arbitrarily, that means less than an amount of fuel.
]]
local MIN_FUEL = 200
local MAX_FUEL = 2000
local FUEL_PER_COAL = 80
function needsRefuel()
  return turtle.getFuelLevel() < MIN_FUEL
end
function needsMoreFuel()
  return turtle.getFuelLevel() > MAX_FUEL
end
--[[
Returns how much coal is needed to refuel the robot to good levels.
]]
function coalNeeded()
  return math.floor((MAX_FUEL - turtle.getFuelLevel()) / FUEL_PER_COAL)
end

--[[
Refuels the turtle to the given level or until there is no more coal.
Returns if it still needs a refuel.
]]
function smartRefuel()
  for i=1, 16, 1 do
    if needsMoreFuel() and turtle.getItemDetail(i).name == "Coal" then
      turtle.select(i)
      turtle.refuel(coalNeeded())
    end
  end

  return needsRefuel()
end

--[[
Moves the turtle the given distance in a straight line.
  distance, int: How far to move.
]]
function moveRepeating(distance)
  for i=1, distance, 1 do
    turtle.forward()
  end
end
