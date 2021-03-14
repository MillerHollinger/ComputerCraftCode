--[[
A silly adventure game.
@author Miller Hollinger
v0.1
]]

--[[
Planning
The player moves through a giant random world.
The world is made of tiles in a grid.
Each tile has:
- Resource
  - Wood, Stone, Iron
  - Up to 10 of a resource can be 'in waiting' at any time.
  - Each day, all tiles replenish 1 resource.
- Characters
  - The player and enemies.
- Structure
  - Each tile can have one structure built on it.
    - Storehouse: Increases your storage by 20. (default 100)
    - Road: Time doesn't pass when you enter this tile.
    -
]]
