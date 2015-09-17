
local plasmaShell = util.table.deepcopy(data.raw.ammo["piercing-shotgun-shell"])
plasmaShell.icon = "__Plasma Shotgun Shells__/graphics/plasma-shotgun-shell.png"
plasmaShell.name = "plasma-shotgun-shells"
plasmaShell.order = "b[shotgun]-p[plasma]"
plasmaShell.magazine_size = 4
plasmaShell.ammo_type =
{
  category = "shotgun-shell",
  target_type = "direction",
  source_effects =
  {
    type = "create-explosion",
    entity_name = "explosion-gunshot"
  },
  action =
  {
    type = "direct",
    repeat_count = 3,
    action_delivery =
    {
      {
        type = "instant",
        target_effects =
        {
          type = "create-entity",
          entity_name = "plasma-pellet-spawn",
          trigger_created_entity = true
        }
      },
      {
        type = "projectile",
        projectile = "plasma-pellet",
        starting_speed = 0.65,
        direction_deviation = 0.3,
        range_deviation = 0.3,
        max_range = 45
      }
    }
  }
}
data:extend({plasmaShell})