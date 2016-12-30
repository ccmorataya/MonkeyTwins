extends KinematicBody2D

export var gravity = 4000
var velocity = Vector2()

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	velocity.y = delta * gravity
	var motion = velocity * delta
	motion = move(motion)
	
	if(Input.is_action_pressed("wm_jump")):
		velocity.y = (delta * gravity) - 50
		print(velocity)
		motion = velocity * delta
		motion = move(motion)