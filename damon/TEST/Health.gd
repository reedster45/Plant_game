extends TextureProgress

var seconds
var steps

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	check_Food_Water()


# find out better system for nowater nofood/water nofood/food nowater)
# empty/noFood/noWater variables?
func check_Food_Water():
	if $Food.empty && $Water.empty && !$Food.noFood && !$Water.noWater:
		seconds = 4
		steps = 25
		$HealthTimer.startTimer(seconds)
		$Food.empty = false
		$Water.empty = false
	elif $Food.noFood:
		seconds = 10
		steps = 1
		$HealthTimer.startTimer(seconds)
		$Food.noFood = false
	elif $Water.noWater:
		seconds = 5
		steps = 1
		$HealthTimer.startTimer(seconds)
		$Water.noWater = false
		


func _on_HealthTimer_timeout():
	print("start")
	value -= steps
	$HealthTimer.startTimer(seconds)
