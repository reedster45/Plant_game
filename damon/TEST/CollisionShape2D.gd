extends CollisionShape2D
signal clicked(node)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("clicked", get_parent(), "_check_level")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	emit_signal("clicked", self)
	print("emit")
