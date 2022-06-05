extends StaticBody2D


var level_progress = 0
var mouse_in = false
var on_feed = false
var phases = ["empty", "sprout", "sapling"]
var curr_phase = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$Phase.text = "seed"
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_check_level()
	_check_feed()
	_check_progress()
	_feed_plant()




# reveal/hide plant stats on mouse click
func _check_level():
	if Input.is_action_just_released("mouse") and mouse_in:
		if $ProgressBar.visible == false:
			$ProgressBar.visible = true
			$Phase.visible = true
		else:
			$ProgressBar.visible = false
			$Phase.visible = false

# check if feed button or timer should be displayed
func _check_feed():
	if $ProgressBar.visible == true:
		if $Timer._check_time() == 0:
			$Button.visible = true
			$Timer.visible = false
			# reset timer
		else:
			$Timer.visible = true
			$Button.visible = false
	else:
		$Button.visible = false
		$Timer.visible = false
		
		
	
func _check_progress():
	$ProgressBar.value = level_progress
	if level_progress >= 100:
		level_progress -= 100
		curr_phase += 1
		# error if animation non-existent or end of phases array
		$AnimatedSprite.animation = phases[curr_phase]
		$Phase.text = phases[curr_phase]

func _feed_plant():
	if Input.is_action_just_released("mouse") and on_feed:
		level_progress += 27
		on_feed = false
		$Timer._start_time(5)
		$Timer.visible = true
		$Button.visible = false


# detect mouse on plant hitbox
func _on_Plant_mouse_entered():
	mouse_in = true

func _on_Plant_mouse_exited():
	mouse_in = false

# detect mouse on feed button
func _on_Button_mouse_entered():
	on_feed = true

func _on_Button_mouse_exited():
	on_feed = false
