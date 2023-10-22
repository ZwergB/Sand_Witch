extends Area2D

var amount = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if amount<=0:
		$Sprite2D.visible = false
	if amount>0:
		$Sprite2D.visible = true
	get_node("CollisionShape2D/Label").text = str(amount)

