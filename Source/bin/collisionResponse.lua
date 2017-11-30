function collisions(player, dt)
	if player == player1 then oPlayer = player2 end
	if player == player2 then oPlayer = player1 end
	mapT.collisions(player, dt)
	if player == player1 then oPlayer = player2 elseif player == player2 then oPlayer = player1 end --other Player setup
	if player.y < oPlayer.y+16 and player.y - 16 > oPlayer.y - 26 then
		if player.x + 8 > oPlayer.x - 8 then
			if player.x + 8 < oPlayer.x + 8 then
				player.x = player.x - 101*dt
			end
		end
		if player.x - 8 < oPlayer.x + 8 then
			if player.x - 8 > oPlayer.x - 8 then
				player.x = player.x + 101*dt
			end
		end
	end
end



