extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.set_text(_format_time())


func _start_time(s):
	$Timer.start(s)

func _check_time():
	return $Timer.time_left

func _format_time():
	var seconds = int($Timer.time_left)
	var secs = seconds % 60
	var mins = (seconds/60) % 60
	var hours = (seconds/60)/60
	return "%02d:%02d:%02d" % [hours, mins, secs]
	
