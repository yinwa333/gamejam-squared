extends Node2D

var held = false
var mouse_overlap = false


@onready var type_a_area: Area2D = $"TypeA Area"
@onready var type_b_area: Area2D = $"TypeB Area"
@onready var mouse_area_2d: Area2D = $"Mouse/Mouse Area2D"



@onready var object_1: RigidBody2D = $"Object 1"



func _physics_process(delta):
	if (mouse_area_2d):
		_mouseOverlap()
		print("recognizing overlap")
	if (type_a_area):
		print("TypeA Set")
		pass
	if (type_b_area):
		print("TypeB Set")
		pass
	if (held):
		object_1.position = get_global_mouse_position()
		object_1.freeze = true

		
	else:
		pass


func drop(impulse=Vector2.ZERO):
	object_1.apply_central_impulse(impulse)
	object_1.freeze = false
	object_1 = null


func _mouseOverlap():
	if (GlobalScript.do_grab_thing):
		held = true
		print("being held")
	if !GlobalScript.do_grab_thing:
		held = false
		drop(Input.get_last_mouse_velocity())
		print("dropped")
	
	else:
		pass
