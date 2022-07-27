extends Timer

signal timeDone(s)

# Called when the node enters the scene tree for the first time.
func _ready():
	startTimer(4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_check_timeout()


func _check_timeout():
	if time_left <= 0:
		emit_signal("timeDone")


func startTimer(s):
	start(s)

