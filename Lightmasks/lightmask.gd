extends Node2D
class_name  WhiteLightMask

var light:PointLight2D

# Called when the node enters the scene tree for the first time.
func _ready():
	light = $PointLight2D


func _set_texture_scale(s: float):
	light.set_texture_scale(s)

func _set_light_scale(s: Vector2):
	light.scale = s
