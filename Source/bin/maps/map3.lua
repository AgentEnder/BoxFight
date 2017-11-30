map3 = {}
map3.player2x = 800-40
map3.player2y = 600-80
map3.player1x = 40
map3.player1y = 600-80
function map3.load()
	
	tiles = {
				{x = 0, y = 560, w = 800, h = 40, r = 255,g = 40,b = 60, string = "floor"},
				{x = 0, y = 0, w = 20, h = 600, r = 255,g = 40,b = 60, string = "left wall"},
				{x = 780, y = 0, w = 20, h = 600, r = 255,g = 40,b = 60, string = "right wall"},
				{x = 400-64, y = 560-64, w = 128, h = 32, r = 255,g = 40,b = 60, string = "platform"},
				{x = 400-128, y = 560-32, w = 256, h = 32, r = 255,g = 40,b = 60, string = "platform2"},
				{x = 400-32, y = 560-96, w = 64, h = 32, r = 255,g = 40,b = 60, string = "platform2"},
				{x = 400-64, y = 200, w = 128, h = 64, r = 255,g = 40,b = 60, string = "Rainbow Platform", special = true},
			}
end

function map3.update(dt)
	if player1.x+player1.width > 780 then player1.x = 780-player1.width end
	if player2.x+player2.width > 780 then player2.x = 780-player2.width end
	if player1.x < 20 then player1.x = 20 end
	if player2.x < 20 then player2.x = 20 end
	if tiles[7].r < 255 then
		tiles[7].r = tiles[7].r + love.math.random(0,10)
	else
		tiles[7].r = 0
	end
	if tiles[7].g < 255 then
		tiles[7].g = tiles[7].g + love.math.random(0,10)
	else
		tiles[7].g = 0
	end
	if tiles[7].b < 255 then
		tiles[7].b = tiles[7].b + love.math.random(0,10)
	else
		tiles[7].b = 0
	end
end

local function drawTile(x, y, w, h, r, g, b)
	love.graphics.setColor(r,g,b,255)
	love.graphics.rectangle("fill",x,y,w,h)
end

function map3.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )
	for k, v in pairs(tiles) do
		drawTile(v.x, v.y, v.w, v.h, v.r, v.g, v.b)
	end
	love.graphics.setColor(255,255,255)
end