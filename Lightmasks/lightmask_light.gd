extends Node2D

"""
Instantiating masking light and set up remote transform to it
"""
const myMath = preload("res://Libraries/my_math.gd")

var level_manager:LevelManager
var visibility_system: VisibilityManager
var remote_transform: RemoteTransform2D
var lightmask: WhiteLightMask
var packed_lightmask = preload("res://Lightmasks/lightmask.tscn")


@export_range(0,30) var light_texture_scale: float
var cur_light_texture: float
var texture_fluctuation_range: float
@export var max_texture_scale: float = 10
@export var min_texture_scale: float = 1
@onready var fuelTimer: Timer = $FuelTimer
@export var max_fuel_time: float
var light_time: float = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	level_manager = get_node("/root/Level")
	visibility_system = level_manager.visibility_system
	remote_transform = $RemoteTransform2D
	
	#Create lightmask light and add to lightmask viewport
	lightmask = packed_lightmask.instantiate()
	if(visibility_system):
		visibility_system.lightmask_viewport.add_child(lightmask)
	else:
		printerr("can't find visibility sys")
	
	#Connect remote transform to instantiated light mask
	remote_transform.set_remote_node(lightmask.get_path())
	lightmask._set_texture_scale(max_texture_scale)
	cur_light_texture = lightmask._get_texture_scale()
	
	#Start fuel time
	fuelTimer.start(max_fuel_time)
	
func _update_light(time:float):
	light_time = fmod(light_time+time,10)
	var light_flucuation:float = myMath._sin(light_time, 0.1, 10)
	#print("flucuation = " + str(light_flucuation).pad_decimals(2))
	lightmask._set_texture_scale(cur_light_texture + light_flucuation)
	

func _lightfuel_interpolation():
	cur_light_texture = lerpf(max_texture_scale,min_texture_scale, (max_fuel_time - fuelTimer.time_left)/max_fuel_time)

func _process(delta):
	_lightfuel_interpolation()
	_update_light(delta)
