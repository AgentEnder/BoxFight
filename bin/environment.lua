function environment.load()
	--Resources
	
	platformImage = love.graphics.newImage("/resources/platform.png")
	cannonImage = love.graphics.newImage("/resources/cannon.png")
	
	--Environment
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
end

function environment.update(dt)

end

function environment.draw()
	love.graphics.setColor(213,147,0)
	love.graphics.rectangle("fill",0,600-40,800,600)
	love.graphics.setColor(50,42,98)
	love.graphics.draw(cannonImage, 400-16, 600-72, 0, 1, 1,0,0,0,0)
	love.graphics.draw(platformImage, 200, 500, 0, 1, 1, 0, 0, 0, 0)
	love.graphics.draw(platformImage, 600-64, 500, 0, 1, 1, 0, 0, 0, 0)
end

function environmentalCollision_Ground(obj)
	--Ground
	if obj.y + 8 >=600 - 40 + 8 then
		return("bottom")
	else
		return (nil)
	end
end

function environmentalCollision_centralPillar(obj)
	--centralPillar
	if obj.x-8 < centralPillar.x2 and obj.x+8 > centralPillar.x1 then
		if centralPillar.y<=obj.y and obj.y<centralPillar.y+20 then
			return("bottom")
		end
		if obj.y>centralPillar.y then
			if obj.x > 400 then
				return("right")
			end
			if obj.x < 400 then
				print("detected")
				return("left")
			end
		end
	else
		return(nil)
	end
end

function environmentalCollision_platformOne(obj)
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

function environmentalCollision_platformTwo(obj)
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