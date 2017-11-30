player2.classStr = "Select Now!"
function player2.load(var, var1)
	player2.x = 800-40
	player2.y = 600-80
	player2.dead = false
	player2.respawns = var1
	player2.respawnTimer = 0 
	player2.direction = nil
	player2.jump = 0
	player2.jumpCount = 0
	player2.inAir = true
	player2.sound = true
	if player2.isAi == nil then
		player2.isAi = var
	end
	player2.str = " player 2"
	if player2.class == nil then class.set(player2, standardClass) end
	player2.class.respawn(player2)
	--Hud
	hud.load(player2)
	--Animation
	player2.animtimer = 0
	player2.animnum = 0
	player2.anim = "left"
	--effects
	player2.isInvisible = false
end

function player2.update(dt)
	if player2.isAi == true then
		ai.movement(player2, dt)
		local  prob = love.math.random(1,3)
		if prob > 1.5 then
			ai.attack(player2, dt)
		end
	end
	--Collisions
	if mapT == map1 or mapT == map2 then
		collisions(player2,dt)
	end
	--Regen&Class Effects
	player2.class.update(player2, dt)
	if player2.isAi == false then
		if love.keyboard.isDown("l") then
			(player2.class).abilities[2](player2, "l")
		end
		if love.keyboard.isDown("k") then
			(player2.class).abilities[1](player2, "k")
		end	
	end
	--Movement
	if player2.inAir == true then
		player2.gravityTimer = 2
		if player2.gravityTimer < 10  then
			player2.gravityTimer = 2*dt+player2.gravityTimer
		end
		if player2.y < 600-40+16 then
			player2.y = player2.y + (32*player2.gravityTimer)*dt*5
		else
			player2.y = 600-40+16
		end
	else
		if player2.jump < 0 then
			player2.jump = 0
		end
		player2.gravityTimer = 2
		player2.y = player2.y
	end
	if player2.direction == "left" then
		player2.x = player2.x - player2.speed*dt
	end
	if player2.direction == "right" then
		player2.x = player2.x + player2.speed*dt
	end
	if player2.jump > 0 then
		if mapT.environmentalCollision_platformOne(player2)== "top" then
			player2.jump=0
		end
		player2.jump = player2.jump-3*dt
		player2.y = player2.y - ((player2.jump*16 + 32)*dt)*5
	end
	
	--Respawn
	if player2.health <= 0 then
		player2.direction = nil
		if player2.sound == true then
			explosion.sound:play()
		end
		player2.dead = true
		
		player2.respawnTimer = player2.respawnTimer + dt
		if player2.respawnTimer > 1 then
			if player2.respawns == true then 
				player2.load()
			end
			player2.sound = false
		end
	end
	
	--Hud
	hud.update(dt, player2)

	--Animation
	player2.animtimer = player2.animtimer + 2*dt
	if player2.animtimer > 1 then
		player2.animnum = player2.animnum + 1
		player2.animtimer = 0
	end
	if player2.animnum > 1 then player2.animnum = 0 end
end

function player2.draw()
	love.graphics.setColor(255,255,255)
	if player2.isInvisible == false then
		if player2.animnum == 0 then
			if player2.anim == "right" then
				love.graphics.draw(player2.r21, player2.x-8, player2.y-16)
			elseif player2.anim == "left" then
				love.graphics.draw(player2.l21, player2.x-8, player2.y-16)
			end
		end
		if player2.animnum == 1 then
			if player2.anim == "right" then
				love.graphics.draw(player2.r22, player2.x-8, player2.y-16)
			elseif player2.anim == "left" then
				love.graphics.draw(player2.l22, player2.x-8, player2.y-16)
			end
		end
	end
	hud.draw(player2)
end

function player2.keypressed(key)
	if player2.isAi == true then return end
	if player2.dead == false then
		if key == "left" then 
			player2.direction = "left"
			player2.anim = "left"
		end
		
		if key == "up" then
			Jump(player2)
		end
		
		if key == "right" then 
			player2.direction = "right"
			player2.anim = "right"
		end
		
		if key == "." then 
			attack(player2,player2.anim, 1)
		end
		
		if key == "," then 
			attack(player2,player2.anim, 2)
		end
	end
end

function player2.keyreleased(key)
	if player2.isAi==true then return end
	if key == "left" and player2.direction == "left" then 
		player2.direction = nil
	end

	if key == "right" and player2.direction == "right" then 
		player2.direction = nil
	end
end
