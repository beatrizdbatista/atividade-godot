extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _init():
	print(ProjectSettings.get_setting("physics/2d/default_gravity"))


func _physics_process(_delta):

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
