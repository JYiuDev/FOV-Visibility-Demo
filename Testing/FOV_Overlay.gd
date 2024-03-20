extends Sprite2D
class_name FOVOverlay


"""
Set parameter to own shader at run time
"""

var level_manager:LevelManager

func _ready():
	# Get level manager
	if (get_node("/root").get_child(0) is LevelManager):
		level_manager = get_node("/root").get_child(0)
	else:
		printerr(name + "can not find level manager")
		
	var lightmask_texture:ViewportTexture = level_manager.visibility_system.lightmask_viewport.get_texture()
	
	material.set_shader_parameter("mask_texture", lightmask_texture)
