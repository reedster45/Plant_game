extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	startTimer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(time_left)

func startTimer():
	#$FoodTimer.set_wait_time(2)
	start(2)
