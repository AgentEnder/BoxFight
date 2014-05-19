function player1.load()
	player1.x = 40
	player1.y = 600-80
	player1.direction = nil
	player1.jump = 0
	player1.jumpCount = 0
	player1.inAir = true
end

function player1.update(dt)
	--Collisions
	if environmentalCollision_Ground(player1) or environmentalCollision_centralPillar(player1)== "bottom" then
		player1.inAir = false
	end
	if environmentalCollision_platformOne(player1)== "bottom" then
		player1.inAir = false
	end
	if environmentalCollision_platformTwo(player1)== "bottom" then
		player1.inAir = false
	end
	if environmentalCollision_Ground(player1) == nil and environmentalCollision_centralPillar(player1) == nil then
		if environmentalCollision_platformOne(player1)== nil and environmentalCollision_platformTwo(player1)==nil then
			player1.inAir = true
		end
	end
	if environmentalCollision_centralPillar(player1) == "right" then
		player1.x = player1.x - 101*dt
	end
	
	if environmentalCollision_centralPillar(player1) == "left" then
		player1.x = player1.x +	101*dt
	end
	--if environmentalCollision_platformOne(player1)== "top" then
		--player1.y = player1.y
		--player1.inAir = true
		--print("detected")
	--end
	
	
	--Movement
	--if player1.y < 600 - 40 then
	--	player1.inAir = true
	--else
	--	player1.inAir = false
	--end
	if player1.inAir == true then
		player1.gravityTimer = 2
		if player1.gravityTimer < 10 then
			player1.gravityTimer = 5*dt + player1.gravityTimer
		end
		player1.y = player1.y + (32*player1.gravityTimer*dt)*5
	else
		player1.y = player1.y
	end
	if player1.direction == "left" then
		player1.x = player1.x - 100*dt
	end
	if player1.direction == "right" then
		player1.x = player1.x + 100*dt
	end
	if player1.jump > 0 then
		if environmentalCollision_platformOne(player1)== "top" then
			player1.jump=0
		end
		player1.jump = player1.jump-3*dt
		player1.y = player1.y - ((player1.jump*16 + 32)*dt)*5
		--print("jumping")
	end
end

function player1.draw()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", player1.x-8, player1.y-16, 16, 16)
end

function player1.keypressed(key)
	if key == "a" then 
		player1.direction = "left"
	end
	
	if key == "w" then
		Jump(player1)
	end
	
	if key == "d" then 
		player1.direction = "right"
	end
end

function player1.keyreleased(key)
	if key == "a" and player1.direction == "left" then 
		player1.direction = nil
	end
	
	if key == "d" and player1.direction == "right" then 
		player1.direction = nil
	end
end

function player1.collide(side)
	if side=="bottom" then
		player1.inAir = false
	end
end