extends TextureProgress


var noFood = false
var empty = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	

func _on_FoodTimer_timeout():
	if value <= 0:
		noFood = true
		empty = true
		$FoodTimer.stop()
		
	if !empty:
		value -= 50
		$FoodTimer.startTimer()

