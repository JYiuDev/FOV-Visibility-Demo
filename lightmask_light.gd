extends Node

@onready var visibility_system: VisibilityManager = %VisibilitySystem
var remote_transform: RemoteTransform2D
var lightmask: WhiteLightMask
var packed_lightmask = preload("res://Lightmasks/lightmask.tscn")
@export_range(0,30) var light_texture_scale: float

# Called when the node enters the scene tree for the first time.
func _ready():
	remote_transform = $RemoteTransform2D
	
	#Create lightmask light and add to lightmask viewport
	lightmask = packed_lightmask.instantiate()
	#lm_manager.lightmask_viewport.add_child(lightmask)
	visibility_system.lightmask_viewport.add_child(lightmask)	
	
	#Connect remote transform to instantiated light mask
	remote_transform.set_remote_node(lightmask.get_path())
	lightmask._set_texture_scale(light_texture_scale)
