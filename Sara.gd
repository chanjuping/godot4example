extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

const SPEED = 500.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_pressed("move_right"):
		_animated_sprite.play("run")		
		_animated_sprite.flip_h = false
#		velocity.x += SPEED * delta
		global_position.x += SPEED * delta
	elif Input.is_action_pressed("move_left"):
		_animated_sprite.play("run")
		_animated_sprite.flip_h = true
#		velocity.x -= SPEED * delta
		global_position.x -= SPEED * delta
	else:
		_animated_sprite.play("stand")
		velocity.x = 0

	move_and_slide()
