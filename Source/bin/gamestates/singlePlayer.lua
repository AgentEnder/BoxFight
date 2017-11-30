singlePlayer = {}
cheats = false
if singlePlayer.difficulty == nil then
	singlePlayer.difficulty = 2
end
score = 0-1
player1.lives = 3
function singlePlayer.load(map, bool)
	if bool == true then
		score = score + 1
	end
	love.graphics.setBackgroundColor(40,40,40)
	mapT = map
	gamestate = singlePlayer
	--Environment
	mapT.load()
	--player one
	player1.load()
	--player two
	player2.load(true, false)
	
end

function singlePlayer.update(dt)
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
	if player2.sound == false then
		continue.possible = true
		if player1.x > 750 then
			local rand = love.math.random(0,1)
			local rand2 = love.math.random(0,1)
			if rand > 4/5 then
				rand = map2 
			elseif rand > 3/5 then
				rand = map1
			elseif rand > 2/5 then
				rand = map3
			elseif rand > 1/5 then
				rand = map4 
			else
				rand = map5
			end
			
			if rand2 > 2/3 then rand2 = ninja elseif rand2>1/3 then rand2 = standardClass else rand2 = knight end
			if score >= 5 then
				if score >= 10 then
					if score >= 15 then
						class.set(player1, ninja)
					else
					class.set(player1,standardClass)
					end
				else
				class.set(player1, ninja)
				end
			end
			if singlePlayer.difficulty == 1 then class.set(player2, standardClass)
			elseif singlePlayer.difficulty == 2 then class.set(player2, rand2)
			elseif singlePlayer.difficulty == 3 then class.set(player2, ninja) end
			singlePlayer.load(rand, true)
		end
	else
		continue.possible = false
	end
	if score%5 == 0 and complete == false and score ~= 0 then
		player1.lives = player1.lives + 1
		complete = true
		print("added life")
	elseif (score % 5) ~= 0 and score ~= 0 then 
		complete = false
	end
	if player1.lives <= 0 then
		if singlePlayer.difficulty == 1 then
			if score > highscore.easy then
				love.filesystem.write("sav.lua", "highscore.easy = " .. score .. " highscore.normal = " .. highscore.normal .. " highscore.hard = " .. highscore.hard )
			end
		elseif singlePlayer.difficulty == 2 then
			if score > highscore.normal then
				love.filesystem.write("sav.lua", "highscore.easy = " .. highscore.easy .. " highscore.normal = " .. score .. " highscore.hard = " .. highscore.hard )
			end
		elseif singlePlayer.difficulty == 3 then
			if score > highscore.hard then
				love.filesystem.write("sav.lua", "highscore.easy = " .. highscore.easy .. " highscore.normal = " .. highscore.normal .. " highscore.hard = " .. score )
			end
		end
		save = love.filesystem.load("sav.lua")
		save()
		death.load()
	end
end

function singlePlayer.draw()
	
	if continue.possible == true then
		love.graphics.draw(continue.img,800-128-40,300-32)
	end
	player1.draw()
	player2.draw()
	mapT.draw()
	love.graphics.print("score:" .. score,20, 600-20, 0, .5, .5)
	love.graphics.print("lives:" .. player1.lives,20, 600-40, 0, .5, .5)
end

function singlePlayer.keypressed(key)
	player1.keypressed(key)
	player2.keypressed(key)
	if key == "escape" then menu.load() end
	if key == "2" then player1.lives = 1 player1.health = .1 end
end

function singlePlayer.keyreleased(key)
	player1.keyreleased(key)
	player2.keyreleased(key)
end

function singlePlayer.mousepressed(x, y, button)

end

function singlePlayer.mousereleased(x, y, button)

end

