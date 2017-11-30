enemy = {}
enemy.classStr = "Select Now!"
enemy.isAi = true

function enemy.load()
	enemy.x = 800-40
	enemy.y = 600-80
	enemy.dead = false
	enemy.respawnTimer = 0 
	enemy.direction = nil
	enemy.jump = 0
	enemy.jumpCount = 0
	enemy.inAir = true
	enemy.isDead = false
	enemy.str = " player 2"
	if enemy.class == nil then class.set(enemy, standardClass) end
	enemy.class.respawn(enemy)
	--Hud
	hud.load(enemy)
	--Animation
	enemy.animtimer = 0
	enemy.animnum = 0
	enemy.anim = "left"
	--effects
	enemy.isInvisible = false
end

function enemy.update(dt)
	ai.movement(enemy, dt)
	local  prob = love.math.random(1,3)
	if prob > 1.5 then
		ai.attack(enemy, dt)
	end
	
	--Collisions
	collisions(enemy,dt)
	--Movement
	if enemy.inAir == true then
		enemy.gravityTimer = 2
		if enemy.gravityTimer < 10  then
			enemy.gravityTimer = 2*dt+enemy.gravityTimer
		end
		if enemy.y < 600-40+16 then
			enemy.y = enemy.y + (32*enemy.gravityTimer)*dt*5
		else
			enemy.y = 600-40+16
		end
	else
		if enemy.jump < 0 then
			enemy.jump = 0
		end
		enemy.gravityTimer = 2
		enemy.y = enemy.y
	end
	if enemy.jump > 0 then
		if mapT.environmentalCollision_platformOne(enemy)== "top" then
			enemy.jump=0
		end
		enemy.jump = enemy.jump-3*dt
		enemy.y = enemy.y - ((enemy.jump*16 + 32)*dt)*5
	end
	
	--Respawn
	if enemy.health <= 0 then
		enemy.direction = nil
		if enemy.isDead == nil or player.isDead == false then
			explosion.sound:play()
		end
		enemy.dead = true
		
		enemy.respawnTimer = enemy.respawnTimer + dt
		if enemy.respawnTimer > 1 then
			enemy.isDead = true
		end
	end
	
	--Hud
	hud.update(dt, enemy)

	--Animation
	enemy.animtimer = enemy.animtimer + 2*dt
	if enemy.animtimer > 1 then
		enemy.animnum = enemy.animnum + 1
		enemy.animtimer = 0
	end
	if enemy.animnum > 1 then enemy.animnum = 0 end
end

function enemy.draw()
	love.graphics.setColor(255,255,255)
	if enemy.isDead == false then
		if enemy.isInvisible == false then
			if enemy.animnum == 0 then
				if enemy.anim == "right" then
					love.graphics.draw(enemy.r21, enemy.x-8, enemy.y-16)
				elseif enemy.anim == "left" then
					love.graphics.draw(enemy.l21, enemy.x-8, enemy.y-16)
				end
			end
			if enemy.animnum == 1 then
				if enemy.anim == "right" then
					love.graphics.draw(enemy.r22, enemy.x-8, enemy.y-16)
				elseif enemy.anim == "left" then
					love.graphics.draw(enemy.l22, enemy.x-8, enemy.y-16)
				end
			end
		end
	end
	hud.draw(enemy)
end

function enemy.keypressed(key)

end

function enemy.keyreleased(key)

end