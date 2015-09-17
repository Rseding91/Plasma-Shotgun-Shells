require("prototypes.entities")
require("prototypes.items")
require("prototypes.recipes")
require("prototypes.projectiles")
require("prototypes.research")


local player = data.raw.player.player
if player.resistances == nil then
  player.resistances = {}
end
table.insert(player.resistances,  {type="electric", percent=100})
