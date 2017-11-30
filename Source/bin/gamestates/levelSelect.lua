levelSelect = {}

function levelSelect.load()
	gamestate = levelSelect
	levelSelect.timer = 0
	love.graphics.setBackgroundColor( 190, 190, 190 )
	
	
	buttons = 	{
				{imgOn = image_map1On, imgOff = image_map1, x = 400-130, y = 300 - 130, w = 128, h = 128, action = "selectMap1"},
				{imgOn = image_map5On, imgOff = image_map5, x = 400-130, y = 300, w = 128, h = 128, action = "selectMap5"},
				{imgOn = image_map2On, imgOff = image_map2, x = 400, y = 300 - 130, w = 128, h = 128, action = "selectMap2"},
				{imgOn = image_map4On, imgOff = image_map4, x = 400, y = 300, w = 128, h = 128, action = "selectMap4"},
				{imgOn = image_map3On, imgOff = image_map3, x = 400 + 130, y = 300 - 130, w = 128, h = 128, action = "selectMap3"},
				}
end

local function drawButton(off, on, x, y, w, h, mx, my)
	local ins = insideBox(mx, my, x - (w/2), y-(h/2), w, h)
	
	love.graphics.setColor(255,255,255,255)
	
	
	if ins then
		love.graphics.draw(on, x, y, 0 , 1, 1, w/2, h/2)
	else
		love.graphics.draw(off, x, y, 0 , 1, 1, w/2, h/2)
	end
end

function levelSelect.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )
	
	for k, v in pairs(buttons) do
		drawButton(v.imgOff, v.imgOn, v.x, v.y, v.w, v.h, x, y)
	end
end

function levelSelect.update(dt)
	levelSelect.timer = levelSelect.timer + dt
end

function levelSelect.focus(bool)
end

function levelSelect.keypressed( key, unicode )
	if key == "escape" then
		menu.load()
	end
end

function levelSelect.keyreleased( key, unicode )
	
end

function levelSelect.mousepressed( x, y, button )
	if levelSelect.timer > .5 then
		if button == 1 then
			for k, v in pairs(buttons) do
				local ins = insideBox(x, y, v.x - (v.w/2), v.y-(v.h/2), v.w, v.h)
				
				if ins then
					if v.action == "selectMap1" then
						playing.load(map1, player2.isAi)
					elseif v.action == "selectMap2" then
						playing.load(map2, player2.isAi)
					elseif v.action == "selectMap3" then
						playing.load(map3, player2.isAi)
					elseif v.action == "selectMap4" then
						playing.load(map4, player2.isAi)
					elseif v.action == "selectMap5" then
						playing.load(map5, player2.isAi)
					end
				end
			end
		end
	end
end

function levelSelect.mousereleased( x, y, button )
end

function levelSelect.quit()
end

function insideBox( px, py, x, y, wx, wy )
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	end
	return false
end