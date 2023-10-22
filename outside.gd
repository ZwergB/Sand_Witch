extends Node2D

@onready var global = get_parent()
@onready var time1 = $Timer1
@onready var time2 = $Timer2
@onready var background = $Sprite2D

@onready var collectable = [get_node("FlederWeg/PathFollow2D/Fledermaus"),get_node("FischWeg/PathFollow2D/Fisch")]
var numOfItems = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	background.frame = global.moonPhase
	if numOfItems>4:
		numOfItems=0
		global.moonPhase = (global.moonPhase+1)%4
		global.changeScene()

func _input(event):
	if event is InputEventMouseButton:
		var i = 0
		while i<collectable.size():
			if collectable[i].active:
				if event.pressed and collectable[i].mouseInside:
					collectable[i].active = false
					global.inventory[i] +=1
					numOfItems += 1
			i += 1

func _on_timer_1_timeout():
	if global.moonPhase == 0:
		moon0()
	if global.moonPhase == 1:
		moon1()
	if global.moonPhase == 2:
		moon2()
	if global.moonPhase == 3:
		moon3()


func _on_timer_2_timeout():
	var current = collectable[randi() %collectable.size()]
	current.age = 0
	
	current.sprite.frame = 0
	
	
	if global.moonPhase == 0:
		current.path.get_parent().position = current.noMoonPos
	if global.moonPhase == 1 or global.moonPhase == 3:
		current.path.get_parent().position = current.halfMoonPos
		current.path.scale = Vector2(-1, 1)
	if global.moonPhase == 2:
		current.path.get_parent().position = current.fullMoonPos
	current.active = true
	
func moon0():
	pass
	
func moon1():
	pass
	
func moon2():
	pass
	
func moon3():
	pass
	

