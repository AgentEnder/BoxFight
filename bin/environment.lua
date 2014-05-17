function environment.load()
	centralPillar = {}
	centralPillar.x1 = 400-8
	centralPillar.x2 = 408
	centralPillar.y = 600-72
end

function environment.update(dt)

end

function environment.draw()
	love.graphics.setColor(213,147,0)
	love.graphics.rectangle("fill",0,600-32,800,600)
	love.graphics.setColor(50,42,98)
	love.graphics.rectangle("fill", 400-8, 600-40-32, 16, 100)
end

function environmentalCollision_Ground(obj)
	--Ground
	if obj.y >=600 - 40 + 8 then
		return("bottom")
	else
		return (nil)
	end
end

function environmentalCollision_centralPillar(obj)
	--centralPillar
	if obj.x < centralPillar.x2 and obj.x+8 > centralPillar.x1 then
		if centralPillar.y<=obj.y and obj.y<centralPillar.y+20 then
			return("bottom")
		elseif obj.y>centralPillar.y then
			if obj.x+8 > 400-8 then
				return("right")
			elseif obj.x-8 < 408 then
				return("left")
			end
		end
	else
		return(nil)
	end
end