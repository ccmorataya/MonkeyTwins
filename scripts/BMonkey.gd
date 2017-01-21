extends KinematicBody2D

export var gravity = 4000
var velocity = Vector2(0,1)
const WALK_SPEED = 150
var jumping = false
var jump = false

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	velocity.y = delta * gravity
	
	if Input.is_action_pressed("bm_jump"):
		if !jumping && !jump:
			print("jump press")
			jump(velocity, delta)
		elif !is_colliding() && jumping && jumping:
			jump = false
			jumping = false
	
	var motion = velocity * delta
	motion = move(motion)
	
	if is_colliding():
		velocity.x = WALK_SPEED
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)

func jump(velocity, delta):
	jump = true
	jumping = true
	velocity.y = -500
	var motion = velocity * delta
	move(motion)
	print("Monkey jumping")