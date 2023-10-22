extends Node2D

@onready var global = get_parent()

@onready var ingrediantInstatce = [
	get_node("Ingredient Rückenflosse"),
	get_node("Ingredient Fledermausflügel"),
	get_node("Ingredient Spinnengift"),
	get_node("Ingredient Glühwürmchensekret"),
	get_node("Ingredient Froschschenkel"),
	get_node("Ingredient Mondblume"),
	get_node("Ingredient Blut")
]

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

func _input(event):
	if event is InputEventMouseButton:
		var i = 0
		while i<ingrediantInstatce.size():
			if ingrediantInstatce[i].amount>0:
				if event.pressed and ingrediantInstatce[i].mouseInside:
					global.inventory[i] -=1
			i += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var i = 0
	while i<7:
		ingrediantInstatce[i].amount = global.inventory[i]
		i +=1
