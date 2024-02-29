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

# Called when the node enters the scene tree for the first time.
func _ready():
	var duplicate_map:TileMap = visible_map.duplicate()
	duplicate_map.material = shader_white
	lightmask_viewport.add_child(duplicate_map)
	
	var duplicate_map_2:TileMap = visible_map.duplicate()
	litview_viewport.add_child(duplicate_map_2)
