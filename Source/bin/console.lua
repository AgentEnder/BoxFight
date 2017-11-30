console = {}
inConsole = false
consoleStr = ""
devConsole = false
function console.keypressed(key)
	if key == "return" then
		checkStr(consoleStr)
		inConsole = false
	elseif key == "escape" then
		inConsole = false
	elseif key == "backspace" then
		consoleStr = string.sub(consoleStr, 1, #consoleStr-1)
	end
end

function console.textinput(t)
	if t ~= "`" then
		consoleStr = consoleStr .. t
	end
end

function console.draw()
	if inConsole then
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill",0,0,800,50)
		love.graphics.setColor(255,255,255)
		love.graphics.print(consoleStr, 0, 2, 0, 1, 1)
	end
end


function checkStr(str)
	if devConsole == false then
		local fail = false
		if str == "single player" then
			singlePlayerMenu.load()
		elseif str == "death" then
			death.load()
		elseif str == "player2.isai = false" then
			player2.isAi = false
		elseif str == "player2.isai = true" then
			player2.isAi = true
		elseif str == "heal" then
			player1.health = player1.maxhealth
		elseif str == "extra dmg" then
			player1.dmg = 50
		elseif str == "player = knight" then
			class.set(player1, knight)
		elseif str == "map3" then
			playing.load(map3)
		elseif str == "config" then
			options.load()
		elseif str =="reset highscores" then
				love.filesystem.write("sav.lua", "highscore.easy = 0 highscore.normal = 0 highscore.hard = 0")
		elseif str == "devConsole = true" then
			devConsole = true
		else
			fail = true
		end
		if fail == true then
			playSound(failSound)
		else
			playSound(consoleSound)
		end
		consoleStr = ""
	else
		print("Running Code:" .. consoleStr)
		love.filesystem.write("dev.lua", consoleStr)
		local chunk = love.filesystem.load("dev.lua", consoleStr)
		chunk()
		consoleStr = ""
	end
end