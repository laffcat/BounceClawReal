extends Node

onready var player = $"../Player"


## ## Manage player's active weapons


var weapons_left = []
var weapons_right = []
var wep_active_left : Weapon
var wep_active_right : Weapon

var wep_queue = []

var hud_new_active = false
var hud_hover_l = false
var hud_hover_r = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if hud_new_active:
		if hud_hover_l:
			if Input.is_action_just_released("menu_left"):
				player.hud_gun_root.remove_child(wep_queue[0])
				add_weapon(wep_queue[0])
				wep_queue.remove(0)
				if wep_queue.size():
					player.q.remove_child(wep_queue[0])
					player.hud_gun_root.add_child(wep_queue[0])
					wep_queue[0].global_transform = player.hud_gun_root.global_transform
				else:
					player.hud_new_gun.visible = false
					hud_new_active = false
				hud_hover_l = false
				hud_hover_r = false
				return
		else:
			if Input.is_action_just_pressed("menu_left"):
				hud_hover_l = true
		if hud_hover_r:
			if Input.is_action_just_released("menu_right"):
				player.hud_gun_root.remove_child(wep_queue[0])
				add_weapon(wep_queue[0], false)
				wep_queue.remove(0)
				if wep_queue.size():
					player.q.remove_child(wep_queue[0])
					player.hud_gun_root.add_child(wep_queue[0])
					wep_queue[0].global_transform = player.hud_gun_root.global_transform
				else:
					player.hud_new_gun.visible = false
					hud_new_active = false
				hud_hover_l = false
				hud_hover_r = false
				return
		else:
			if Input.is_action_just_pressed("menu_right"):
				hud_hover_r = true


func stage_weapon(wep : Weapon):
	if !wep_queue.size():
		player.hud_gun_root.add_child(wep)
		wep.global_transform = player.hud_gun_root.global_transform
		player.hud_new_gun.visible = true
		hud_new_active = true
	else:
		player.q.add_child(wep)
		wep.global_transform = player.q.global_transform
	wep_queue.append(wep)
	


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
