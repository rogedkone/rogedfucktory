
require("defines")
local Event = require('__stdlib__/stdlib/event/event')


function findUnitWeight(spawnPoints,evolutionCurrent)
	-- spawn points docs https://wiki.factorio.com/Types/SpawnPoint
	
	--log("evo, spawnpoints and returned weight")
	--log(serpent.block(evolutionCurrent))	
	--log(serpent.block(spawnPoints))
	
	local evolutionLow = -10
	local evolutionHigh = 10
	local weightLow
	local weightHigh
	local weight
	
	-- find the points immedatly above and below the current evolution
	for _, point in pairs(spawnPoints) do 
		local evo = point[1] or point["evolution_factor"]
		
		-- check if this is the exact right point
		if evo == evolutionCurrent then 
		
			--log(serpent.block(point))
			weight = point[2] or point["weight"]
		end
		
		-- if the evo of this point is between the current evolution and the current lower bound then it is the new lower bound
		if evolutionLow <= evo and 
		   evo <= evolutionCurrent then
		   
		    weightLow = point[2] or point["weight"]
			evolutionLow = evo
		end
		
		-- same for the upper bound
		if evolutionHigh >= evo and 
		   evo >= evolutionCurrent then
		   
		    weightHigh = point[2] or point["weight"]
			evolutionHigh = evo
		end
	end
	

	-- if weight was not found find it now
	if not weight then
		
		-- check to make sure lower and upper bounds both exist
		-- if we are on the edge use the close edge
		weightLow = weightLow or weightHigh or 0
		weightHigh = weightHigh or weightLow
		
		--interpolate between the 2 points 
		-- formula is y = y1 + (x-x1) * (y2-y1)/(x2-x1)	
		weight = weightLow + (evolutionCurrent - evolutionLow)* (weightHigh - weightLow)/(evolutionHigh - evolutionLow)
	end
	--log(weight)
	return weight
end


function findSpawnerWeights(spawner,evolution)

	--log(evolution)
		
	local resultTable = game.entity_prototypes[spawner].result_units
	-- note, result table is a table of https://wiki.factorio.com/Types/UnitSpawnDefinition
	
	--local weights = {{"small-biter",0.9},{"small-spitter",0.05},{"medium-biter",0.05}}
	
	local weights = {}
	
	for index, unitSpawnPoints in pairs(resultTable) do 
	
		unit = unitSpawnPoints[1] or unitSpawnPoints["unit"]
		spawnPoints = unitSpawnPoints[2] or unitSpawnPoints["spawn_points"]
		
		--log(serpent.block(unitSpawnPoints))
		
		weight = findUnitWeight(spawnPoints,evolution)
		
		table.insert(weights,{unit,weight})
		
	end
	
	--log(serpent.block(weights))
	
	
	-- dont return nothing, log it if you need to use the failsafe
	if not weights then 
		log("weights table empty, inserting small-biter into table")
		weights = {{"small-biter",1}}
	end
	
	return weights
end


function choseRandomlyFromList(weights)
	-- weights is a table of unit,weight pairs 
	
	local sum = 0
	local name
	
	for _, weight in ipairs(weights) do
		sum = sum + weight[2]
	end
	
	--log(sum)
	
	local choice = math.random()*sum
	
	--log(choice)
	
	for _, weight in ipairs(weights) do
		choice = choice - weight[2]
		if choice < 0 then 
			name = weight[1]
			break
		end
	end
	
	--make sure it returns something
	if not name then 
		name = "small-biter"
		log("random choice of entity failed, returning small-biter instead")
	end
	
	return name
end


function spawnBiter(surface,position,num)

	local surfaceReference = game.surfaces[surface]
	local force = game.forces.enemy
	local biterSpawnerChance = settings.global["i-speak-for-the-trees-v2-biter-spawner-chance"].value
	
	local maxEvo = settings.global["i-speak-for-the-trees-v2-max-evolution"].value
	local evolution = game.forces["enemy"].evolution_factor 

	
	evolution = math.min(evolution,maxEvo)
	
	for i = 1,num do 
		
		-- 60% chance of biter
		local spawner = "spitter-spawner"
		if math.random() < biterSpawnerChance then spawner = "biter-spawner" end
	
		-- get and use the wieghts for the chosen spawner
		local weights = findSpawnerWeights(spawner,evolution)
		
		local unit = choseRandomlyFromList(weights)
		
		surfaceReference.create_entity{name = unit, position = position, force = force}
	end
end

 
function onSomethingMined(event,destroyed)
	-- called anytime an event needs to spawn a biter
	
	local entityType = event.entity.type
	local name = event.entity.name
	local position = event.entity.position
	local surface = event.entity.surface.name
	
	log(entityType)

	
	--ghosts break things
	if entityType == "entity-ghost" or entityType == "tile-ghost" then
	-- do nothing
	
	-- trees
	elseif entityType == "tree" then
	
		if math.random()*100 < settings.global["i-speak-for-the-trees-v2-tree-dies-spawn-chance"].value then
		
			spawnBiter(surface,position,settings.global["i-speak-for-the-trees-v2-tree-dies-spawn-number"].value)
		end
	
	-- count_as_rock_for_filtered_deconstruction is the only properity i could find to tell rocks from other simple-entities
	-- the term '== true' is not nessarey but is better for readibility
	elseif game.entity_prototypes[name].count_as_rock_for_filtered_deconstruction == true then
	
		if math.random()*100 < settings.global["i-speak-for-the-trees-v2-rock-dies-spawn-chance"].value then
		
			spawnBiter(surface,position,settings.global["i-speak-for-the-trees-v2-rock-dies-spawn-number"].value)
		end	
		
	-- spawners
	elseif entityType == "unit-spawner" then
	
		if math.random()*100 < settings.global["i-speak-for-the-trees-v2-spawner-dies-spawn-chance"].value then
		
			spawnBiter(surface,position,settings.global["i-speak-for-the-trees-v2-spawner-dies-spawn-number"].value)
		end	
		
	-- apocalypse  
	elseif (game.entity_prototypes[name].flags["player-creation"]) and 
			not (entityType == "wall") and not (entityType == "gate")  and 
			(destroyed or settings.global["i-speak-for-the-trees-v2-apocalypse-include-mining"].value) then
	
	
		if math.random()*100 < settings.global["i-speak-for-the-trees-v2-apocalypse-dies-spawn-chance"].value then
		
			spawnBiter(surface,position,settings.global["i-speak-for-the-trees-v2-apocalypse-dies-spawn-number"].value)
		end	
		
	end
end

function onSomethingDestroyed(event) do onSomethingMined(event,true) end end

Event.register(defines.events.on_entity_died, onSomethingDestroyed)
Event.register(defines.events.on_player_mined_entity, onSomethingMined)
Event.register(defines.events.on_robot_mined_entity, onSomethingMined)

--log(serpent.block(game.forces))
