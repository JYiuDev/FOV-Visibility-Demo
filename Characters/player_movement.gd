extends CharacterBody2D
"""
Handle player movement
"""

@export var speed = 50
var torch_packed  = preload("res://Objects/Fire/torch.tscn")
var level_manager: LevelManager
# Called when the node enters the scene tree for the first time.
func _ready():
	level_manager = get_node("/root/Level")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(Input.is_action_just_pressed("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")):
		#make a torch
		trymake(torch_packed)
	
	
func _physics_process(delta):
	var move_dir: Vector2 = get_dir()
	velocity = move_dir * speed * 100 * delta
	move_and_slide()

func get_dir()->Vector2:
	var dir: Vector2 = Input.get_vector("gameplay_left","gameplay_right","gameplay_up","gameplay_down")
	return dir

func trymake(scene: PackedScene):
	var ins_scene = scene.instantiate()
	var vis_sys = level_manager.visibility_system
	ins_scene.global_position = global_position
	vis_sys.litview_viewport.add_child(ins_scene)
