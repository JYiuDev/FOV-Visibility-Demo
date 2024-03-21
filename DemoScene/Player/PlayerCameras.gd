extends Node2D
class_name PlayerCameras

var level_manager:LevelManager

func _ready():
	if (get_node("/root").get_child(0) is LevelManager):
		level_manager = get_node("/root").get_child(0)
		_spawn_follower_camera("LightmaskCamera", level_manager.visibility_system.lightmask_viewport)
		_spawn_follower_camera("LitviewCamera", level_manager.visibility_system.litview_viewport)
	else:
		printerr(name + " can't find level manager")
		
	
	

func _spawn_follower_camera(cam_name:String, path:Node):
	#Create new remote transform
	var new_remote:RemoteTransform2D = RemoteTransform2D.new()
	add_child(new_remote)
	new_remote.name = cam_name + "_remote"
	
	#Create camera at path
	var new_camera:Camera2D = Camera2D.new()
	path.add_child(new_camera)
	new_camera.name = cam_name
	
	#Connect RemoteTransform
	new_remote.set_remote_node(new_camera.get_path())
