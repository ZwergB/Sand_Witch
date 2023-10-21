extends Node2D

class Potion:
	var recipe = [0,0]
	var color
	var potionName = ""
	func _init(_recipe,_color, _potionName):
		recipe = _recipe
		color = _color
		potionName = _potionName

class Ingredient:
	var index = 0
	var position = [0,0]
	var ingredientName = ""
	func _init(_index,_position,_ingredientName):
		index = _index
		position = _position
		ingredientName = _ingredientName

var ingredients = [Ingredient.new(0,[2,3],"Glühwürmchen Sekret"), 
Ingredient.new(1,[4,-1],"Blut"), 
Ingredient.new(2,[0,0],"Mondblume"), 
Ingredient.new(3,[0,-3],"Rückenflosse einer Rotfeder"), 
Ingredient.new(4,[0,-2],"Fledermausflügel"), 
Ingredient.new(5,[2,-2],"Giftdrüse einer Schwarzen Witwe"), 
Ingredient.new(6,[-2,0],"Froschschenkel eines Grasfrosches")]

var potions = []

var inventory = [0,0,0,0,0,0,0]

var moonPhase = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
