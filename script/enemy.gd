extends CharacterBody3D

 
@onready var nav_agent = $NavigationAgent3D
@onready var player = $"Basic FPS Player"
@onready var enemy = $"."



var speed = 2.0
var gravity = 9.8
 
func _process(delta):
	
	#if player.position.x < enemy.position.x:
		#enemy.position.x -= speed * delta
	
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y -= 2
	var next_location = nav_agent.get_next_path_position()
	var current_location = global_transform.origin
	var new_velocity = (next_location - current_location).normalized() * speed
 
	velocity = velocity.move_toward(new_velocity,.25)
	move_and_slide()
 
func update_target_location(target_location):
	nav_agent.target_position = target_location





#@onready var nav_agent = $NavigationAgent3D
#var speed = 5.0
#var gravity = 9.8
#
#
#func _process(delta):
	#if not is_on_floor():
		#velocity.y -= gravity * delta
	#else:
		#velocity.y -= 2
	#var next_location = nav_agent.get_next_path_position()
	#var current_location = global_transform.origin 
	#var new_velocity = (next_location - current_location).normalized() * speed
	#
	#velocity = velocity.move_toward(new_velocity, -25)
	#move_and_slide()
#func update_target_location(target_location):
	#nav_agent.target_position = target_location
#





#const SPEED = 5.0
#const JUMP_VELOCITY = 4.5
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
#
#
#func _physics_process(delta):
	## Add the gravity.
	#if not is_on_floor():
		#velocity.y -= gravity * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
#
	#move_and_slide()
