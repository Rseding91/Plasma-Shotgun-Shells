data:extend({
  {
    type = "technology",
    name = "plasma-shotgun-shells",
    icon = "__Plasma Shotgun Shells__/graphics/plasma-shotgun-shell.png",
    prerequisites = {"shotgun-shell-damage-6"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "plasma-shotgun-shells"
      }
    },
    unit =
    {
      count = 700,
      ingredients =
      {
        {"science-pack-1", 1},
        {"science-pack-2", 1},
        {"science-pack-3", 1},
        {"alien-science-pack", 1}
      },
      time = 25,
      
    },
    order = "p[plasma]-s[shotgun]"
  }
})