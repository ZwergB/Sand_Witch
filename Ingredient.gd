extends Area2D
var mouseInside = false
var amount = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	self.mouse_entered.connect(_mouse_enter)
	self.mouse_exited.connect(_mouse_exit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if amount<=0:
		$Sprite2D.visible = false
	if amount>0:
		$Sprite2D.visible = true
	get_node("CollisionShape2D/Label").text = str(amount)

func _mouse_enter():
	mouseInside = true
func _mouse_exit():
	mouseInside = false
