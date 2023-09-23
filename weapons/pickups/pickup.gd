#tool

class_name Pickup
extends Spatial

onready var my_item = $SpinPoint/wep
onready var spin_point = $SpinPoint
onready var shadow = $Shadow
#onready var tween = Tween.new()

var props = Vector2(.16, .34)
var returning = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#item_bob()



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
		


#func item_bob():
#	var shpee : float # starting value
#	var shpoat : float # ending value
#
#	if returning:
#		returning = false
#		shpee = props.x
#		shpoat = props.y
#	else:
#		returning = true
#		shpee = props.y
#		shpoat = props.x
#
#	tween.interpolate_property(spin_point, "translation:y",
#			shpee, shpoat, 1,
#			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
#	tween.interpolate_property(shadow, "mesh:size",
#			Vector2(shpoat, shpoat), Vector2(shpee, shpee), 1,
#			Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
			
#func _on_tween_completed(object, key):
#	item_bob()
