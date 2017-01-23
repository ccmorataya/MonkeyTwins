extends KinematicBody2D

export var gravity = 1500
var velocity = Vector2(0,1)
var jumping = false
var jumpAction = false
var isGrounded = false

func _on_WM_pressed():
	if isGrounded:
		global.WMonkeyAction = true

func _ready():
	set_process_input(true)
	set_fixed_process(true)

func _input(event):
	if event.is_action_pressed("wm_jump") && isGrounded:
		global.WMonkeyAction = true

	if global.WMonkeyAction:
		global.WMonkeyAction = false
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
		velocity.x = global.WALK_SPEED
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)
	else:
		isGrounded = false