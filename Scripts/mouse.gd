extends Sprite2D


# Load the custom images for the mouse cursor.
var main = load("res://Assets/Placeholder/Kenny Particles/magic_03.png")
#var beam = load("res://beam.png")





func _ready():
	# Changes only the arrow shape of the cursor.
	# This is similar to changing it in the project settings.
	Input.set_custom_mouse_cursor(main)

	# Changes a specific shape of the cursor (here, the I-beam shape).
	#Input.set_custom_mouse_cursor(beam, Input.CURSOR_IBEAM)


const SPEED = 2000 # Set a higher speed to follow the mouse faster


func _physics_process(delta):
	var vec = get_viewport().get_mouse_position() - self.position # getting the vector from self to the mouse
	var movement = vec.normalized() * delta * SPEED
	#vec = vec.normalized() * delta * SPEED # normalize it and multiply by time and speed
	#position += vec # move by that vector
	if movement.length_squared() < vec.length_squared():
		position += movement
	if (GlobalScript.mouse_clicked):
		#print('grabed stuff')
		pass
	else:
		#print('not grabed stuff')
		position += vec
		pass


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			#print('click!')
			GlobalScript.mouse_clicked = true

		elif event.button_index == MOUSE_BUTTON_LEFT:
			#print('unclicked!')
			GlobalScript.mouse_clicked = false
