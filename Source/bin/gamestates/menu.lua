menu = {}
function menu.load()
	gamestate = menu
	love.graphics.setBackgroundColor( 190, 190, 190 )
	--[[image_play = love.graphics.newImage("resources/buttons/Play.png")
	image_quit = love.graphics.newImage( "resources/buttons/Quit.png" )
	image_playOn = love.graphics.newImage("resources/buttons/Play_on.png")
	image_quitOn = love.graphics.newImage( "resources/buttons/Quit_on.png" )
	image_help = love.graphics.newImage( "resources/buttons/help.png" )
	image_helpOn = love.graphics.newImage("resources/buttons/help_on.png")]]--
	if player1.lives == 0 then player1.lives = 3 end
	buttons = 	{
				{imgOn = image_playOn, imgOff = image_play, x = 400, y = 300 - 128, w = 256, h = 64, action = "play"},
				{imgOn = image_quitOn, imgOff = image_quit, x = 400, y = 300 + 128, w = 256, h = 64, action = "quit"},
				{imgOn = image_helpOn, imgOff = image_help, x = 400, y = 300, w = 256, h = 64, action = "help"}
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

function menu.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )
	love.graphics.print("See Help.txt, major update helpscreen not updated", 20, 20, 0, 1, 1)
	for k, v in pairs(buttons) do
		drawButton(v.imgOff, v.imgOn, v.x, v.y, v.w, v.h, x, y)
	end
end

function menu.update(dt)
end

function menu.focus(bool)
end

function menu.keypressed( key, unicode )
	if inConsole == false then
		if key == "escape" then love.event.quit() end
		if key == "9" then playSound(attack2.sound) end
		if key == "0" then playSound(attack1.sound) end
		if key == "`" then inConsole = true end
	else
		
		

	end
end

function menu.keyreleased( key, unicode )
	
end

function menu.mousepressed( x, y, button, istouch )
	print("mousepressed")
	if button == 1 then
		for k, v in pairs(buttons) do
			local ins = insideBox(x, y, v.x - (v.w/2), v.y-(v.h/2), v.w, v.h)
			print(v);
			if ins then
				if v.action == "play" then
					modeSelect.load()
				elseif v.action == "quit" then
					love.event.quit()
				elseif v.action == "help" then
					help.load()
				end
			end
		end
	end
end

function menu.mousereleased( x, y, button )
end

function menu.quit()
end



function insideBox( px, py, x, y, wx, wy )
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	end
	return false
end