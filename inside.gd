extends Node2D

var cauldron


func pour_item(index):
	if(get_parent().inventory[index] > 0):
		get_parent().invetory[index] -= 1
		

# Called when the node enters the scene tree for the first time.
func _ready():
	var ingredients = get_parent().ingredients
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
