extends TextureProgress

var noWater = false
var empty = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_WaterTimer_timeout():
	if value <= 0:
		noWater = true
		empty = true
		$WaterTimer.stop()
		
	if !empty:
		value -= 50
		$WaterTimer.startTimer()
