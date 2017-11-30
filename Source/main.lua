highscore = {}
--createPlayers
require("/bin/gamestates/loading")
require("/bin/console")
require("/bin/gamestates/paused")

function love.load()
	paused = false
	font = love.graphics.newFont( "/resources/micross.ttf", 24 )
	love.graphics.setBackgroundColor(40,40,40)
	medium = love.graphics.newFont(45)
	if love.filesystem.exists("sav.lua") == false then
		print("no score file found")
		love.filesystem.write("sav.lua", "highscore.easy = 0 highscore.normal = 0 highscore.hard = 0")
	end
	save = love.filesystem.load("sav.lua")
	save()
	gamestate = loading
	gamestate.load()
end

function love.update(dt)
	if inConsole or paused then return end
	gamestate.update(dt)
end

function love.draw()
	love.graphics.setFont(font)
	gamestate.draw()
	pause.draw()
	console.draw()
end

function love.keypressed(key, unicode)
	if inConsole == false then
		if key == "p" then
			if paused ~= true then 
				pause.load()
			else
			paused = false
			end
		end
		if key == "u" then print(player2.collisions.top)end
		if paused == true then return end
		if paused == false then
			gamestate.keypressed(key)
		end
		if gamestate~= menu and paused == false then if key == escape then gamestate = menu end end
		if key == "`" then inConsole = true end
	else
		console.keypressed(key)
	end
end

function love.textinput(t)
	--print(t)
	if inConsole then
		console.textinput(t)
	end
end

function love.keyreleased(key, unicode)
	gamestate.keyreleased(key)
end

function love.mousepressed(x, y, button, istouch)
	if paused == true then pause.mousepressed(x, y, button) return end
	gamestate.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
end

function playSound(sound)
	sound:setVolume(sfxVolume)
	sound:play()
end


function Jump(player)
	--print (player.jump)
	if mapT == map1 or mapT == map2 then
		if player.inAir == false then
			if mapT == map1 then
				if	mapT.environmentalCollision_centralPillar(player) == "right" or mapT.environmentalCollision_centralPillar(player1) == "left" then
					player.jump = 2.5 + player.jumpHeight
				else
					playSound(jumpSound)
					player.jump = player.jumpHeight
				end
			else
				playSound(jumpSound)
				player.jump = player.jumpHeight
			end
		end
	else
		if player.jumps < 3 then 
			player.jumps = player.jumps + 1
			player.jumping = true
			player.jumpTimer = player.jumpHeight
		end
	end
end

