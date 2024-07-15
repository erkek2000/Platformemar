extends CharacterBody2D
@onready var sprite_2d = $Sprite2D
@export var particle : PackedScene

const SPEED = 400.0
const JUMP_VELOCITY = -900.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0


func hurt(x):	
	velocity.y = JUMP_VELOCITY
	velocity.x = x
	#animating here doesnt work.
	sprite_2d.animation = "hurt"

func jump():
	velocity.y = JUMP_VELOCITY
	spawn_particle()

func _physics_process(delta):
	
	# Handle all animations
	if is_on_floor():
		jump_count = 0
		if (velocity.x > 1 || velocity.x < -1):
			sprite_2d.animation = "running"
		elif velocity.x == 0: 
			sprite_2d.animation = "idle"
	else:
		velocity.y += gravity * delta
		if jump_count == 1 and velocity.y < 0:
			sprite_2d.animation = "jumping"
		elif jump_count == 2 and velocity.y < 0:
			sprite_2d.animation = "double jumping"
		else:
			sprite_2d.animation = "falling"
		
	if not Input.is_action_pressed("Move Down"):
		set_collision_mask_value(9, true)
	else:
		set_collision_mask_value(9, false)
			

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and jump_count < 2:			
		velocity.y = JUMP_VELOCITY	
		jump_count += 1
		if jump_count == 2:
			spawn_particle()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Move Left", "Move Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if velocity.x < 0:
		sprite_2d.flip_h = true
	elif velocity.x > 0:
		sprite_2d.flip_h = false
	
func spawn_particle():
	var particle_node = particle.instantiate()
	particle_node.position = position
	get_parent().add_child(particle_node)
	await get_tree().create_timer(0.3).timeout
	particle_node.queue_free()
