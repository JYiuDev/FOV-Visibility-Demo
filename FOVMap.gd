extends Node2D
class_name LightmaskManager

@export var visible_map: TileMap
var lightmask_tilemap: TileMap
@export var lightmask_viewport: SubViewport
@export var shader_white: Material
var debug_sprite: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var duplicate_map:TileMap = visible_map.duplicate()
	duplicate_map.material = shader_white
	lightmask_viewport.add_child(duplicate_map)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
