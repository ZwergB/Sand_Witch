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

@onready var dayScene = load("res://inside1.tscn").instantiate()
@onready var nightScene = load("res://outside.tscn").instantiate()

var ingredients = [
	Ingredient.new(0,[0,-3],"Rückenflosse einer Rotfeder"), 
	Ingredient.new(1,[0,-2],"Fledermausflügel"), 
	Ingredient.new(2,[2,-2],"Giftdrüse einer Schwarzen Witwe"),
	Ingredient.new(3,[2,3],"Glühwürmchen Sekret"),  
	Ingredient.new(4,[-2,0],"Froschschenkel eines Grasfrosches"),
	Ingredient.new(5,[0,0],"Mondblume"), 
	Ingredient.new(6,[4,-1],"Blut")]

var potion_list = [
	Potion.new([0, -15], 0, ""),
	Potion.new([0, -14], 1, ""),
	Potion.new([0, -13], 2, ""),
	Potion.new([-2, -12], 3, ""),
	Potion.new([-2, -11], 4, ""),
	Potion.new([-2, -10], 5, ""),
	Potion.new([-4, -9], 6, ""),
	Potion.new([-4, -8], 7, ""),
	Potion.new([-4, -7], 8, ""),
	Potion.new([-6, -6], 9, ""),
	Potion.new([-6, -5], 10, ""),
	Potion.new([-8, -3], 11, ""),
	Potion.new([-8, -2], 12, ""),
	Potion.new([-10, 0], 13, ""),
	Potion.new([2, -14], 14, ""),
	Potion.new([2, -13], 15, ""),
	Potion.new([0, -12], 16, ""),
	Potion.new([0, -11], 17, ""),
	Potion.new([0, -10], 18, ""),
	Potion.new([-2, -9], 19, ""),
	Potion.new([-2, -8], 20, ""),
	Potion.new([-2, -7], 21, ""),
	Potion.new([-4, -6], 22, ""),
	Potion.new([-4, -5], 23, ""),
	Potion.new([-6, -4], 24, ""),
	Potion.new([-6, -3], 25, ""),
	Potion.new([-6, -2], 26, ""),
	Potion.new([-8, 0], 27, ""),
	Potion.new([4, -13], 28, ""),
	Potion.new([2, -12], 29, ""),
	Potion.new([2, -11], 30, ""),
	Potion.new([2, -10], 31, ""),
	Potion.new([0, -9], 32, ""),
	Potion.new([0, -8], 33, ""),
	Potion.new([0, -7], 34, ""),
	Potion.new([-2, -6], 35, ""),
	Potion.new([-2, -5], 36, ""),
	Potion.new([-4, -4], 37, ""),
	Potion.new([-4, -3], 38, ""),
	Potion.new([-4, -2], 39, ""),
	Potion.new([-4, -1], 40, ""),
	Potion.new([-6, 0], 41, ""),
	Potion.new([4, -12], 42, ""),
	Potion.new([4, -11], 43, ""),
	Potion.new([4, -10], 44, ""),
	Potion.new([2, -9], 45, ""),
	Potion.new([2, -8], 46, ""),
	Potion.new([0, -6], 47, ""),
	Potion.new([0, -5], 48, ""),
	Potion.new([-2, -4], 49, ""),
	Potion.new([-2, -3], 50, ""),
	Potion.new([-2, -2], 51, ""),
	Potion.new([-2, -1], 52, ""),
	Potion.new([-4, 0], 53, ""),
	Potion.new([-4, 1], 54, ""),
	Potion.new([-6, 3], 55, ""),
	Potion.new([6, -12], 56, ""),
	Potion.new([6, -11], 57, ""),
	Potion.new([4, -9], 58, ""),
	Potion.new([2, -7], 59, ""),
	Potion.new([2, -6], 60, ""),
	Potion.new([2, -5], 61, ""),
	Potion.new([0, -4], 62, ""),
	Potion.new([0, -3], 63, ""),
	Potion.new([0, -2], 64, ""),
	Potion.new([0, -1], 65, ""),
	Potion.new([-2, 0], 66, ""),
	Potion.new([-2, 1], 67, ""),
	Potion.new([-2, 3], 68, ""),
	Potion.new([-4, 3], 69, ""),
	Potion.new([6, -10], 70, ""),
	Potion.new([4, -8], 71, ""),
	Potion.new([4, -7], 72, ""),
	Potion.new([4, -6], 73, ""),
	Potion.new([4, -5], 74, ""),
	Potion.new([2, -4], 75, ""),
	Potion.new([2, -3], 76, ""),
	Potion.new([2, -2], 77, ""),
	Potion.new([2, -1], 78, ""),
	Potion.new([0, 0], 79, ""),
	Potion.new([0, 1], 80, ""),
	Potion.new([0, 2], 81, ""),
	Potion.new([0, 3], 82, ""),
	Potion.new([-2, 6], 83, ""),
	Potion.new([8, -11], 84, ""),
	Potion.new([6, -9], 85, ""),
	Potion.new([6, -8], 86, ""),
	Potion.new([6, -7], 87, ""),
	Potion.new([6, -6], 88, ""),
	Potion.new([4, -4], 89, ""),
	Potion.new([4, -3], 90, ""),
	Potion.new([4, -2], 91, ""),
	Potion.new([2, 0], 92, ""),
	Potion.new([2, 1], 93, ""),
	Potion.new([2, 2], 94, ""),
	Potion.new([2, 3], 95, ""),
	Potion.new([0, 4], 96, ""),
	Potion.new([0, 6], 97, ""),
	Potion.new([8, -10], 98, ""),
	Potion.new([8, -9], 99, ""),
	Potion.new([8, -8], 100, ""),
	Potion.new([8, -7], 101, ""),
	Potion.new([6, -5], 102, ""),
	Potion.new([6, -4], 103, ""),
	Potion.new([6, -3], 104, ""),
	Potion.new([6, -2], 105, ""),
	Potion.new([4, -1], 106, ""),
	Potion.new([4, 0], 107, ""),
	Potion.new([4, 1], 108, ""),
	Potion.new([4, 2], 109, ""),
	Potion.new([2, 4], 110, ""),
	Potion.new([2, 6], 111, ""),
	Potion.new([10, -10], 112, ""),
	Potion.new([10, -9], 113, ""),
	Potion.new([10, -8], 114, ""),
	Potion.new([8, -6], 115, ""),
	Potion.new([8, -5], 116, ""),
	Potion.new([8, -4], 117, ""),
	Potion.new([8, -3], 118, ""),
	Potion.new([6, -1], 119, ""),
	Potion.new([6, 0], 120, ""),
	Potion.new([6, 1], 121, ""),
	Potion.new([4, 3], 122, ""),
	Potion.new([4, 4], 123, ""),
	Potion.new([4, 5], 124, ""),
	Potion.new([4, 6], 125, ""),
	Potion.new([12, -9], 126, ""),
	Potion.new([12, -8], 127, ""),
	Potion.new([10, -7], 128, ""),
	Potion.new([10, -6], 129, ""),
	Potion.new([10, -5], 130, ""),
	Potion.new([10, -4], 131, ""),
	Potion.new([8, -2], 132, ""),
	Potion.new([8, -1], 133, ""),
	Potion.new([8, 0], 134, ""),
	Potion.new([6, 2], 135, ""),
	Potion.new([6, 3], 136, ""),
	Potion.new([6, 4], 137, ""),
	Potion.new([4, 7], 138, ""),
	Potion.new([2, 9], 139, ""),
	Potion.new([14, -8], 140, ""),
	Potion.new([12, -7], 141, ""),
	Potion.new([12, -6], 142, ""),
	Potion.new([12, -5], 143, ""),
	Potion.new([10, -3], 144, ""),
	Potion.new([10, -2], 145, ""),
	Potion.new([10, -1], 146, ""),
	Potion.new([8, 1], 147, ""),
	Potion.new([8, 2], 148, ""),
	Potion.new([8, 3], 149, ""),
	Potion.new([6, 5], 150, ""),
	Potion.new([6, 6], 151, ""),
	Potion.new([6, 7], 152, ""),
	Potion.new([4, 9], 153, ""),
	Potion.new([16, -7], 154, ""),
	Potion.new([14, -7], 155, ""),
	Potion.new([14, -5], 156, ""),
	Potion.new([14, -4], 157, ""),
	Potion.new([12, -4], 158, ""),
	Potion.new([12, -3], 159, ""),
	Potion.new([12, -1], 160, ""),
	Potion.new([10, 0], 161, ""),
	Potion.new([10, 1], 162, ""),
	Potion.new([10, 3], 163, ""),
	Potion.new([8, 4], 164, ""),
	Potion.new([8, 5], 165, ""),
	Potion.new([8, 7], 166, ""),
	Potion.new([6, 9], 167, ""),
	Potion.new([18, -6], 168, ""),
	Potion.new([16, -6], 169, ""),
	Potion.new([16, -4], 170, ""),
	Potion.new([14, -3], 171, ""),
	Potion.new([14, -2], 172, ""),
	Potion.new([12, 0], 173, ""),
	Potion.new([12, 1], 174, ""),
	Potion.new([12, 2], 175, ""),
	Potion.new([10, 4], 176, ""),
	Potion.new([10, 5], 177, ""),
	Potion.new([10, 6], 178, ""),
	Potion.new([8, 8], 179, ""),
	Potion.new([8, 9], 180, ""),
	Potion.new([6, 12], 181, ""),
	Potion.new([18, -1], 182, ""),
	Potion.new([16, -2], 183, ""),
	Potion.new([14, 0], 184, ""),
	Potion.new([16, 3], 185, ""),
	Potion.new([14, 2], 186, ""),
	Potion.new([12, 4], 187, ""),
	Potion.new([14, 7], 188, ""),
	Potion.new([12, 6], 189, ""),
	Potion.new([10, 8], 190, ""),
	Potion.new([12, 11], 191, ""),
	Potion.new([10, 10], 192, ""),
	Potion.new([8, 10], 193, ""),
	Potion.new([8, 12], 194, ""),
	Potion.new([10, 15], 195, "")
]

var inventory = [0,0,0,0,0,0,0]

@export var moonPhase = 0

var day = false

var collection = [
[],
[],
[],
[],
[],
[],
[],
[],
[],
[],
[],
[],
[],
[],
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _input(InputEvent):
	
	if InputEvent is InputEventMouseButton or InputEvent is InputEventKey:		
		if Input.is_action_pressed("ui_cancel"):
				get_tree().quit()
				
		if(get_node_or_null("title") != null):
			remove_child($title)
		else:
			if Input.is_action_just_pressed("ui_accept"):
				changeScene()
		



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func changeScene():
	if day:
		remove_child($inside1)
		add_child(nightScene)
	else:
		remove_child($outside)
		add_child(dayScene)
	day = !day
