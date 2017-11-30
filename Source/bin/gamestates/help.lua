help = {}
function help.load()
	gamestate = help
	helpScreen = love.graphics.newImage("/resources/help.png")
end

function help.update(dt)
	
end

function help.draw()
	love.graphics.draw(helpScreen, 200, 0, 0, 1,1,0,0,0)
end

function help.mousepressed()
	menu.load()
end

function help.mousereleased()

end

function help.keypressed(key)
	if key == "escape" then
		menu.load()
	end
end
function help.keyreleased(key)
end