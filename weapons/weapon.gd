tool
class_name Weapon
extends Node

var mesh : MeshInstance
var proj : PackedScene
#export var screen_color: Color setget screen_color_set
#
#func screen_color_set(new_color: Color):
#	screen_color = new_color
#	mesh.set("material/1/shader_param/screen_color", new_color)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func shoot(target: Vector3):
	var gaming = proj.new()
	#gaming.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
