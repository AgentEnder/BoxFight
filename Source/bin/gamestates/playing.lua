playing = {}

function playing.load(map, var)
	love.graphics.setBackgroundColor(40,40,40)
	mapT = map
	gamestate = playing
	--Environment
	mapT.load()
	--player one
	player1.load()
	--player two
	player2.load(var, true)
	
end

function playing.update(dt)
	--player one
	if player1.jumpCount>0 then 
		player1.jumpCount = player1.jumpCount - 16*dt
	end
	player1.update(dt)
	--player two
	if player2.jumpCount> 0 then
		player2.jumpCount = player2.jumpCount - 16*dt
	end
	player2.update(dt)
	mapT.update(dt)
end

function playing.draw()
	player1.draw()
	player2.draw()
	mapT.draw()
end

function playing.keypressed(key)
	player1.keypressed(key)
	player2.keypressed(key)
	if key == "t" then print(player1.ability1barW) end
	if key == "f12" then menu.load() playing.load(mapT) end
	if key == "escape" then menu.load() end
	if key == "x" then
		if player1.isInvisible == true then 
			player1.invisibleToggle = true
			player1.isInvisible = false
		else
			player1.invisibleToggle = false
			player1.isInvisible = true 
		end
	end 
end

function playing.keyreleased(key)
	player1.keyreleased(key)
	player2.keyreleased(key)
end

function playing.mousepressed(x, y, button)

end

function playing.mousereleased(x, y, button)

end
