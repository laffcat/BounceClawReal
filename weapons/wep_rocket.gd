extends Weapon

onready var top_mount = $TopMount
onready var barrel = $Barrel
var proj : PackedScene

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player = $AnimationPlayer
	mesh = $Light
	proj = preload("res://weapons/projectiles/proj_bullet.tscn")

func shoot(target: Vector3 = Vector3.UP):
	animation_player.play("shoot")
	var pew = proj.instance()
	pew.global_transform = barrel.global_transform
	#pew.global_rotation = pew.global_position.angle_to(target)
	clk = time_cooldown + rand_range(0.0, 0.2)
	
