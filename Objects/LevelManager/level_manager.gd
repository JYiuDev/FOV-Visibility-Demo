extends Node2D
class_name LevelManager


"""
Responsibilities:
Storing reference for various systems of the level
"""
@export_category("Tilemap")
@export var packed_map: PackedScene
@export var unlit_color: Color

@export_category("VisibilitySys")
@export var visibility_system: VisibilityManager




func _ready():
	var bg_map= packed_map.instantiate() 
	add_child(bg_map)
	bg_map as TileMap
	bg_map.set_self_modulate(unlit_color)
	bg_map.name = "bg_map"
	bg_map.set_z_index(-1)

func testprint():
	print("called")
