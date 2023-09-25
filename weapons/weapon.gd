class_name Weapon
extends Node

signal clock_finished

var mesh : MeshInstance
var clk = 0.0 # clock
var active = false
var shooting = false
var animation_player: AnimationPlayer


export var shot_speed: float
export var shot_num: int 
var shot_count = 0

export var time_cooldown: float
export var time_activate: float
export var time_deactivate: float
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

func _process(delta):
	if active:
		if clk > 0.0:
			clk -= delta
			if clk < 0.0:
				clk = 0.0
		else:
			emit_signal("clock_finished")

func shoot(target: Vector3):
	pass

func activate():
	active = true
	animation_player.play("activate")
	clk = time_activate

func deactivate():
	animation_player.play("deactivate")
	clk = time_activate
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
