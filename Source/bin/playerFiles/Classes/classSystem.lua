class = {}
require("/bin/playerFiles/Classes/standard")
require("/bin/playerFiles/Classes/ninja")
require("/bin/playerFiles/Classes/knight")
function class.set(player, class)
	player.speed = class.speed
	player.jumpHeight = class.jumpHeight
	player.maxhealth = class.maxhealth
	player.health = class.health
	player.class = class
	player.classStr = class.classStr
	player.dmg = class.dmg
	player.defense = class.defense
	player.width = class.width
	player.scale = class.scale
	player.r11 = class.r11
	player.r12 = class.r12
	player.l11 = class.l11
	player.l12 = class.l12
	player.r21 = class.r21
	player.r22 = class.r22
	player.l21 = class.l21
	player.l22 = class.l22
end
