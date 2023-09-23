tool

class_name Pickup
extends Spatial

onready var my_item = $SpinPoint/wep_rail
onready var spin_point = $SpinPoint
onready var shadow = $Shadow

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	spin_point.rotate_y(5.0*delta)

func get_picked(body: Node):
	if body is Player:
		spin_point.remove_child(my_item)
		body.wep_mgr.add_weapon(my_item)
		yield(get_tree(), "idle_frame")
		shadow.queue_free()
		yield(get_tree(), "idle_frame")
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
