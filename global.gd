extends Node2D
class Potion:
	var index = 0
	var succeeded = false
	var recepy = [0,0]
	var color
	var potionName = ""

class Ingredient:
	var index = 0
	var position = [0,0]
	var ingredientName = ""

var ingredients = [Ingredient.new(), Ingredient.new(), Ingredient.new(), 
Ingredient.new(), Ingredient.new()]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
