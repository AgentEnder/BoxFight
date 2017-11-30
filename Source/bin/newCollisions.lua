function newCollisions(obj, dt)
	checkTiles(obj, dt)
	tileResponse(obj, dt, {})
	if obj == player1 then oPlayer = player2 end
	if obj == player2 then oPlayer = player1 end
	if obj == player1 then oPlayer = player2 elseif player == player2 then oPlayer = player1 end --other Player setup
	if obj.y < oPlayer.y+16 and obj.y - 16 > oPlayer.y - 26 then
		if obj.x + 8 > oPlayer.x - 8 then
			if obj.x + 8 < oPlayer.x + 8 then
				obj.x = obj.x - 101*dt
			end
		end
		if obj.x - 8 < oPlayer.x + 8 then
			if obj.x - 8 > oPlayer.x - 8 then
				obj.x = obj.x + 101*dt
			end
		end
	end
end

function checkTiles(obj, dt)
	local collision = {left = false, right = false, bottom = false, top = false}
	--left side
	for k, v in pairs(tiles) do
		if insideBox(obj.x-1,obj.y+1,v.x,v.y,v.w,v.h) or insideBox(obj.x-1,obj.y+(obj.width-1),v.x,v.y, v.w, v.h) or insideBox(obj.x-1,obj.y+(obj.width/2),v.x,v.y,v.w,v.h) then
			collision.left = true
			tileResponse(obj, dt, v)
		--	print("left:" .. v.string)
		end
	end
	--right side
	for k, v in pairs(tiles) do
		if insideBox(obj.x+obj.width+1,obj.y+1,v.x,v.y, v.w,v.h) or insideBox(obj.x+obj.width+1,obj.y+(obj.width - 1),v.x,v.y, v.w, v.h) or insideBox(obj.x+obj.width+1,obj.y+(obj.width/2),v.x,v.y, v.w,v.h)then
			collision.right = true
			tileResponse(obj, dt, v)
		print("right:" .. v.string)
		end
	end
	--bottom
	for k, v in pairs(tiles) do
		if insideBox(obj.x+(obj.width-2),obj.y+obj.width+1,v.x,v.y, v.w, v.h) or insideBox(obj.x+2,obj.y+obj.width+1,v.x,v.y, v.w, v.h) or insideBox(obj.x+(obj.width/2),obj.y+obj.width+1,v.x,v.y, v.w, v.h) then
			collision.bottom = true
			tileResponse(obj, dt, v)
		--	print(v.string)
		end
	end
	--top
	for k, v in pairs(tiles) do
		if insideBox(obj.x+(obj.width-2),obj.y-1,v.x,v.y,v.w,v.h) or insideBox(obj.x+2,obj.y-1,v.x,v.y, v.w, v.h) then
			collision.top = true
			tileResponse(obj, dt, v)
		--	print("top")
		end
	end
	--returns
	obj.collisions.left = collision.left
	obj.collisions.right = collision.right
	obj.collisions.top = collision.top
	obj.collisions.bottom = collision.bottom
end

function tileResponse(obj,dt,v)
	if v.special ~= nil then
		if v.string == "Rainbow Platform" then
			if obj.collisions.bottom == true then
				obj.health = obj.maxhealth
			end
		elseif v.string == "fire" then
			if mapT ~= map5 then
				obj.health = obj.health - 5*dt
			else
				obj.health = obj.health - 200*dt
			end
		end
	end
	if obj.collisions.top == true then obj.y = obj.y+2 obj.jumptimer = 2 end
	if obj.collisions.bottom == true then if v.string ~= "fire" then obj.jumps = 0 end end
	if obj.collisions.left == true then obj.x = obj.x + obj.speed*dt end
	if obj.collisions.right == true then obj.x = obj.x - obj.speed*dt end
end

function insideBox( px, py, x, y, wx, wy )
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	end
	return false
end