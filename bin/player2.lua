function player2.load()
	player2.x = 800-40
	player2.y = 600-40
	player2.direction = nil
	player2.jump = 0
	player2.jumpCount = 0
end

function player2.update(dt)
		--Collisions
	if environmentalCollision_Ground(player2) == nil then
		player2.inAir = true
	end
	if environmentalCollision_Ground(player2) or environmentalCollision_centralPillar(player2)== "bottom" then
		player2.inAir = false
	end
	
	if environmentalCollision_Ground(player2) == nil and environmentalCollision_centralPillar(player2) == nil then
		player2.inAir = true
	end
	
	if environmentalCollision_centralPillar(player2) == "right" then
		player2.x = player2.x + 51*dt
	end
	
	if environmentalCollision_centralPillar(player2) == "right" then
		player2.x = player2.x - 51*dt
	end
	
	if environmentalCollision_centralPillar(player2) then print("colliding") end
	
	--Movement
	--if player2.y < 600 - 40 then
	--	player2.inAir = true
	--else
	--	player2.inAir = false
	--end
	if player2.inAir == true then
		player2.gravityTimer = 2
		if player2.gravityTimer < 10 then
			player2.gravityTimer = 5*dt + player2.gravityTimer
		end
		player2.y = player2.y + (32*player2.gravityTimer*dt)*3
	else
		player2.y = player2.y
	end
	if player2.direction == "left" then
		player2.x = player2.x - 50*dt
	end
	if player2.direction == "right" then
		player2.x = player2.x + 50*dt
	end
	if player2.jump > 0 then
		player2.jump = player2.jump-3*dt
		player2.y = player2.y - ((player2.jump*16 + 32)*dt)*3
		print("jumping")
	end
end

function player2.draw()
	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", player2.x-8, player2.y-2*8, 16, 16)
end

function player2.keypressed(key)
	if key == "left" then 	
		player2.direction = "left"
	end
	
	if key == "up" then
		Jump(player2)
	end
	
	if key == "right" then 
		player2.direction = "right"
	end
end

function player2.keyreleased(key)
	if key == "left" and player2.direction == "left" then 
		player2.direction = nil
	end
	
	if key == "right" and player2.direction == "right" then 
		player2.direction = nil
	end
end