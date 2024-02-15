extends Node2D
class_name LightmaskManager

@export var visible_map: TileMap
var lightmask_tilemap: TileMap
var lightmask_viewport: SubViewport
@export var shader_white: Material

# Called when the node enters the scene tree for the first time.
func _ready():
	lightmask_viewport = $Lightmask_Viewport
	var duplicate_map:TileMap = visible_map.duplicate()
	duplicate_map.material = shader_white
	$Lightmask_Viewport.add_child(duplicate_map)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
