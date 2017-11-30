map2 = {}

function map2.load()
	--Resources
	
	platformImage = love.graphics.newImage("/resources/platform.png")
	cannonImage = love.graphics.newImage("/resources/cannon.png")
	
	--Environment
	map = "map2"
	
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
	platformThree.x1 = 400-32
	platformThree.x2 = 432
	platformThree.y1 = 400
	platformThree.y2 = 416
	platformThree.timer = 0
	
	platformFour = {}
	platformFour.x1 = 400-32
	platformFour.x2 = 432
	platformFour.y1 = 300
	platformFour.y2 = 316
	platformFour.timer = 3
end

function map2.update(dt)
	platformThree.timer = platformThree.timer + dt/2
	if math.floor(platformThree.timer) < 1 then
		platformThree.x1 = 400-32
		platformThree.x2 = 432
	elseif math.floor(platformThree.timer) < 2 then
		platformThree.x1 = 300-32
		platformThree.x2 = 332
	elseif math.floor(platformThree.timer) < 3 then
		platformThree.x1 = 500-32
		platformThree.x2 = 532
	else
		platformThree.timer = 0
	end
	if platformFour.timer >= 0 then
		platformFour.timer = platformFour.timer + dt/2
		if math.floor(platformFour.timer) == 3 then
			platformFour.x1 = 400-32
			platformFour.x2 = 432
		elseif math.floor(platformFour.timer) == 2 then
			platformFour.x1 = 300-32
			platformFour.x2 = 332
		elseif math.floor(platformFour.timer) == 1 then
			platformFour.x1 = 500-32
			platformFour.x2 = 532
		else
			platformFour.timer = 3
		end
	else
		platformFour.timer = 3
	end
end

function map2.draw()
	love.graphics.setColor(213,147,0)
	love.graphics.rectangle("fill",0,600-40,800,600)
	love.graphics.setColor(50,42,98)
	love.graphics.draw(platformImage, platformOne.x1, platformOne.y1, 0, 1, 1, 0, 0, 0, 0)
	love.graphics.draw(platformImage, platformTwo.x1, platformTwo.y1, 0, 1, 1, 0, 0, 0, 0)
	love.graphics.rectangle("fill", platformThree.x1,platformThree.y1,64,16)
	love.graphics.draw(platformImage, platformFour.x1, platformFour.y1, 0, 1, 1, 0, 0, 0, 0)
end

function map2.environmentalCollision_Ground(obj)
	--Ground
	if obj.y + 8 >=600 - 40 + 8 then
		return("bottom")
	else
		return (nil)
	end
end

function map2.environmentalCollision_platformOne(obj)
	if obj.x-8 < platformOne.x2 and obj.x+8 > platformOne.x1 then
		if platformOne.y1<=obj.y and obj.y<platformOne.y1+20 then
			return("bottom")
		elseif obj.y+16 > platformOne.y1-8 then
		end
	else
		return(nil)
	end
end

function map2.environmentalCollision_platformTwo(obj)
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

function map2.environmentalCollision_platformThree(obj)
	if obj.x-8 < platformThree.x2 and obj.x+8 > platformThree.x1 then
		if platformThree.y1<=obj.y and obj.y<platformThree.y1+20 then
			return("bottom")
		end
	else
		return(nil)
	end
end

function map2.environmentalCollision_platformFour(obj)
	if obj.x-8 < platformFour.x2 and obj.x+8 > platformFour.x1 then
		if platformFour.y1<=obj.y and obj.y<platformFour.y1+20 then
			return("bottom")
		end
	else
		return(nil)
	end
end

function map2.collisions(player, dt)
	if map2.environmentalCollision_Ground(player)  then
		player.y = player.y-1
		player.inAir = false
	end
	if map2.environmentalCollision_platformOne(player)== "bottom" then
		player.y = player.y-1
		player.inAir = false
	end
	if map2.environmentalCollision_platformTwo(player)== "bottom" then
		player.y = player.y-1
		player.inAir = false
	end
	if map2.environmentalCollision_platformThree(player) == "bottom" then
		player.y = player.y-1
		player.y = 400
		player.inAir = false
	end
	if map2.environmentalCollision_platformFour(player) == "bottom" then
		player.y = 300
		player.inAir = false
	end
	if map2.environmentalCollision_Ground(player) == nil and map2.environmentalCollision_platformThree(player) == nil then
		if map2.environmentalCollision_platformOne(player)== nil and map2.environmentalCollision_platformTwo(player)==nil then
			if map2.environmentalCollision_platformFour(player) == nil then
				player.inAir = true
			end
		end
	end
	if player.x < 8 then player.x = 8 end
	if player.y < 0 then player.y = 0 end
	if player.x > 800-8 then player.x = 800-8 end
end