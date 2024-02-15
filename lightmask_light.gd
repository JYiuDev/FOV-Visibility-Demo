extends Node

var whitemask_scene = preload("res://Lightmasks/lightmask.tscn")
@export var lm_manager: LightmaskManager
var remote_transform: RemoteTransform2D
var lightmask: WhiteLightMask

# Called when the node enters the scene tree for the first time.
func _ready():
	remote_transform = $RemoteTransform2D
	lightmask = whitemask_scene.instantiate()
	
	lm_manager.lightmask_viewport.add_child(lightmask)
	remote_transform.set_remote_node(lightmask.get_path())
	
	lightmask._set_texture_scale(3.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(lightmask):
		print(lightmask.global_position)
