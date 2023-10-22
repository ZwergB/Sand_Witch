extends StaticBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
   # This fakes a enter input and changes the scene
	if event is InputEventMouseButton:
		get_parent().global.changeScene()
