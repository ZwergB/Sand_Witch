extends Node2D

@onready var ingredients = get_parent().ingredients

var cauldron = []
var cauldron_colour = [0,0]


func pour_item(index):
	if(get_parent().inventory[index] > 0):
		get_parent().inventory[index] -= 1
		cauldron.append(index)
		update_colour()

func update_colour():
	for i in cauldron:
		cauldron_colour[0] += get_parent().ingredients[i].position[0]
		cauldron_colour[1] += get_parent().ingredients[i].position[1]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
