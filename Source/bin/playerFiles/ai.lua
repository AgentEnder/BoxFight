ai = {}
local timer = 0
local jumptimer = 0
local randtimer = 0
local timer2 = 0
local direction = "left"
function ai.movement(player, dt)
	if mapT == map1 or mapT == map2 then
		timer = timer + dt
		if player.dead == false then
			if player == player1 then oPlayer = player elseif player == player then oPlayer = player1 end --other Player setup
			local prob = love.math.random(1,500)
			--left&right
			
			if oPlayer.isInvisible == false then
				if timer < .2 or timer > 1 then
					if prob > 300 then
						if oPlayer.x < player.x then
							player.direction = "left"
							player.anim = "left"
						end
						if oPlayer.x > player.x then
							player.direction = "right" 
							player.anim = "right"
						end
					end
					if timer > 1 then 
						timer = 0
					end
				end
			
				--jumps
				jumptimer = jumptimer - dt
				if player.y > oPlayer.y + 16 then Jump(player) end
			end
			if oPlayer.isInvisible == true then
				if jumptimer < 0 then 
					Jump(player)
					jumptimer = love.math.random(3,20) 
				end
				
				local rand = love.math.random(0,1000)
				if player.x < 0 then
					player.direction = "right" 
					player.anim = "right"
				elseif player.x + 16 >= 800 then
					player.direction = "left"
					player.anim = "left"
				end
				if timer < .001 or timer > 1 then
					if rand >=(1000/3)*2 then 
						player.direction = "right" 
						player.anim = "right"
					elseif rand >= 1000/3 then  
						player.direction = "left"
						player.anim = "left"
					else
						print("working")
					end
					if timer > 1 then timer = 0 end
				end
			end
		else
			if jumptimer < 0 then 
				Jump(player)
				jumptimer = love.math.random(3,20) 
			end
			
			local rand = love.math.random(0,1000)
			if player.x < 0 then
				player.direction = "right" 
				player.anim = "right"
			elseif player.x + 16 >= 800 then
				player.direction = "left"
				player.anim = "left"
			end
			if timer < .001 or timer > 1 then
				if rand >=(1000/3)*2 then 
					player.direction = "right" 
					player.anim = "right"
				elseif rand >= 1000/3 then  
					player.direction = "left"
					player.anim = "left"
				else
					print("working")
				end
				if timer > 1 then timer = 0 end
			end
		end
	else -- NEW SYSTEM
		timer = timer + dt
		if player.dead == false then
			if player == player1 then oPlayer = player elseif player == player then oPlayer = player1 end --other Player setup
			local prob = love.math.random(1,500)
			--left&right
			
			if oPlayer.isInvisible == false then
				if timer < .2 or timer > 1 then
					if prob > 400 then
						if oPlayer.x < player.x then
							direction = "left"
							player.anim = direction
						end
						if oPlayer.x > player.x then
							direction = "right"
							player.anim = "right"
						end
					end
					if timer > 1 then 
						timer = 0
					end
				end
				if direction == "left" and player.collisions.left == false then player.x = player.x - dt*player.speed end
				if direction == "right" and player.collisions.right == false then player.x = player.x + dt*player.speed end
				if direction ~= nil then
					player.anim = direction
				end
				--jumps
				if player.collisions.left == true and direction == "left" then 
					if oPlayer.x < player.x+8 then
						timer2 = timer2 + dt
						if timer2 > 1 then
							Jump(player)
							timer2 = 0	
						end
					end
				end
				if player.collisions.right == true and direction == "right" then 
					if oPlayer.x > player.x+8 then
						timer2 = timer2 + dt
						if timer2 > 1 then
							Jump(player)
							timer2 = 0	
						end
					end
				end
				
				if player.jumping == true then
					if player.collisions.top ~= true then player.y = player.y - 50*player.jumpTimer*dt else player.jumping = false end
					if player.jumpTimer <= 0 then player.jumping = false end
					player2.jumpTimer = player2.jumpTimer - 3*dt
				end
				if player.y > oPlayer.y + 16 then Jump(player) end
			end
			jumptimer = jumptimer - dt
			if oPlayer.isInvisible == true then
				if jumptimer < 0 then 
					Jump(player)
					jumptimer = love.math.random(3,20) 
				end
				
				local rand = love.math.random(0,1000)
				if player.x < 0 then
					player.direction = "right" 
					player.anim = "right"
				elseif player.x + 16 >= 800 then
					player.direction = "left"
					player.anim = "left"
				end
				if timer < .001 or timer > 1 then
					if rand >=(1000/3)*2 then 
						player.direction = "right" 
						player.anim = "right"
					elseif rand >= 1000/3 then  
						player.direction = "left"
						player.anim = "left"
					else
						print("working")
					end
					if timer > 1 then timer = 0 end
				end
			end
		else
			if jumptimer < 0 then 
				Jump(player)
				jumptimer = love.math.random(3,20) 
			end
			
			local rand = love.math.random(0,1000)
			if player.x < 0 then
				player.direction = "right" 
				player.anim = "right"
			elseif player.x + 16 >= 800 then
				player.direction = "left"
				player.anim = "left"
			end
			if timer < .001 or timer > 1 then
				if rand >=(1000/3)*2 then 
					player.direction = "right" 
					player.anim = "right"
				elseif rand >= 1000/3 then  
					player.direction = "left"
					player.anim = "left"
				else
					print("working")
				end
				if timer > 1 then timer = 0 end
			end
		end
	end
end

function ai.attack(player, dt)
	if mapT == map1 or mapT == map2 then
		if player.dead == false then
			if player == player1 then oPlayer = player elseif player == player then oPlayer = player1 end --other Player setup
			if oPlayer.isInvisible == false then
				if player.y < oPlayer.y+32 and player.y - 16 > oPlayer.y - 42 then
					if player.x + 8 > oPlayer.x - 16 then
						if player.x + 8 < oPlayer.x + 16 then
							local willattack = love.math.random(0,300)
							if willattack < 100 then
								return
							elseif willattack < 200 and willattack >= 100 then 
								attack(player,player.direction, 1)
							elseif willattack > 300 then 
								attack(player,player.direction, 2)
							end
						end
					end
					if player.x - 8 < oPlayer.x + 16 then
						if player.x - 8 > oPlayer.x - 16 then
							local willattack = love.math.random(0,300)
							if willattack < 100 then
								return
							elseif willattack < 200 and willattack >= 100 then 
								attack(player,player.direction, 1)
							elseif willattack > 300 then 
								attack(player,player.direction, 2)
							end
						end
					end
				end
			end
		end
	else --New Code
		if player.dead == false then
			if player == player1 then oPlayer = player elseif player == player then oPlayer = player1 end --other Player setup
		local direction = player.anim
			if player.y + player.width*2 > oPlayer.y + oPlayer.width/2 then
				if direction == "right" then
					if oPlayer.x >player.x+8 then
						if	player.x+player.width+16 > oPlayer.x then
							local willattack = love.math.random(0,300)
							if willattack < 100 then
								return
							elseif willattack < 200 and willattack >= 100 then 
								attack(player,player.anim, 1)
							elseif willattack > 300 then 
								attack(player,player.anim, 2)
							end
						end
					end
				else
					if oPlayer.x + oPlayer.width < player.x+8 then
						if	player.x-16 < oPlayer.x + oPlayer.width then
							local willattack = love.math.random(0,300)
							if willattack < 100 then
								return
							elseif willattack < 200 and willattack >= 100 then 
								attack(player,player.anim, 1)
							elseif willattack > 300 then 
								attack(player,player.anim, 2)
							end
						end
					end
				end
			end
		end
	end
end
