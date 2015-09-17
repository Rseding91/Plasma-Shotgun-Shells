data:extend(
{
  {
    type = "container",
    name = "plasma-pellet-spawn",
    icon = "__Plasma Shotgun Shells__/graphics/null.png",
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    max_health = 9001,
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    inventory_size = 0,
    picture =
    {
      filename = "__Plasma Shotgun Shells__/graphics/null.png",
      priority = "extra-high",
      width = 32,
      height = 32,
      shift = {0, 0}
    },
    order = "p[plasma]-p[pellet]"
  }
})

local plasmaBeam = util.table.deepcopy(data.raw.beam["electric-beam"])
plasmaBeam.name = "plasma-beam"
plasmaBeam.damage_interval = 1
data:extend({plasmaBeam})

local plasmaCloud = util.table.deepcopy(data.raw["smoke-with-trigger"]["poison-cloud"])
plasmaCloud.name = "plasma-cloud"
plasmaCloud.order = "p[plasma]-c[cloud]"
plasmaCloud.action =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    target_effects =
    {
      type = "nested-result",
      action =
      {
        type = "area",
        perimeter = 10,
        action_delivery =
        {
          type = "beam",
          beam = "plasma-beam",
          max_length = 14,
          duration = 1,
          source_offset = {0, 0}
        }
      }
    }
  }
}
plasmaCloud.color = {r=0, g=0, b=0, a=0}
plasmaCloud.action_frequency = 1
data:extend({plasmaCloud})

