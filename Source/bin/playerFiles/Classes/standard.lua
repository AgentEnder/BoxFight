standardClass = {}
standardClass.jumpHeight = 5
standardClass.speed = 100
standardClass.maxhealth = 10
standardClass.width = 16
standardClass.health = 10
standardClass.dmg = 1
standardClass.scale = 1
standardClass.defense = 0
standardClass.class = standardClass
standardClass.classStr = " Standard"
--Sprites
standardClass.r11 = love.graphics.newImage("/resources/players/1r_fr1.png")
standardClass.r12 = love.graphics.newImage("/resources/players/1r_fr2.png")
standardClass.l11 = love.graphics.newImage("/resources/players/1l_fr1.png")
standardClass.l12 = love.graphics.newImage("/resources/players/1l_fr2.png")
standardClass.r21 = love.graphics.newImage("/resources/players/2r_fr1.png")
standardClass.r22 = love.graphics.newImage("/resources/players/2r_fr2.png")
standardClass.l21 = love.graphics.newImage("/resources/players/2l_fr1.png")
standardClass.l22 = love.graphics.newImage("/resources/players/2l_fr2.png")
function standardClass.respawn(player)
	player.health = standardClass.maxhealth
end
--Abilities
standardClass.abilities = {}
standardClass.abilities[1] = function (player, key)
	if key then
		if player.ultraRegenCount == 0 then
			player.ultraRegenCount = 0
			player.ultraRegen = true
		else 
			--print(player.ultraRegenCount)
		end
	end
	return (player.ultraRegenCount)
end

standardClass.abilities[2] = function (player, key)
	if key then
		if player.defenseUpCount == 0 then
			player.defenseUpCount = 0
			player.defenseUp = true
		else 
			--print(player.ultraRegenCount)
		end
	end
	return (player.defenseUpCount)
end
--Update

function standardClass.update(player, dt)
	--Ultra Regen
	if player.ultraRegenCount == nil then player.ultraRegenCount = 0 end
	if player.ultraRegenTimer == nil then player.ultraRegenTimer = 0 end
	if player.ultraRegeneration == nil then player.ultraRegeneration = false end
	if player.ultraRegen == true then
		if player.ultraRegenTimer <= 0 then
			player.ultraRegenTimer = 3
		else
			player.ultraRegenTimer = player.ultraRegenTimer - dt
			player.ultraRegenCount = player.ultraRegenCount + .5*dt
		end
	end
	if player.ultraRegenCount >= 3 then
		player.ultraRegeneration = false 
	elseif player.ultraRegen == true then
		player.ultraRegeneration = true
	end
	if player.ultraRegenCount >= 20 then
		player.ultraRegenCount = 0 
		player.ultraRegen = false
	end
	--Defense Up
	if player.defenseUpCount == nil then player.defenseUpCount = 0 end
	if player.defenseUpTimer == nil then player.defenseUpTimer = 0 end
	if player.defenseUperation == nil then player.defenseUperation = false end
	if player.defenseUp == true then
		if player.defenseUpTimer <= 0 then
			player.defenseUpTimer = 3
		else
			player.defenseUpTimer = player.defenseUpTimer - dt
			player.defenseUpCount = player.defenseUpCount + .5*dt
		end
	end
	if player.defenseUpCount >= 3 then
		player.defenseUped = false 
	elseif player.defenseUp == true then
		player.defenseUped = true
	end
	if player.defenseUpCount >= 20 then
		player.defenseUpCount = 0 
		player.defenseUp = false
	end
	
	--Regen
	if player.health < player.maxhealth then 
		if player.ultraRegeneration == false or player.ultraRegeneration == nil then
			player.health = player.health + .05*dt
		elseif player.ultraRegeneration == true then
			player.health = player.health + dt
		end
	end
	--defense
	if player.defenseUped == true then
		player.defense = 1
	else 
		player.defense = 0
	end
end