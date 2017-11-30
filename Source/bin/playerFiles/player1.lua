player1.classStr = "Select Now!"
local player = player1

function player1.load()
	player1.dead = false
	if mapT == map1 or mapT == map2 then
		player1.x = 40
		player1.y = 600-80
	else
		player1.x = mapT.player1x
		player1.y = mapT.player1y
	end
	player1.direction = nil
	player1.jump = 0
	player1.jumpCount = 0
	player1.inAir = true
	player1.str = " player 1"
	player1.respawnTimer = 0
	if player1.class == nil then class.set(player1, standardClass) end
	player1.class.respawn(player1)
	player1.jumps = 0
	--Hud
	hud.load(player1)
	--Animation
	player1.animtimer = 0
	player1.animnum = 0
	player1.anim = "right"
	--effects
	player1.isInvisible = false
	--Collisions
	player1.collisions = {}
	player1.collisions.bottom = false
	player1.collisions.left = false
	player1.collisions.right = false
	player1.collisions.top = false
end

function player1.update(dt)
	--Collisions
	if mapT == map1 or mapT == map2 then 
		collisions(player1,dt) 
		
		--Movement
		if player1.inAir == true then
			player1.gravityTimer = 2
			if player1.gravityTimer < 10  then
				player1.gravityTimer = 2*dt+player1.gravityTimer
			end
			if player1.y < 600-40+16 then
				player1.y = player1.y + (32*player1.gravityTimer)*dt*5
			else
				player1.y = 600-40+16
			end
		else
			if player1.jump < 0 then
				player1.jump = 0
			end
			player1.gravityTimer = 2
			player1.y = player1.y
		end
		if player1.direction == "left" then
			player1.x = player1.x - player1.speed*dt
		end
		if player1.direction == "right" then
			player1.x = player1.x + player1.speed*dt
		end
		if player1.jump > 0 then
			if mapT.environmentalCollision_platformOne(player1)== "top" then
				player1.jump=0
			end
			player1.jump = player1.jump-3*dt
			player1.y = player1.y - ((player1.jump*16 + 32)*dt)*5
		end
		
	else 
		newCollisions(player1, dt)
		if gamestate ~= singlePlayer then
			if love.keyboard.isDown("a") and player1.collisions.left == false then
				player1.x = player1.x - dt*player.speed
				player1.anim = "left"
			elseif love.keyboard.isDown("d") and player1.collisions.right == false then
				player1.x = player1.x + dt*player.speed
				player1.anim = "right"
			end
		else
			if love.keyboard.isDown("left") and player1.collisions.left == false then
				player1.x = player1.x - dt*player.speed
				player1.anim = "left"
			elseif love.keyboard.isDown("right") and player1.collisions.right == false then
				player1.x = player1.x + dt*player.speed
				player1.anim = "right"
			end
		end
		--if love.keyboard.isDown("up") and player1.collisions.top == false then
			player1.y = player1.y - dt*150
		--elseif love.keyboard.isDown("down") and player1.collisions.bottom ==false then
			player1.y = player1.y + dt*150
		--end
		--if player1.collisions.bottom == false then player1.y = player1.y + 50*dt elseif player1.collisions.bottom == true then player1.y = player1.y - 50*dt end
		if player1.jumping == true then
			if player1.collisions.top ~= true then player1.y = player1.y - 50*player1.jumpTimer*dt else player1.jumpTimer = 2 end
			player1.jumpTimer = player1.jumpTimer - 3*dt
			if player1.jumpTimer <= 0 then player1.jumping = false end
		end
		if not player1.collisions.bottom == true then player1.y = player1.y + 100*dt end
	end
	--Regen&Class Effects
		player1.class.update(player1, dt)
		if gamestate == singlePlayer then
			if love.keyboard.isDown("l") then
				(player1.class).abilities[2](player1, "l")
			end
			if love.keyboard.isDown("k") then
				(player1.class).abilities[1](player1, "k")
			end	
		else
			if love.keyboard.isDown("e") then
				(player1.class).abilities[2](player1, "e")
			end
			if love.keyboard.isDown("q") then
				(player1.class).abilities[1](player1, "q")
			end	
		end
	--Respawn
	if player1.health <= 0 then
		player1.direction = nil
		explosion.sound:play()
		player1.dead = true
		player1.respawnTimer = player1.respawnTimer + dt
		if player1.respawnTimer > 1 then
			if gamestate == singlePlayer then player1.lives = player1.lives - 1 end
			print(player1.lives)
			player1.load()
		end
	end

	--Hud
	hud.update(dt, player1)
	
	--Animation
	player1.animtimer = player1.animtimer + 2*dt
	if player1.animtimer > 1 then
		player1.animnum = player1.animnum + 1
		player1.animtimer = 0
	end
	if player1.animnum > 1 then player1.animnum = 0 end
end

function player1.draw()
	love.graphics.setColor(255,255,255)
	if player1.isInvisible == false then
		if mapT == map2 or mapT == map1 then
			if player1.animnum == 0 then
			  if player1.anim == "right" then
				love.graphics.draw(player1.r11, player1.x+8, player1.y-16, 0, player.scale, player.scale)
			  elseif player1.anim == "left" then
				love.graphics.draw(player1.l11, player1.x+8, player1.y-16, 0, player.scale, player.scale)
			  end
			end
			if player1.animnum == 1 then
			  if player1.anim == "right" then
				love.graphics.draw(player1.r12, player1.x+8, player1.y-16, 0, player.scale, player.scale)
			  elseif player1.anim == "left" then
				love.graphics.draw(player1.l12, player1.x+8, player1.y-16, 0, player.scale, player.scale)
			  end
			end
		else
			if player1.animnum == 0 then
			  if player1.anim == "right" then
				love.graphics.draw(player1.r11, player1.x, player1.y, 0, player.scale, player.scale)
			  elseif player1.anim == "left" then
				love.graphics.draw(player1.l11, player1.x, player1.y, 0, player.scale, player.scale)
			  end
			end
			if player1.animnum == 1 then
			  if player1.anim == "right" then
				love.graphics.draw(player1.r12, player1.x, player1.y, 0, player.scale, player.scale)
			  elseif player1.anim == "left" then
				love.graphics.draw(player1.l12, player1.x, player1.y, 0, player.scale, player.scale)
			  end
			end
		end
	end
	hud.draw(player1)
end

function player1.keypressed(key)
	if mapT == map1 or mapT == map2 then
		if player1.dead == false then
			if gamestate == singlePlayer then
				if key == "left" then 
					player1.direction = "left"
					player1.anim = "left"
				end
				
				if key == "up" then
					Jump(player1)
				end
				
				if key == "right" then 
					player1.direction = "right"
					player1.anim = "right"
				end
				
				if key == "." then 
					attack(player1,player1.anim, 1)
				end
				
				if key == "," then 
					attack(player1,player1.anim, 2)
				end
			else
				if key == "a" then 
					player1.direction = "left"
					player1.anim = "left"
				end
				
				if key == "w" then
					Jump(player1)
				end
				
				if key == "d" then 
					player1.direction = "right"
					player1.anim = "right"
				end
				
				if key == "z" then 
					attack(player1,player1.anim, 1)
				end
				
				if key == "lctrl" then 
					attack(player1,player1.anim, 2)
				end
			end
		end
	else
		if gamestate == singlePlayer then
			if key == "up" then
				Jump(player1)
			elseif key == "." then 
				attack(player1,player1.anim, 1)
			elseif key == "," then 
				attack(player1,player1.anim, 2)
			end
		else
			if key == "w" then
				Jump(player1)
			elseif key == "z" then 
				attack(player1,player1.anim, 1)
			elseif key == "lctrl" then 
				attack(player1,player1.anim, 2)
			end
		end
	end
end

function player1.keyreleased(key)
	if gamestate == singlePlayer then
		if key == "left" and player1.direction == "left" then 
			player1.direction = nil
		end
		
		if key == "right" and player1.direction == "right" then 
			player1.direction = nil
		end
	else
		if key == "a" and player1.direction == "left" then 
			player1.direction = nil
		end
		
		if key == "d" and player1.direction == "right" then 
			player1.direction = nil
		end
	end
end