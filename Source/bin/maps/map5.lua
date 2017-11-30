map5 = {}
map5.player2x = 600
map5.player2y = 400
map5.player1x = 200
map5.player1y = 400
function map5.load()
	
	tiles = {
				{x = 0, y = 584, w = 800, h = 16, r = 255,g = 0,b = 0, string = "fire", special = true},
				{x = 0, y = 0, w = 20, h = 600, r = 255,g = 0,b = 0, string = "fire", special = true},
				{x = 780, y = 0, w = 20, h = 600, r = 255,g = 0,b = 0, string = "fire", special = true},
				{x = 200, y = 464, w = 400, h = 16, r = 255,g = 40,b = 60,string = "Rainbow Platform", special = true},
			}
end

function map5.update(dt)
	if player1.x+player1.width > 780 then player1.x = 780-player1.width end
	if player2.x+player2.width > 780 then player2.x = 480-player2.width end
	if player1.x < 20 then player1.x = 20 end
	if player2.x < 20 then player2.x = 20 end
	if tiles[4].r < 255 then
		tiles[4].r = tiles[4].r + love.math.random(0,10)
	else
		tiles[4].r = 0
	end
	if tiles[4].g < 255 then
		tiles[4].g = tiles[4].g + love.math.random(0,10)
	else
		tiles[4].g = 0
	end
	if tiles[4].b < 255 then
		tiles[4].b = tiles[4].b + love.math.random(0,10)
	else
		tiles[4].b = 0
	end
end

local function drawTile(x, y, w, h, r, g, b)
	love.graphics.setColor(r,g,b,255)
	love.graphics.rectangle("fill",x,y,w,h)
end

function map5.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )
	for k, v in pairs(tiles) do
		drawTile(v.x, v.y, v.w, v.h, v.r, v.g, v.b)
	end
	love.graphics.setColor(255,255,255)
end