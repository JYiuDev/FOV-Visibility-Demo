extends TileMap
@export var shader_white: Material

# Called when the node enters the scene tree for the first time.
func _ready():
	#changeMat(shader_white)
	pass

# Called every frame. 'delta' is the elapsed time sinpass # Replace with function body.ce the previous frame.
func _process(_delta):
	pass


func changeMat(mat: Material):
	material = mat
