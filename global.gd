extends Node2D

class Potion:
	var recipe = [0,0]
	var color
	var potionName = ""
	var index
	func _init(_recipe,_color, _potionName, _index):
		recipe = _recipe
		color = _color
		potionName = _potionName
		index = _index

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

var musicPlaying = true;

var ingredients = [
	Ingredient.new(0,[0,-3],"Rückenflosse einer Rotfeder"), 
	Ingredient.new(1,[0,-2],"Fledermausflügel"), 
	Ingredient.new(2,[2,-2],"Giftdrüse einer Schwarzen Witwe"),
	Ingredient.new(3,[2,3],"Glühwürmchen Sekret"),  
	Ingredient.new(4,[-2,0],"Froschschenkel eines Grasfrosches"),
	Ingredient.new(5,[0,0],"Mondblume"), 
	Ingredient.new(6,[4,-1],"Blut")]


var potion_list = [
Potion.new([0, -15], [41, 37, 245], "", 0),
Potion.new([0, -14], [1, 61, 247], "", 1),
Potion.new([0, -13], [3, 168, 255], "", 2),
Potion.new([-2, -12], [0, 222, 243], "", 3),
Potion.new([-2, -11], [0, 230, 194], "", 4),
Potion.new([-2, -10], [0, 229, 195], "", 5),
Potion.new([-4, -9], [0, 232, 152], "", 6),
Potion.new([-4, -8], [27, 233, 109], "", 7),
Potion.new([-4, -7], [21, 243, 106], "", 8),
Potion.new([-6, -6], [23, 243, 93], "", 9),
Potion.new([-6, -5], [19, 236, 69], "", 10),
Potion.new([-8, -3], [15, 230, 48], "", 11),
Potion.new([-8, -2], [15, 230, 39], "", 12),
Potion.new([-10, 0], [13, 229, 34], "", 13),
Potion.new([2, -14], [74, 15, 255], "", 14),
Potion.new([2, -13], [39, 13, 255], "", 15),
Potion.new([0, -12], [13, 80, 233], "", 16),
Potion.new([0, -11], [0, 160, 212], "", 17),
Potion.new([0, -10], [2, 213, 206], "", 18),
Potion.new([-2, -9], [4, 227, 170], "", 19),
Potion.new([-2, -8], [6, 231, 151], "", 20),
Potion.new([-2, -7], [11, 243, 107], "", 21),
Potion.new([-4, -6], [34, 242, 104], "", 22),
Potion.new([-4, -5], [39, 246, 96], "", 23),
Potion.new([-6, -4], [37, 243, 80], "", 24),
Potion.new([-6, -3], [35, 239, 66], "", 25),
Potion.new([-6, -2], [35, 238, 61], "", 26),
Potion.new([-8, 0], [34, 237, 59], "", 27),
Potion.new([4, -13], [102, 0, 255], "", 28),
Potion.new([2, -12], [70, 0, 255], "", 29),
Potion.new([2, -11], [32, 10, 219], "", 30),
Potion.new([2, -10], [11, 88, 204], "", 31),
Potion.new([0, -9], [6, 185, 218], "", 32),
Potion.new([0, -8], [0, 223, 160], "", 33),
Potion.new([0, -7], [24, 226, 168], "", 34),
Potion.new([-2, -6], [47, 236, 116], "", 35),
Potion.new([-2, -5], [58, 246, 100], "", 36),
Potion.new([-4, -4], [64, 251, 100], "", 37),
Potion.new([-4, -3], [63, 252, 90], "", 38),
Potion.new([-4, -2], [60, 247, 78], "", 39),
Potion.new([-4, -1], [57, 245, 72], "", 40),
Potion.new([-6, 0], [56, 242, 70], "", 41),
Potion.new([4, -12], [115, 12, 253], "", 42),
Potion.new([4, -11], [118, 0, 246], "", 43),
Potion.new([4, -10], [99, 0, 235], "", 44),
Potion.new([2, -9], [43, 55, 227], "", 45),
Potion.new([2, -8], [6, 154, 224], "", 46),
Potion.new([0, -6], [13, 200, 181], "", 47),
Potion.new([0, -5], [59, 215, 175], "", 48),
Potion.new([-2, -4], [78, 235, 128], "", 49),
Potion.new([-2, -3], [87, 245, 108], "", 50),
Potion.new([-2, -2], [92, 254, 109], "", 51),
Potion.new([-2, -1], [89, 255, 100], "", 52),
Potion.new([-4, 0], [81, 253, 83], "", 53),
Potion.new([-4, 1], [77, 250, 70], "", 54),
Potion.new([-6, 3], [73, 247, 62], "", 55),
Potion.new([6, -12], [139, 0, 230], "", 56),
Potion.new([6, -11], [118, 0, 227], "", 57),
Potion.new([4, -9], [123, 0, 231], "", 58),
Potion.new([2, -7], [101, 8, 219], "", 59),
Potion.new([2, -6], [57, 77, 212], "", 60),
Potion.new([2, -5], [42, 156, 193], "", 61),
Potion.new([0, -4], [71, 211, 124], "", 62),
Potion.new([0, -3], [93, 221, 108], "", 63),
Potion.new([0, -2], [121, 239, 125], "", 64),
Potion.new([0, -1], [126, 251, 131], "", 65),
Potion.new([-2, 0], [120, 255, 120], "", 66),
Potion.new([-2, 1], [106, 254, 96], "", 67),
Potion.new([-2, 3], [99, 254, 74], "", 68),
Potion.new([-4, 3], [96, 253, 60], "", 69),
Potion.new([6, -10], [134, 2, 225], "", 70),
Potion.new([4, -8], [127, 0, 233], "", 71),
Potion.new([4, -7], [149, 3, 224], "", 72),
Potion.new([4, -6], [149, 0, 202], "", 73),
Potion.new([4, -5], [148, 27, 208], "", 74),
Potion.new([2, -4], [159, 106, 184], "", 75),
Potion.new([2, -3], [160, 206, 74], "", 76),
Potion.new([2, -2], [136, 236, 104], "", 77),
Potion.new([2, -1], [165, 234, 141], "", 78),
Potion.new([0, 0], [169, 247, 146], "", 79),
Potion.new([0, 1], [158, 253, 137], "", 80),
Potion.new([0, 2], [138, 251, 107], "", 81),
Potion.new([0, 3], [125, 253, 78], "", 82),
Potion.new([-2, 6], [122, 253, 61], "", 83),
Potion.new([8, -11], [126, 0, 221], "", 84),
Potion.new([6, -9], [127, 1, 223], "", 85),
Potion.new([6, -8], [148, 5, 211], "", 86),
Potion.new([6, -7], [183, 0, 185], "", 87),
Potion.new([6, -6], [214, 0, 176], "", 88),
Potion.new([4, -4], [213, 61, 112], "", 89),
Potion.new([4, -3], [214, 175, 48], "", 90),
Potion.new([4, -2], [207, 219, 93], "", 91),
Potion.new([2, 0], [209, 231, 122], "", 92),
Potion.new([2, 1], [210, 244, 132], "", 93),
Potion.new([2, 2], [195, 251, 124], "", 94),
Potion.new([2, 3], [172, 251, 97], "", 95),
Potion.new([0, 4], [156, 254, 69], "", 96),
Potion.new([0, 6], [151, 255, 54], "", 97),
Potion.new([8, -10], [124, 0, 219], "", 98),
Potion.new([8, -9], [161, 3, 202], "", 99),
Potion.new([8, -8], [171, 0, 205], "", 100),
Potion.new([8, -7], [188, 5, 185], "", 101),
Potion.new([6, -5], [209, 0, 136], "", 102),
Potion.new([6, -4], [200, 26, 28], "", 103),
Potion.new([6, -3], [218, 133, 43], "", 104),
Potion.new([6, -2], [226, 200, 77], "", 105),
Potion.new([4, -1], [234, 228, 88], "", 106),
Potion.new([4, 0], [234, 243, 102], "", 107),
Potion.new([4, 1], [218, 251, 100], "", 108),
Potion.new([4, 2], [195, 254, 78], "", 109),
Potion.new([2, 4], [181, 255, 56], "", 110),
Potion.new([2, 6], [176, 255, 44], "", 111),
Potion.new([10, -10], [164, 0, 195], "", 112),
Potion.new([10, -9], [179, 0, 204], "", 113),
Potion.new([10, -8], [195, 0, 202], "", 114),
Potion.new([8, -6], [196, 0, 135], "", 115),
Potion.new([8, -5], [198, 6, 45], "", 116),
Potion.new([8, -4], [209, 32, 12], "", 117),
Potion.new([8, -3], [218, 89, 24], "", 118),
Potion.new([6, -1], [235, 155, 40], "", 119),
Potion.new([6, 0], [235, 203, 58], "", 120),
Potion.new([6, 1], [249, 232, 64], "", 121),
Potion.new([4, 3], [248, 252, 54], "", 122),
Potion.new([4, 4], [228, 254, 43], "", 123),
Potion.new([4, 5], [213, 253, 45], "", 124),
Potion.new([4, 6], [205, 254, 51], "", 125),
Potion.new([12, -9], [185, 6, 219], "", 126),
Potion.new([12, -8], [191, 0, 189], "", 127),
Potion.new([10, -7], [197, 0, 147], "", 128),
Potion.new([10, -6], [196, 4, 77], "", 129),
Potion.new([10, -5], [203, 22, 15], "", 130),
Potion.new([10, -4], [212, 45, 3], "", 131),
Potion.new([8, -2], [216, 83, 14], "", 132),
Potion.new([8, -1], [225, 134, 20], "", 133),
Potion.new([8, 0], [239, 184, 29], "", 134),
Potion.new([6, 2], [252, 215, 38], "", 135),
Potion.new([6, 3], [254, 243, 40], "", 136),
Potion.new([6, 4], [238, 253, 38], "", 137),
Potion.new([4, 7], [221, 255, 44], "", 138),
Potion.new([2, 9], [212, 255, 52], "", 139),
Potion.new([14, -8], [197, 5, 204], "", 140),
Potion.new([12, -7], [199, 0, 142], "", 141),
Potion.new([12, -6], [203, 0, 77], "", 142),
Potion.new([12, -5], [200, 15, 21], "", 143),
Potion.new([10, -3], [207, 43, 0], "", 144),
Potion.new([10, -2], [219, 65, 1], "", 145),
Potion.new([10, -1], [221, 89, 6], "", 146),
Potion.new([8, 1], [230, 125, 0], "", 147),
Potion.new([8, 2], [245, 161, 0], "", 148),
Potion.new([8, 3], [255, 195, 14], "", 149),
Potion.new([6, 5], [255, 230, 28], "", 150),
Potion.new([6, 6], [249, 249, 37], "", 151),
Potion.new([6, 7], [234, 255, 49], "", 152),
Potion.new([4, 9], [223, 255, 56], "", 153),
Potion.new([16, -7], [196, 0, 138], "", 154),
Potion.new([14, -7], [204, 0, 82], "", 155),
Potion.new([14, -5], [212, 4, 36], "", 156),
Potion.new([14, -4], [209, 30, 7], "", 157),
Potion.new([12, -4], [212, 64, 0], "", 158),
Potion.new([12, -3], [222, 86, 2], "", 159),
Potion.new([12, -1], [232, 103, 1], "", 160),
Potion.new([10, 0], [247, 132, 0], "", 161),
Potion.new([10, 1], [252, 151, 0], "", 162),
Potion.new([10, 3], [255, 182, 12], "", 163),
Potion.new([8, 4], [255, 218, 28], "", 164),
Potion.new([8, 5], [253, 244, 45], "", 165),
Potion.new([8, 7], [244, 255, 58], "", 166),
Potion.new([6, 9], [234, 255, 64], "", 167),
Potion.new([18, -6], [199, 2, 81], "", 168),
Potion.new([16, -6], [210, 1, 40], "", 169),
Potion.new([16, -4], [221, 17, 20], "", 170),
Potion.new([14, -3], [216, 46, 10], "", 171),
Potion.new([14, -2], [217, 83, 0], "", 172),
Potion.new([12, 0], [226, 103, 0], "", 173),
Potion.new([12, 1], [238, 114, 2], "", 174),
Potion.new([12, 2], [255, 134, 1], "", 175),
Potion.new([10, 4], [254, 151, 14], "", 176),
Potion.new([10, 5], [255, 175, 27], "", 177),
Potion.new([10, 6], [255, 207, 42], "", 178),
Potion.new([8, 8], [252, 235, 57], "", 179),
Potion.new([8, 9], [248, 252, 71], "", 180),
Potion.new([6, 12], [245, 254, 75], "", 181),
Potion.new([18, -1], [205, 4, 59], "", 182),
Potion.new([16, -2], [211, 4, 22], "", 183),
Potion.new([14, 0], [219, 23, 7], "", 184),
Potion.new([16, 3], [217, 57, 5], "", 185),
Potion.new([14, 2], [223, 97, 0], "", 186),
Potion.new([12, 4], [235, 116, 0], "", 187),
Potion.new([14, 7], [243, 119, 7], "", 188),
Potion.new([12, 6], [254, 133, 18], "", 189),
Potion.new([10, 8], [253, 154, 27], "", 190),
Potion.new([12, 11], [255, 174, 39], "", 191),
Potion.new([10, 10], [252, 202, 55], "", 192),
Potion.new([8, 10], [250, 227, 69], "", 193),
Potion.new([8, 12], [250, 247, 80], "", 194),
Potion.new([10, 15], [250, 253, 84], "", 195)
]

var inventory = [0,0,0,0,0,0,0]

@export var moonPhase = 0

var day = false

var collection = [
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0],
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
			add_child(nightScene)
		else:
			if Input.is_action_just_pressed("ui_accept"):
				changeScene()
		

	if Input.is_action_pressed("mute"):
		_on_mute_button_pressed();
	
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


func _on_mute_button_pressed():
	musicPlaying = !musicPlaying;

