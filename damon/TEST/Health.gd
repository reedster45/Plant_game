extends TextureProgress

var noFood
var noWater
var seconds

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	check_Food_Water()


func check_Food_Water():
	if noFood:
		seconds = 4
		$HealthTimer.startTimer(seconds)


func _on_Food_Food_empty():
	noFood = true


func _on_Water_Water_empty():
	noWater = true


func _on_HealthTimer_timeDone(s):
	print("hey")
