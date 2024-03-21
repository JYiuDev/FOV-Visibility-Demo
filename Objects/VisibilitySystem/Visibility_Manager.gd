extends Node
class_name VisibilityManager

"""
Visibility system node
Main responsibity is to contain references for white masked map and lit map subviewports
"""

@export var visible_map: TileMap
@export var lightmask_viewport: SubViewport
@export var shader_white: Material
@export var litview_viewport: SubViewport
var level_mananger: LevelManager

# Called when the node enters the scene tree for the first time.
func _ready():
	# Setup level manager 
	var level_manager = get_node("/root").get_child(0)
	if level_manager is LevelManager:
		print("true")
	
	# Instantiate white map
	var packed_map:PackedScene = level_manager.packed_map
	var white_map = packed_map.instantiate()
	lightmask_viewport.add_child(white_map)
	white_map.material = shader_white
	
	# Instantiate lit map
	var lit_map = packed_map.instantiate()
	litview_viewport.add_child(lit_map)

