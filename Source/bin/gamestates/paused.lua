pause = {}
local buttons = {}
function pause.load()
	paused = true
	--[[image_play = love.graphics.newImage("resources/buttons/Play.png")
	image_quit = love.graphics.newImage( "resources/buttons/Quit.png" )
	image_playOn = love.graphics.newImage("resources/buttons/Play_on.png")
	image_quitOn = love.graphics.newImage( "resources/buttons/Quit_on.png" )
	image_help = love.graphics.newImage( "resources/buttons/help.png" )
	image_helpOn = love.graphics.newImage("resources/buttons/help_on.png")]]--
	if player1.lives == 0 then player1.lives = 3 end
	buttons = 	{
				{imgOn = image_resumeOn, imgOff = image_resume, x = 400, y = 300 - 128, w = 256, h = 64, action = "play"},
				{imgOn = image_quitOn, imgOff = image_quit, x = 400, y = 300 + 128, w = 256, h = 64, action = "quit"},
				{imgOn = image_optionsOn, imgOff = image_options, x = 400, y = 300, w = 256, h = 64, action = "help"}
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

function pause.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )
	if paused == true then
		love.graphics.setColor(0,0,0,100)
		love.graphics.rectangle("fill",0,0,800,600)
		for k, v in pairs(buttons) do
			drawButton(v.imgOff, v.imgOn, v.x, v.y, v.w, v.h, x, y)
		end
	end
end

function pause.update(dt)
end

function pause.focus(bool)
end

function pause.keypressed( key, unicode )
	if inConsole == false then
		if key == "escape" then paused = false end
		if key == "p" then paused = false end
		if key == "`" then inConsole = true end
	else
		
		

	end
end

function pause.keyreleased( key, unicode )
	
end

function pause.mousepressed( x, y, button )
	if button == 1 then
		for k, v in pairs(buttons) do
			local ins = insideBox(x, y, v.x - (v.w/2), v.y-(v.h/2), v.w, v.h)
			
			if ins then
				if v.action == "play" then
					paused = false
				elseif v.action == "quit" then
					menu.load()
					paused = false
				elseif v.action == "help" then
					options.load()
					paused = false
				end
			end
		end
	end
end

function pause.mousereleased( x, y, button )
end

function pause.quit()
end



function insideBox( px, py, x, y, wx, wy )
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	end
	return false
end