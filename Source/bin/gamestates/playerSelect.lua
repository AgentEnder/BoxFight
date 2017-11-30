playerSelect = {}

function playerSelect.load()
	gamestate = playerSelect
	playerSelect.timer = 0
	love.graphics.setBackgroundColor( 190, 190, 190 )
	image_ninjaSelect = love.graphics.newImage("/resources/players/ninja/1r_fr1.png")
	image_standardSelect = love.graphics.newImage("/resources/players/1r_fr1.png")
	image_playOn = love.graphics.newImage("resources/buttons/Play_on.png")
	image_play = love.graphics.newImage("resources/buttons/Play.png")
	
	buttons = 	{
				{imgOn = image_playOn, imgOff = image_play, x = 400, y = 300 + 128, w = 256, h = 64, action = "play"},
				{imgOn = image_ninjaSelect, imgOff = image_ninjaSelect, x = 400, y = 300 - 128, w = 16, h = 16, action = "ninja"},
				{imgOn = image_standardSelect, imgOff = image_standardSelect, x = 400, y = 300 + 000, w = 16, h = 16, action = "standard"},
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

function playerSelect.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )
	
	for k, v in pairs(buttons) do
		drawButton(v.imgOff, v.imgOn, v.x, v.y, v.w, v.h, x, y)
	end
	love.graphics.print("Player 1:" .. player1.classStr, 20, 20, 0, 1, 1)
	love.graphics.print("Player 2:" .. player2.classStr, 20, 60, 0, 1, 1)
end

function playerSelect.update(dt)
	playerSelect.timer = playerSelect.timer + dt
end

function playerSelect.focus(bool)
end

function playerSelect.keypressed( key, unicode )
	if key == "escape" then
		menu.load()
	end
	if key == " " then levelSelect.load() end
end

function playerSelect.keyreleased( key, unicode )
	
end

function playerSelect.mousepressed( x, y, button )
	if playerSelect.timer > .5 then
		if button == 1 then
			for k, v in pairs(buttons) do
				local ins = insideBox(x, y, v.x - (v.w/2), v.y-(v.h/2), v.w, v.h)
				if ins then
					if v.action == "ninja" then
						class.set(player1, ninja)
						print("player1:ninja")
					elseif v.action == "standard" then
						class.set(player1, standardClass)
						print("player1:standard")
					end
					if v.action == "play" then
						levelSelect.load()
					end
				end
			end
		end
		if button == 2 then
			for k, v in pairs(buttons) do
				local ins = insideBox(x, y, v.x - (v.w/2), v.y-(v.h/2), v.w, v.h)
				if ins then
					if v.action == "ninja" then
						class.set(player2, ninja)
						print("player2:ninja")
					elseif v.action == "standard" then
						class.set(player2, standardClass)
						print("player2:standard")
					end
				end
			end
		end
	end
end


function playerSelect.mousereleased( x, y, button )
end

function playerSelect.quit()
end

function insideBox( px, py, x, y, wx, wy )
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	end
	return false
end