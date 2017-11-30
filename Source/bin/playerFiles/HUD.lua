hud = {}

function hud.load(player)
	if player == player1 then
		player.hudX = 20
		player.hudY = 20
		player.hudDirection = "right"
	elseif player == player2 then
		player.hudX = 780
		player.hudY = 20
		player.hudDirection = "left"
	end
end

function hud.update(dt, player)
		player.ability1barW = ((20 - player.class.abilities[1](player))/20)*100
		player.ability2barW = ((20 - player.class.abilities[2](player))/20)*100
		if player.ability1barW == nil then player.ability1barW = 100 end
		if player.ability2barW == nil then player.ability2barW = 100 end
end

function hud.draw(player)
	love.graphics.setColor(255,0,0)
	if player.dead == false then
		if player == player1 then
			love.graphics.rectangle("fill",player.hudX,player.hudY,(player.health/player.maxhealth)*200,20)
			love.graphics.setColor(0,0,255)
			love.graphics.rectangle("fill",player.hudX,player.hudY+30,player1.ability1barW,20)
			love.graphics.rectangle("fill",player.hudX,player.hudY+60,player1.ability2barW,20)
		elseif player == player2 then
			love.graphics.rectangle("fill",player.hudX,player.hudY,0-(player.health/player.maxhealth)*200,20)
			love.graphics.setColor(0,0,255)
			love.graphics.rectangle("fill",player.hudX,player.hudY+30,0-player.ability1barW,20)
			love.graphics.rectangle("fill",player.hudX,player.hudY+60,0-player.ability2barW,20)
		end
	end
end