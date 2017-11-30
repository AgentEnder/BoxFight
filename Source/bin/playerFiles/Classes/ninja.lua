ninja = {}
ninja.jumpHeight = 5.5
ninja.speed = 105
ninja.health = 8
ninja.maxhealth = 8
ninja.width = 16
ninja.dmg = 1.5
ninja.defense = 0.2
ninja.class = ninja
ninja.classStr = " Ninja"
ninja.scale = 1
ninja.r11 = love.graphics.newImage("/resources/players/ninja/1r_fr1.png")
ninja.r12 = love.graphics.newImage("/resources/players/ninja/1r_fr2.png")
ninja.l11 = love.graphics.newImage("/resources/players/ninja/1l_fr1.png")
ninja.l12 = love.graphics.newImage("/resources/players/ninja/1l_fr2.png")
ninja.r21 = love.graphics.newImage("/resources/players/ninja/2r_fr1.png")
ninja.r22 = love.graphics.newImage("/resources/players/ninja/2r_fr2.png")
ninja.l21 = love.graphics.newImage("/resources/players/ninja/2l_fr1.png")
ninja.l22 = love.graphics.newImage("/resources/players/ninja/2l_fr2.png")
--respawn
function ninja.respawn(player)
	player.health = ninja.maxhealth
end
--class abilities
ninja.abilities ={}
ninja.abilities[1] = function (player, key)
	if key then
		if player.invisibleCount == 0 or player.invisibleCount == nil then
			player.invisibleCount = 0
			player.invisible = true
		else
			--print(player.invisibleCount)
		end
	end
	return (player.invisibleCount)
end
ninja.abilities[2] = function (player, key)
	if key then
		if player.rushCount == 0 then
			player.rushCount = 0
			player.rush = true
		else 
			--print(player.rushCount)
		end
	end
	return (player.rushCount)
end

--Update

function ninja.update(player, dt)
	if player.rushCount == nil then player.rushCount = 0 end
	if player.rushTimer == nil then player.rushTimer = 0 end
	if player.isInvisible == nil then player.isInvisible = false end
	if player.invisibleCount == nil then player.invisibleCount = 0 end
	if player.invisibleTimer == nil then player.invisibleTimer = 0 end
	if player.health < player.maxhealth then 
		player.health = player.health + .1*dt
	end
	--Rush
	if player.rush == true then
		if player.rushTimer <= 0 then
			player.rushTimer = 3
		else
			
			player.rushTimer = player.rushTimer - dt
			player.speed = 300
			player.rushCount = player.rushCount + 1*dt
		end
	end
	if player.rushCount >= 2 then player.speed = ninja.speed end
	if player.rushCount >= 20 then
		player.rushCount = 0 
		player.rush = false
	end
	--Invisibility
		if player.invisible == true then
			if player.invisibleTimer <= 0 then
				player.invisibleTimer = 4.5
			else
				player.isInvisible = true
				player.invisibleTimer = player.invisibleTimer - dt
				player.invisibleCount = player.invisibleCount + 1*dt
			end
		end
		if player.invisibleCount >= 2 then player.isInvisible = false end
		if player.invisibleCount >= 20 then
			player.invisibleCount = 0
			player.invisible = false
		end
end