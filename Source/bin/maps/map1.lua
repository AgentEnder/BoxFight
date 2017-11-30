map1 = {}

function map1.load()
	--Resources
	
	platformImage = love.graphics.newImage("/resources/platform.png")
	cannonImage = love.graphics.newImage("/resources/cannon.png")
	
	--Environment
	map = "map1"
	colorTimer = 0
	
	centralPillar = {}
	centralPillar.x1 = 400-8
	centralPillar.x2 = 408
	centralPillar.y = 600-72
	platformOne = {}
	platformOne.x1 = 200
	platformOne.x2 = 264
	platformOne.y1 = 500
	platformOne.y2 = 516
	platformTwo = {}
	platformTwo.x1 = 600-64
	platformTwo.x2 = 600
	platformTwo.y1 = 500
	platformTwo.y2 = 516
	platformThree = {}
	platformThree.x1 = 400-64
	platformThree.x2 = 400+64
	platformThree.y1 = 200
	platformThree.y2 = 216
end

function map1.update(dt)
	--colorTimer = colorTimer + dt
	--if colorTimer >= 1 then colorTimer = 0 end
end

function map1.draw()
	love.graphics.setColor(213,147,0)
	love.graphics.rectangle("fill",0,600-40,800,600)
	if colorTimer < 0.5 then
		love.graphics.setColor(50,42,98)
	else
		love.graphics.setColor(255,255,255)
	end
	love.graphics.draw(cannonImage, 400-16, 600-72, 0, 1, 1,0,0,0,0)
	love.graphics.setColor(50,42,98)
	love.graphics.draw(platformImage, 200, 500, 0, 1, 1, 0, 0, 0, 0)
	love.graphics.draw(platformImage, 600-64, 500, 0, 1, 1, 0, 0, 0, 0)
	--love.graphics.rectangle("fill", platformThree.x1,platformThree.y1,128,16)
end

function map1.environmentalCollision_Ground(obj)
	--Ground
	if obj.y + 8 >=600 - 40 + 8 then
		return("bottom")
	else
		return (nil)
	end
end

function map1.environmentalCollision_centralPillar(obj)
	--centralPillar
	if obj.x-8 < centralPillar.x2 and obj.x+8 > centralPillar.x1 then
		if centralPillar.y<=obj.y and obj.y<centralPillar.y+20 then
			return("bottom")
		end
		if obj.y>centralPillar.y then
			if obj.x > 399 then
				return("right")
			end
			if obj.x <= 400 then
				--print("detected")
				return("left")
			end
		end
	else
		return(nil)
	end
end

function map1.environmentalCollision_platformOne(obj)
	if obj.x-8 < platformOne.x2 and obj.x+8 > platformOne.x1 then
		if platformOne.y1<=obj.y and obj.y<platformOne.y1+20 then
			return("bottom")
		elseif obj.y+16 > platformOne.y1-8 then
			--if obj.y+16 <= platformOne.y2 then
				--print("top")
				--return("top")
			--end
		end
	else
		return(nil)
	end
end

function map1.environmentalCollision_platformTwo(obj)
	if obj.x-8 < platformTwo.x2 and obj.x+8 > platformTwo.x1 then
		if platformTwo.y1<=obj.y and obj.y<platformTwo.y1+20 then
			return("bottom")
		elseif obj.y+16 > platformTwo.y1-8 then
			--if obj.y+16 <= platformTwo.y2 then
				--print("top")
				--return("top")
			--end
		end
	else
		return(nil)
	end
end

function map1.environmentalCollision_platformThree(obj)
	if obj.x-8 < platformThree.x2 and obj.x+8 > platformThree.x1 then
		if platformThree.y1<=obj.y and obj.y<platformThree.y1+20 then
			return("bottom")
		--elseif obj.y+16 > platformThree.y1-8 then
			--if obj.y+16 <= platformThree.y2 then
				--print("top")
				--return("top")
			--end
		end
	else
		return(nil)
	end
end

function map1.collisions(player, dt)
	if map1.environmentalCollision_Ground(player) or map1.environmentalCollision_centralPillar(player)== "bottom" then
		player.inAir = false
	end
	if map1.environmentalCollision_platformOne(player)== "bottom" then
		player.inAir = false
	end
	if map1.environmentalCollision_platformTwo(player)== "bottom" then
		player.inAir = false
	end
	if map1.environmentalCollision_platformThree(player) then
		player.inAir = false
	end
	if map1.environmentalCollision_Ground(player) == nil and map1.environmentalCollision_centralPillar(player) == nil then
		if map1.environmentalCollision_platformOne(player)== nil and map1.environmentalCollision_platformTwo(player)==nil then
			if map1.environmentalCollision_platformThree(player)==nil then
				player.inAir = true
			end
		end
	end
	if map1.environmentalCollision_centralPillar(player) == "right" then
		player.x = player.x - 101*dt
	end
	if map1.environmentalCollision_centralPillar(player) == "left" then
		player.x = player.x +	101*dt
	end
	if player.isAi == true then
		if map1.environmentalCollision_centralPillar(player) == "right" then
			player.x = player.x - 101*dt
			Jump(player)
		end
		if map1.environmentalCollision_centralPillar(player) == "left" then
			player.x = player.x +	101*dt
			Jump(player)
		end
	end
	if player.x < 8 then player.x = 8 end
	if player.y < 0 then player.y = 0 end
	if player.x > 800-8 then player.x = 800-8 end
end
