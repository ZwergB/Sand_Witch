extends StaticBody2D
var active = true
var mouseInside = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible = active
	if mouseInside:
		if mouse_exited:
			mouseInside = false
	else:
		if mouse_entered:
			mouseInside = true
	if active:
		pass
	else:
		pass
