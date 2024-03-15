extends Sprite2D

@export var lightmask_viewport:SubViewport

func _ready():
	var lightmask_path = lightmask_viewport.get_path()
	var lightmask_texture:ViewportTexture = lightmask_viewport.get_texture()
	material.set_shader_parameter("mask_texture", lightmask_texture)
