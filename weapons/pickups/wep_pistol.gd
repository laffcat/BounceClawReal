tool

extends Weapon

onready var top_mount = $TopMount
onready var barrel = $Barrel
onready var animation_player = $AnimationPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	mesh = $Light


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
