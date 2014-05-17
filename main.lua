--createEnvironment
environment = {}
--createPlayers
player1 = {}
player2 = {}
require("/bin/player1")
require("/bin/player2")
require("/bin/environment")

function love.load()
	love.graphics.setBackgroundColor(40,40,40)
	--player one
	player1.load()
	--player two
	player2.load()
	--Environment
	environment.load()
end

function love.update(dt)
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
	--Environment
end

function love.draw()
	player1.draw()
	player2.draw()
	environment.draw()
end

function love.keypressed(key, unicode)
	player1.keypressed(key)
	player2.keypressed(key)
	
	if key == "z" then print(player1.x) end
	if key == "x" then print(player1.y) end
	if key == "c" then print(player1.jump) end
end

function love.keyreleased(key, unicode)
	player1.keyreleased(key)
	player2.keyreleased(key)
end

function love.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
end






function Jump(player)
	print (player.jump)
	if player.inAir == false then
		player.jump = 5
	end
end