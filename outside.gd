extends Node2D

@onready var global = get_parent()
@onready var time1 = $Timer1
@onready var time2 = $Timer2
@onready var background = $Sprite2D

@onready var collectable = [
get_node("FischWeg/PathFollow2D/Fisch"),
get_node("FlederWeg/PathFollow2D/Fledermaus"),
get_node("SpinnenWeg/PathFollow2D/Spider"),
get_node("GluewuremchenWeg/PathFollow2D/Gluewuermchen"),
get_node("FroschWeg/PathFollow2D/Frosch"),
get_node("BlumenWeg/PathFollow2D/Blume")
]

@onready var clickSound = $itemClicked

var used = false
var numOfItems = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	background.frame = global.moonPhase
	if global.moonPhase == 2 and !used:
		spawn(collectable[5])
		used=true
	if global.moonPhase != 2:
		used = false
	if numOfItems>4:
		numOfItems=0
		global.moonPhase = (global.moonPhase+1)%4
		global.inventory[6] +=1
		global.changeScene()
		
	if ($ambientSound.playing != global.musicPlaying):
		$ambientSound.playing = global.musicPlaying
	

func _input(event):
	if event is InputEventMouseButton:
		var i = 0
		while i<collectable.size():
			if collectable[i].active:
				if event.pressed and collectable[i].mouseInside:
					collectable[i].active = false
					global.inventory[i] +=1
					numOfItems += 1
					clickSound.playing = true;
			i += 1

func _on_timer_1_timeout():
	var current = collectable[randi()%2+3]
	spawn(current)

func _on_timer_2_timeout():
	var current = collectable[randi()%3]
	spawn(current)
	
	
func spawn(current):
	current.age = 0
	current.sprite.frame = 0
	if global.moonPhase == 0:
		current.path.get_parent().position = current.noMoonPos
	if global.moonPhase == 1 or global.moonPhase == 3:
		current.path.get_parent().position = current.halfMoonPos
	if global.moonPhase == 2:
		current.path.get_parent().position = current.fullMoonPos
	current.active = true
	

