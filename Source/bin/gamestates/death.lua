death = {}



function death.load()
	gamestate = death
end

function death.update(dt)

end

function death.draw()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(image_defeat, 0, 0, 0, 1, 1)
	love.graphics.setColor(178,178,178)
	if singlePlayer.difficulty == 1 then
		love.graphics.print(highscore.easy, 400+20,300-30)
	elseif singlePlayer.difficulty == 2 then
		love.graphics.print(highscore.normal, 500-30,200, 0, 1.55, 1.55)
	elseif singlePlayer.difficulty == 3 then
		love.graphics.print(highscore.hard, 400+20,300-30)
	end
end

function death.keypressed(key)
	if key == "escape" then
		menu.load()
	end
	if key == "enter" then
	
	end
end

function death.keyreleased(key)

end

function death.mousepressed(x, y, button, istouch)
	score = 0
	if button == 1 then
		player1.lives = 3
		score = 0
		singlePlayer.load(map1, false)
	end
end 

function death.mousereleased(x, y, button)

end
