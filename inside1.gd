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
var ingrediantCount = 0

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
					cauldron_colour[0] += global.ingredients[i].position[0]
					cauldron_colour[1] += global.ingredients[i].position[1]
					ingrediantCount += 1
					trankKessel(getPotion(cauldron_colour).color)
							
					
			i += 1

func  trankKessel(c):
	$PotionColor.set_modulate(Color(c[0]/255.01,c[1]/255.01,c[2]/255.01))  

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var i = 0
	while i<7:
		ingrediantInstatce[i].amount = global.inventory[i]
		i +=1
	if ($ambientSound.playing != global.musicPlaying):
			$ambientSound.playing = global.musicPlaying
	if ingrediantCount>=5:
		var finalPotion = getPotion(cauldron_colour)
		global.collection[finalPotion.index/14][finalPotion.index%14] = 1
		openPotionbook(finalPotion)
		ingrediantCount = 0
		cauldron_colour = [0,0]
		trankKessel(getPotion(cauldron_colour).color)
		global.changeScene()


func openPotionbook(potion):
	pass

func getPotion(recipy):
	for potion in global.potion_list:
		if cauldron_colour == potion.recipe:
			return potion
