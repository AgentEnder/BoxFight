singlePlayerMenu = {}
inConsole = false
consoleStr = ""
key = "error"
function singlePlayerMenu.load()
	gamestate = singlePlayerMenu
	love.graphics.setBackgroundColor( 190, 190, 190 )
	if singlePlayer.difficulty == 1 then
		difficultyImg = image_easy
		difficultyImgOn = image_easyOn
	end
	if singlePlayer.difficulty == 2 then
		difficultyImg = image_normal
		difficultyImgOn = image_normalOn
	end
	if singlePlayer.difficulty == 3 then
		difficultyImg = image_hard
		difficultyImgOn = image_hardOn
	end
	if player1.lives == 0 then player1.lives = 3 end
	
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

function singlePlayerMenu.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )
	for k, v in pairs(buttons) do
		drawButton(v.imgOff, v.imgOn, v.x, v.y, v.w, v.h, x, y)
	end
end

function singlePlayerMenu.update(dt)
	if singlePlayer.difficulty == 1 then
		difficultyImg = image_easy
		difficultyImgOn = image_easyOn
	end
	if singlePlayer.difficulty == 2 then
		difficultyImg = image_normal
		difficultyImgOn = image_normalOn
	end
	if singlePlayer.difficulty == 3 then
		difficultyImg = image_hard
		difficultyImgOn = image_hardOn
	end
	buttons = 	{
				{imgOn = difficultyImgOn, imgOff = difficultyImg, x = 400, y = 300 - 128, w = 256, h = 64, action = "difficulty"},
				{imgOn = image_quitOn, imgOff = image_quit, x = 400, y = 300 + 128, w = 256, h = 64, action = "quit"},
				{imgOn = image_playOn, imgOff = image_play, x = 400, y = 300, w = 256, h = 64, action = "play"}
				}
end

function singlePlayerMenu.focus(bool)
end

function singlePlayerMenu.keypressed( key, unicode )
	if inConsole == false then
		if key == "escape" then menu.load() end
		if key == "9" then playSound(attack2.sound) end
		if key == "0" then playSound(attack1.sound) end
		if key == "`" then inConsole = true end
	else
		console.keypressed(key)
	end
end

function singlePlayerMenu.keyreleased( key, unicode )
	
end

function singlePlayerMenu.mousepressed( x, y, button, istouch )
	if button == 1 then
		for k, v in pairs(buttons) do
			local ins = insideBox(x, y, v.x - (v.w/2), v.y-(v.h/2), v.w, v.h)
			
			if ins then
				if v.action == "play" then
					singlePlayer.load(map1, true)
				elseif v.action == "quit" then
					menu.load()
				elseif v.action == "difficulty" then
					if singlePlayer.difficulty < 3 then
						singlePlayer.difficulty = singlePlayer.difficulty + 1
					else
						singlePlayer.difficulty = 1
					end
					print(singlePlayer.difficulty)
				end
			end
		end
	end
end

function singlePlayerMenu.mousereleased( x, y, button )
end

function singlePlayerMenu.quit()
end

local function checkStr(str)
	if str == "player2.isai = false" then
		player2.isAi = false
		print("player 2 is now player controlled")
	end
	consoleStr = ""
end

function insideBox( px, py, x, y, wx, wy )
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	end
	return false
end