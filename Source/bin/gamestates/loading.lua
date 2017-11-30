loading = {}
continue = {}
BGM = {}
BGM.string = 2
function loading.load()
	love.graphics.setBackgroundColor(275,90,155)
	gamestate = loading
	player1 = {}
	player2 = {}
	attack1 = {}
	attack2 = {}
	explosion = {}
	sfxVolume = 1
	require("/bin/gamestates/playing")
	require("/bin/gamestates/menu")
	require("/bin/gamestates/singlePlayerMenu")
	require("/bin/gamestates/help")
	require("/bin/gamestates/levelSelect")
	require("/bin/gamestates/playerSelect")
	require("/bin/gamestates/singlePlayer")
	require("/bin/gamestates/death")
	require("/bin/gamestates/paused")
	require("/bin/gamestates/modeSelect")
	require("/bin/gamestates/options")
	require("/bin/playerFiles/player1")
	require("/bin/playerFiles/player2")
	require("/bin/collisionResponse")
	require("/bin/playerFiles/HUD")
	require("/bin/playerFiles/ai")
	require("/bin/playerFiles/Classes/classSystem")
	require("/bin/attack")
	require("/bin/newCollisions")
	image_play = love.graphics.newImage("resources/buttons/Play.png")
	image_bgmOne = love.graphics.newImage("resources/buttons/bgmOne.png")
	image_bgmOneOn = love.graphics.newImage("resources/buttons/bgmOne_on.png")
	image_bgmTwo = love.graphics.newImage("resources/buttons/bgmTwo.png")
	image_bgmTwoOn = love.graphics.newImage("resources/buttons/bgmTwo_on.png")
	--image_bgmThree = love.graphics.newImage("resources/buttons/bgmThree.png")
	--image_bgmThreeOn = love.graphics.newImage("resources/buttons/bgmThree_on.png")
	image_quit = love.graphics.newImage( "resources/buttons/Quit.png" )
	image_playOn = love.graphics.newImage("resources/buttons/Play_on.png")
	image_quitOn = love.graphics.newImage( "resources/buttons/Quit_on.png" )
	image_resume = love.graphics.newImage("resources/buttons/resume.png")
	image_resumeOn = love.graphics.newImage("resources/buttons/resume_on.png")
	image_options = love.graphics.newImage("resources/buttons/options.png")
	image_optionsOn = love.graphics.newImage("resources/buttons/options_on.png")
	image_menu = love.graphics.newImage("resources/buttons/menu.png")
	image_menuOn = love.graphics.newImage("resources/buttons/menu_on.png")
	image_help = love.graphics.newImage( "resources/buttons/help.png" )
	image_helpOn = love.graphics.newImage("resources/buttons/help_on.png")
	image_easy = love.graphics.newImage("resources/buttons/Easy.png")
	image_normal = love.graphics.newImage("resources/buttons/Normal.png")
	image_hard = love.graphics.newImage("resources/buttons/Hard.png")
	image_easyOn = love.graphics.newImage("resources/buttons/Easy_on.png")
	image_normalOn = love.graphics.newImage("resources/buttons/Normal_on.png")
	image_hardOn = love.graphics.newImage("resources/buttons/Hard_on.png")
	image_singlePlayer = love.graphics.newImage("resources/buttons/singlePlayer.png")
	image_multiplayer = love.graphics.newImage("resources/buttons/multiplayer.png")
	image_practice = love.graphics.newImage("resources/buttons/practice.png")
	image_singlePlayerOn = love.graphics.newImage("resources/buttons/singlePlayer_on.png")
	image_multiplayerOn = love.graphics.newImage("resources/buttons/multiplayer_on.png")
	image_practiceOn = love.graphics.newImage("resources/buttons/practice_on.png")
	image_defeat = love.graphics.newImage("resources/Defeat.png")
	image_slider = love.graphics.newImage("resources/buttons/sliders/slider.png")
	image_musicSlider = love.graphics.newImage("resources/buttons/sliders/music.png")
	image_sfxSlider = love.graphics.newImage("resources/buttons/sliders/sfx.png")
	image_map1 = love.graphics.newImage("resources/buttons/mapOneSelect.png")
	image_map1On = love.graphics.newImage( "resources/buttons/mapOneSelect_On.png" )
	image_map2 = love.graphics.newImage("resources/buttons/mapTwoSelect.png")
	image_map2On = love.graphics.newImage( "resources/buttons/mapTwoSelect_On.png" )
	image_map3 = love.graphics.newImage( "resources/buttons/mapThreeSelect.png" )
	image_map4 = love.graphics.newImage( "resources/buttons/mapFourSelect.png" )
	image_map5 = love.graphics.newImage( "resources/buttons/mapFiveSelect.png" )
	image_map3On = love.graphics.newImage("resources/buttons/mapThreeSelect_On.png")
	image_map4On = love.graphics.newImage("resources/buttons/mapFourSelect_On.png")
	image_map5On = love.graphics.newImage("resources/buttons/mapFiveSelect_On.png")
	continue.img = love.graphics.newImage("/resources/continue.png")
	attack1.sound = love.audio.newSource("/resources/Sound/SE/hit.wav", "static")
	attack2.sound = love.audio.newSource("/resources/Sound/SE/hit1.wav", "static")
	explosion.sound = love.audio.newSource("/resources/Sound/SE/explosion.wav", "static")
	missSound = love.audio.newSource("/resources/Sound/SE/miss.wav", "static")
	jumpSound = love.audio.newSource("/resources/Sound/SE/jump.wav", "static")
	consoleSound = love.audio.newSource("/resources/Sound/SE/correct.wav", "static")
	failSound = love.audio.newSource("/resources/Sound/SE/fail.wav", "static")
	BGM.sourceOne = love.audio.newSource("/resources/Sound/BigCarTheftLoop.wav", "stream")
	BGM.sourceTwo = love.audio.newSource("/resources/Sound/The_Village_Drums.wav", "stream")
	BGM.source = BGM.sourceOne
	BGM.source:setLooping(true)
	BGM.source:play()
	mapOne = require("/bin/maps/map1")
	mapTwo = require("/bin/maps/map2")
	mapThree = require("/bin/maps/map3")
	mapFour = require("/bin/maps/map4")
	mapFive = require("/bin/maps/map5")
end

function loading.update(dt)
	if loadTimer == nil then
		loadTimer = 0
		print("load success")
	end
	loadTimer = loadTimer + dt
	if loadTimer < 1 then 
		loadTxt = "Loading" 
	elseif loadTimer < 2 then
		loadTxt = "Loading."
	elseif loadTimer < 3 then
		loadTxt = "Loading.."
	elseif loadTimer < 4 then
		loadTxt = "Loading..."
	else
		loadTxt = "Almost There !"
	end
	if loadTimer >= 5 then menu.load() end
end

function loading.draw()
	love.graphics.setColor(255,255,255)
	love.graphics.print(loadTxt, 20, 20, 0, 1, 1)
end

function loading.keypressed(key)

end

function loading.keyreleased(key)

end

function loading.mousepressed(x, y, button)

end

function loading.mousereleased(x, y, button)

end