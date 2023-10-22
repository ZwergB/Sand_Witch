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
		var fake_press = InputEventAction.new()
		fake_press.action = "ui_accept"
		fake_press.pressed = true
		Input.parse_input_event(fake_press)
