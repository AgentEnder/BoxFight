options = {}
inConsole = false
consoleStr = ""
key = "error"
musicSliderX = 518
sfxSliderX = 518
function options.load()
	gamestate = options
	love.graphics.setBackgroundColor( 190, 190, 190 )
	if BGM.string == 1 then
		songImg = image_bgmOne
		songImgOn = image_bgmOneOn
	end
	if BGM.string == 2 then
		songImg = image_bgmTwo
		songImgOn = image_bgmTwoOn
	end
	if BGM.string == 3 then
		songImg = image_bgmThree
		songImgOn = image_bgmThreeOn
	end
	
end

local function drawButton(off, on, x, y, w, h, mx, my)
	local ins = insideBox(mx, my, x - (w/2), y-(h/2), w, h)
	
	love.graphics.setColor(255,255,255,255)
	
	
	if ins then
		love.graphics.draw(on, x, y, 0 , 1, 1, w/2, h/2)
	else
		love.graphics.draw(off, x, y, 0 , 1, 1, w/2, h/2)
	end
end

function options.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )
	for k, v in pairs(buttons) do
		drawButton(v.imgOff, v.imgOn, v.x, v.y, v.w, v.h, x, y)
	end
end

function options.update(dt)
	if BGM.string == 2 then
		songImg = image_bgmOne
		songImgOn = image_bgmOneOn
		if BGM.source ~= BGM.sourceOne then
			BGM.source:stop()
			BGM.source = BGM.sourceOne
		end
	end
	if BGM.string == 1 then
		songImg = image_bgmTwo
		songImgOn = image_bgmTwoOn
		if BGM.source ~= BGM.sourceTwo then
			BGM.source:stop()
			BGM.source = BGM.sourceTwo
		end
	end
	if BGM.string == 3 then
		songImg = image_bgmThree
		songImgOn = image_bgmThreeOn
	end
	if not BGM.source:isPlaying() then
		BGM.source:play()
	end
	buttons = 	{
				{imgOn = songImgOn, imgOff = songImg, x = 400, y = 300 - 128, w = 256, h = 64, action = "difficulty"},
				{imgOn = image_musicSlider, imgOff = image_musicSlider, x = 400, y = 300 + 128, w = 256, h = 64, action = "quit"},
				{imgOn = image_sfxSlider, imgOff = image_sfxSlider, x = 400, y = 300, w = 256, h = 64, action = "play"},
				{imgOn = image_slider, imgOff = image_slider, x = musicSliderX, y = 300 + 128, w = 20, h = 64, action = "musicSlider"},
				{imgOn = image_slider, imgOff = image_slider, x = sfxSliderX, y = 300, w = 20, h = 64, action = "sfxSlider"}
				}
end

function options.focus(bool)
end

function options.keypressed( key, unicode )
	if inConsole == false then
		if key == "escape" then menu.load() end
		if key == "9" then playSound(attack2.sound) end
		if key == "0" then playSound(attack1.sound) end
		if key == "`" then inConsole = true end
	else
		console.keypressed(key)
	end
end

function options.keyreleased( key, unicode )
	
end

function options.mousepressed( x, y, button )
	if button == 1 then
		for k, v in pairs(buttons) do
			local ins = insideBox(x, y, v.x - (v.w/2), v.y-(v.h/2), v.w, v.h)
			
			if ins then
				if v.action == "play" then
					sfxSliderX = x
					sfxVolume = ((sfxSliderX-262)/256)
					print(sfxVolume)
				elseif v.action == "quit" then
					musicSliderX = x
					BGM.source:setVolume((musicSliderX-262)/256)
					print(BGM.source:getVolume())
				elseif v.action == "difficulty" then
					if BGM.string < 2 then
						BGM.string = BGM.string + 1
					else
						BGM.string = 1
					end
					print(singlePlayer.difficulty)
				end
			end
		end
	end
end

function options.mousereleased( x, y, button )
end

function options.quit()
end

function insideBox( px, py, x, y, wx, wy )
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	end
	return false
end