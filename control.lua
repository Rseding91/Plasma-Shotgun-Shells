require "defines"

local loaded = false
local PelletName = "plasma-pellet"
local CloudName = "plasma-cloud"
local PelletSearchRadius = 2
local BeamRadius = 10 + 5
local knownNames = {
  ["plasma-pellet-spawn"] = true
}

function ticker(event)
  if not processPellets(global.pellets) then
    global.ticking = nil
    game.on_event(defines.events.on_tick, nil)
  end
end

function init()
  if not loaded then
    loaded = true
    
    if global.pellets == nil then
      global.pellets = {}
    end
    
    if global.ticking ~= nil then
      game.on_event(defines.events.on_tick, ticker)
    end
  end
end

game.on_init(init)
game.on_load(init)


game.on_event(defines.events.on_trigger_created_entity, function(event)
  if knownNames[event.entity.name] then
    for _,player in pairs(event.entity.force.players) do
      setupPelletsFromPelletSpawn(event.entity, player.position)
    end
    if event.entity.valid then
      event.entity.destroy()
    end
  end
end)

function setupPelletsFromPelletSpawn(entity, position)
  local entities = entity.surface.find_entities_filtered({name=PelletName, area={{position.x - PelletSearchRadius, position.y - PelletSearchRadius}, {position.x + PelletSearchRadius, position.y + PelletSearchRadius}}})
  
  for k,v in pairs(entities) do
    if not isTrackingPellet(v) then
      
      local newPellet = {}
      newPellet.pellet = v
      newPellet.surface = v.surface
      newPellet.force = entity.force
      newPellet.sourcePosition = v.position
      table.insert(global.pellets, newPellet)
      
      if global.ticking == nil then
        global.ticking = true
        game.on_event(defines.events.on_tick, ticker)
      end
    end
  end
end

function isTrackingPellet(pellet)
  for k,v in pairs(global.pellets) do
    if v.pellet == pellet then return true end
  end
  return false
end

function processPellets(pellets)

  local abs = math.abs
  local floor = math.floor
  local sqrt = math.sqrt

  for k,v in pairs(pellets) do
    if v.pellet.valid then
    
      local pos = v.pellet.position
      if v.cloud == nil then
        local distX = abs(pos.x - v.sourcePosition.x)
			  local distY = abs(pos.y - v.sourcePosition.y)
        if floor(sqrt((distX * distX) + (distY * distY))) > BeamRadius then
          v.cloud = v.surface.create_entity({name=CloudName, force=v.force, position=pos})
        end
      else
        if v.cloud.valid then
          v.cloud.teleport(pos)
        end
      end
    else
      
      if v.cloud and v.cloud.valid then
        v.cloud.destroy()
      end
      table.remove(pellets, k)
      
    end
  end
  
  return #pellets ~= 0
end















