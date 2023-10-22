extends Node2D

@onready var global = get_parent()
@onready var color = $PotionColors
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
					cauldron_colour += global.ingredients[i].position
					for potion in global.potion_list:
						if cauldron_colour == potion.recipe:
							trank(potion.color)
					
			i += 1

func  trank(c):
	var o = -72
	while o<33:
		var p = -190
		while p<200:
			p += 1
			color.set_cell(0,color.local_to_map(Vector2i(p,o)),1,Vector2i(c%14,int(c/14)),0)
		o += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var i = 0
	while i<7:
		ingrediantInstatce[i].amount = global.inventory[i]
		if ($ambientSound.playing != global.musicPlaying):
			$ambientSound.playing = global.musicPlaying
		i +=1



func openPotionbook():
	pass

