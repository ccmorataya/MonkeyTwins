extends KinematicBody2D

export var gravity = 4000
var velocity = Vector2()

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	velocity.y = delta * gravity
	var motion = velocity * delta
	motion = move(motion)