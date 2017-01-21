extends KinematicBody2D

export var gravity = 4000
var velocity = Vector2(0,1)
const WALK_SPEED = 200

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	velocity.y = delta * gravity
	
	if(Input.is_action_pressed("wm_jump")):
		pass
	
	var motion = velocity * delta
	motion = move(motion)
	
	if(is_colliding()):
		velocity.x = WALK_SPEED
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)