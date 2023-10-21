extends Node2D

@onready var global = get_parent()
@onready var time1 = $Timer1
@onready var time2 = $Timer2
@onready var background = $Sprite2D

var moonPhase
# Called when the node enters the scene tree for the first time.
func _ready():
	moonPhase = global.moonPhase
	background.frame = moonPhase

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


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
	pass # Replace with function body.
	
func moon0():
	pass
	
func moon1():
	pass
	
func moon2():
	pass
	
func moon3():
	pass
	

