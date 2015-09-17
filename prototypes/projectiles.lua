
local electricPellet = util.table.deepcopy(data.raw.projectile["piercing-shotgun-pellet"])
electricPellet.name = "plasma-pellet"
electricPellet.collision_box = {{0, 0}, {0, 0}}
electricPellet.action = nil
electricPellet.animation.filename = "__Plasma Shotgun Shells__/graphics/plasma-pellet.png"
data:extend({electricPellet})
