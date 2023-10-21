extends Node2D

@onready var global = get_parent()
@onready var time1 = $Timer1
@onready var time2 = $Timer2
@onready var background = $Sprite2D

@onready var collectable = [$Fledermaus]

var moonPhase
# Called when the node enters the scene tree for the first time.
func _ready():
	moonPhase = global.moonPhase
	background.frame = moonPhase

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		var i = 0
		while i<collectable.size():
			if collectable[i].active:
				if event.pressed and collectable[i].mouseInside:
					collectable[i].active = false
					global.inventory[i] +=1
			i += 1

func _on_timer_1_timeout():
	if moonPhase == 0:
		moon0()
	if moonPhase == 1:
		moon1()
	if moonPhase == 2:
		moon2()
	if moonPhase == 3:
		moon3()


func _on_timer_2_timeout():
	collectable[randi() %collectable.size()].active = true
	
func moon0():
	pass
	
func moon1():
	pass
	
func moon2():
	pass
	
func moon3():
	pass
	

