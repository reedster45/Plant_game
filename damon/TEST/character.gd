extends KinematicBody2D


export var speed = 200
var velocity
var direction
var moving


# Called when the node enters the scene tree for the first time.
func _ready():
	direction = "down"
	moving = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	check_idle()


func _physics_process(_delta):
	movement_input()
	velocity = move_and_slide(velocity)
	





func check_idle():
	if moving:
		$AnimatedSprite.play(direction)
	else:
		$AnimatedSprite.frame = 0


func movement_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		direction = "right"
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		direction = "left"
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		direction = "down"
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		direction = "up"
	
	moving = true
	velocity = velocity.normalized() * speed
	
	if !Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_up") && !Input.is_action_pressed("ui_down"):
		moving = false
