extends CharacterBody2D
"""
Handle player movement
"""

@export var speed = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	var move_dir: Vector2 = get_dir()
	velocity = move_dir * speed * 100 * delta
	move_and_slide()

func get_dir()->Vector2:
	var dir: Vector2 = Input.get_vector("gameplay_left","gameplay_right","gameplay_up","gameplay_down")
	return dir

