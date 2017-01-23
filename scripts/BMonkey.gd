extends KinematicBody2D

export var gravity = 1500
var velocity = Vector2(0,1)
const WALK_SPEED = 180
var jumping = false
var jumpAction = false
var isGrounded = false
onready var global = get_node("/root/global")

func _on_BM_pressed():
	global.BMonkeyAction = true
	
func _ready():
	set_process_input(true)
	set_fixed_process(true)

func _input(event):
	if event.is_action_pressed("bm_jump") && isGrounded:
		global.BMonkeyAction = true

	if global.BMonkeyAction:
		print("monkey")
		global.BMonkeyAction = false
		isGrounded = false
		jumpAction = true
		jumping = true
		velocity.y = -800

func _fixed_process(delta):
	velocity.y += delta * gravity
	var motion = velocity * delta
	
	motion = move(motion)
	
	if is_colliding():
		isGrounded = true
		velocity.x = WALK_SPEED
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)
	else:
		isGrounded = false