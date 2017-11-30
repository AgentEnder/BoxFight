knight = {}
knight.jumpHeight = 4.2
knight.speed = 130
knight.maxhealth = 15
knight.width = 16
knight.health = 15
knight.dmg = 1.2
knight.defense = .5
knight.scale = 1
knight.class = knight
knight.classStr = " knight"
--Sprites
knight.r11 = love.graphics.newImage("/resources/players/knight/1r_fr1.png")
knight.r12 = love.graphics.newImage("/resources/players/knight/1r_fr2.png")
knight.l11 = love.graphics.newImage("/resources/players/knight/1l_fr1.png")
knight.l12 = love.graphics.newImage("/resources/players/knight/1l_fr2.png")
knight.r21 = love.graphics.newImage("/resources/players/knight/2r_fr1.png")
knight.r22 = love.graphics.newImage("/resources/players/knight/2r_fr2.png")
knight.l21 = love.graphics.newImage("/resources/players/knight/2l_fr1.png")
knight.l22 = love.graphics.newImage("/resources/players/knight/2l_fr2.png")
function knight.respawn(player)
	player.health = knight.maxhealth
end
--Abilities
knight.abilities = {}
knight.abilities[1] = function (player, key)
	if key then
		if player.ultraRegenCount == 0 then
			player.ultraRegen = true
		else 
		end
	end
	return (20)
end

knight.abilities[2] = function (player, key)
	if key then
		if player.defenseUpCount == 0 then
			player.defenseUp = true
		else 
		end
	end
	return (20)
end
--Update

function knight.update(player, dt)
	--regen
	if player.health < player.maxhealth then
		player.health = player.health + 0.8*dt
	end
end