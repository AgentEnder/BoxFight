map4 = {}
map4.player2x = 800-40
map4.player2y = 600-80
map4.player1x = 40
map4.player1y = 600-80
function map4.load()
	tiles = {
				{x = 0, y = 560, w = 800, h = 40, r = 255,g = 40,b = 60, string = "floor"},
				{x = 0, y = 0, w = 20, h = 600, r = 255,g = 40,b = 60, string = "left wall"},
				{x = 780, y = 0, w = 20, h = 600, r = 255,g = 40,b = 60, string = "right wall"},
				{x = 400-64, y = 560-64, w = 64, h = 16, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 400, y = 560-64, w = 64, h = 16, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 400-64, y = 560-48, w = 16, h = 16, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 400+48, y = 560-48, w = 16, h = 16, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 400-48, y = 560-128, w = 48, h = 16, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 400, y = 560-128, w = 48, h = 16, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 400-48, y = 560-128+16, w = 16, h = 16, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 400+32, y = 560-128+16, w = 16, h = 16, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 400-8, y = 560-128-16, w = 16, h = 16, r = 255,g = 0,b = 0, string = "fire", special = true},
				--[[{x = 780, y = 0, w = 20, h = 600, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 780, y = 0, w = 20, h = 600, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 780, y = 0, w = 20, h = 600, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 780, y = 0, w = 20, h = 600, r = 255,g = 40,b = 60, string = "16tile"},
				{x = 780, y = 0, w = 20, h = 600, r = 255,g = 40,b = 60, string = "16tile"}]]--
			}
end

function map4.update(dt)
	if player1.x+player1.width > 780 then player1.x = 780-player1.width end
	if player2.x+player2.width > 780 then player2.x = 780-player2.width end
	if player1.x < 20 then player1.x = 20 end
	if player2.x < 20 then player2.x = 20 end
end

local function drawTile(x, y, w, h, r, g, b)
	love.graphics.setColor(r,g,b,255)
	love.graphics.rectangle("fill",x,y,w,h)
end

function map4.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )
	for k, v in pairs(tiles) do
		drawTile(v.x, v.y, v.w, v.h, v.r, v.g, v.b)
	end
	love.graphics.setColor(255,255,255)
end