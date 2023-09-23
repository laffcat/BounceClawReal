extends Node

onready var player = $"../Player"


## ## Manage player's active weapons


var weapons_left = []
var weapons_right = []
var wep_active_left : Weapon
var wep_active_right : Weapon


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_weapon(wep : Weapon, left = true):
	var pwnage : Transform   ;   var pwner : Node
	
	if left: # Equip left
		var shpee = weapons_left.size()
		if shpee: # If we have left side weapons,
			pwnage = weapons_left[shpee-1].top_mount.global_transform
			pwner = weapons_left[shpee-1].top_mount
		else: # If not,
			pwnage = player.base.wep_l.global_transform
			pwner = player.base.wep_l
		weapons_left.append(wep)
	
	else: # Equip right
		var shpee = weapons_right.size()
		if shpee: # If we have right side weapons,
			pwnage = weapons_right[shpee-1].top_mount.global_transform
			pwner = weapons_right[shpee-1].top_mount
		else: # if not,
			pwnage = player.base.wep_r.global_transform
			pwner = player.base.wep_r
		weapons_right.append(wep)
		
	pwner.add_child(wep)
	wep.global_transform = pwnage


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
