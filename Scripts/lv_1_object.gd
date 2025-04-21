extends RigidBody2D


@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


const RESET_SIDE = -700



func _ready():
	pass


func _physics_process(delta: float):
	
	# Check if the object has reached the reset height
	if global_position.x <= RESET_SIDE:
		# Reset the object's position at the top with a random x-value
		position = Vector2(randf_range(235, 1100), -395.0)
	
	else:
		#constant_force = Vector2(-400,200)
		pass
