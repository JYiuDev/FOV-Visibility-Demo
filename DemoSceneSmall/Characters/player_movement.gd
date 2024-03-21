extends CharacterBody2D
"""
Handle player movement
"""

@export var speed = 50
var level_manager: LevelManager
var torch_packed  = preload("res://Objects/Torch/torch.tscn")

func _ready():
	# Get level manager
	if (get_node("/root").get_child(0) is LevelManager):
		level_manager = get_node("/root").get_child(0)
	else:
		printerr(name + "can not find level manager")

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
	
