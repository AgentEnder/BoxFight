modeSelect = {}
inConsole = false
consoleStr = ""
key = "error"
function modeSelect.load()
	gamestate = modeSelect
	love.graphics.setBackgroundColor( 190, 190, 190 )
	if player1.lives == 0 then player1.lives = 3 end
	buttons = 	{
				{imgOn = image_singlePlayerOn, imgOff = image_singlePlayer, x = 400, y = 300 - 128, w = 256, h = 64, action = "singlePlayer"},
				{imgOn = image_practiceOn, imgOff = image_practice, x = 400, y = 300 + 128, w = 256, h = 64, action = "practice"},
				{imgOn = image_multiplayerOn, imgOff = image_multiplayer, x = 400, y = 300, w = 256, h = 64, action = "multiplayer"}
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

function modeSelect.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )
	love.graphics.print("See Help.txt, major update helpscreen not updated", 20, 20, 0, 1, 1)
	for k, v in pairs(buttons) do
		drawButton(v.imgOff, v.imgOn, v.x, v.y, v.w, v.h, x, y)
	end
	if inConsole == true then 
		love.graphics.print(consoleStr, 20, 85, 0, 1, 1) 
	end
end

function modeSelect.update(dt)
end

function modeSelect.focus(bool)
end

function modeSelect.keypressed( key, unicode )
	if inConsole == false then
		if key == "escape" then menu.load() end
		if key == "9" then playSound(attack2.sound) end
		if key == "0" then playSound(attack1.sound) end
		if key == "`" then inConsole = true end
	else
		
		
		if key == "return" then
			checkStr(consoleStr)
			inConsole = false
		end
		if key == "lctrl" or key == "rctrl" or key == "backspace" or key == "tab" or key == "alt" or key == "lshift" or key == "rshift" or key == "return"then
		else
			consoleStr = consoleStr .. key
		end
	end
end

function modeSelect.keyreleased( key, unicode )
	
end

function modeSelect.mousepressed( x, y, button )
	if button == 1 then
		for k, v in pairs(buttons) do
			local ins = insideBox(x, y, v.x - (v.w/2), v.y-(v.h/2), v.w, v.h)
			
			if ins then
				if v.action == "singlePlayer" then
					singlePlayerMenu.load()
				elseif v.action == "practice" then
					player2.isAi = true
					playerSelect.load()
				elseif v.action == "multiplayer" then
					player2.isAi = false
					playerSelect.load()
				end
			end
		end
	end
end

function modeSelect.mousereleased( x, y, button )
end

function modeSelect.quit()
end

function insideBox( px, py, x, y, wx, wy )
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	end
	return false
end