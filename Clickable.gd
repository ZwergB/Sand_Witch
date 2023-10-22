extends StaticBody2D
var active = false
var mouseInside = false
var age = 0

@export var lifetime = 0
@export var fullMoonPos = Vector2(0,0)
@export var halfMoonPos = Vector2(0,0)
@export var noMoonPos = Vector2(0,0)
@export var speed = 0

@onready var sprite = $AnimatedSprite2D
@onready var path = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("default")
	self.mouse_entered.connect(_mouse_enter)
	self.mouse_exited.connect(_mouse_exit)

func _mouse_enter():
	mouseInside = true
func _mouse_exit():
	mouseInside = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible = active
	if active:
		if age<lifetime:
			age += 1
		else:
			active = false
			age = 0
		path.progress += speed
	else:
		path.progress = 0

