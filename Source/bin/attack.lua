 function attack(player,direction, atkType)
	if player == player1 then oPlayer = player2 else oPlayer = player1 end
	--Dmg Evaluation
	if atkType == 1 then
		atkDmg = player.dmg - oPlayer.defense
	elseif atkType == 2 then 
		atkDmg = player.dmg/2 - oPlayer.defense
		
	end
	if atkDmg <= 0 then atkDmg = 0 end
	
	--Knockback Code
	local function knockback(player,vel)
		if atkType == 2 then
			attack2.sound:play()
		end
		if atkType == 1 then
			attack1.sound:play()
		end
		if player.dead == false then
			if mapT ~= map5 then 
				player.x = player.x + vel*6
				player.y = player.y - math.abs(vel)*6
			else
				vel = vel*2
				player.x = player.x + vel*6
				player.y = player.y - math.abs(vel)*6
			end
		end
	end
	
	--Attack Code
	if oPlayer.dead == false then 
		print("AI attacking")
		if player == player1 then oPlayer = player2 elseif player == player2 then oPlayer = player1 end --other Player setup
		if direction == "left" then
			if player.y < oPlayer.y+16 and player.y - 16 > oPlayer.y - 26 then
				print("attack y correct")
				if player.x > oPlayer.x then
					if oPlayer.x + oPlayer.width + 16 > player.x then
						knockback(oPlayer, 0-2)
						oPlayer.health = oPlayer.health - atkDmg
						print(oPlayer.str .."HP remaining = " .. oPlayer.health)
					else
						playSound(missSound)
					end
				else
					playSound(missSound)
				end
			else
				playSound(missSound)
			end
		end
		if direction == "right" then
			if player.y < oPlayer.y+16 and player.y - 16 > oPlayer.y - 26 then
				if player.x < oPlayer.x then
					if oPlayer.x - 32 < player.x then
						knockback(oPlayer, 2)
						oPlayer.health = oPlayer.health - atkDmg
						print(oPlayer.str .."HP remaining = " .. oPlayer.health)
					else
						playSound(missSound)
					end
				else 
					playSound(missSound)
				end
			else
				playSound(missSound)
			end
		end
	end
end
