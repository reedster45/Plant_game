extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	startTimer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func startTimer():
	start(1)
