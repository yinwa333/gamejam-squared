extends Node2D

#MOUSE CODES
var main = load("res://Assets/Placeholder/Kenny Icons/rhombus_outline.png")
var click = load("res://Assets/Placeholder/Kenny Icons/rhombus.png")

var hover = ""
var mouse_left_down: bool = false



#OBJECTS
@onready var star_1: RigidBody2D = $Lv1Object
@onready var star_1_ui: Sprite2D = $Node2D/star1

@onready var star_2: RigidBody2D = $Lv1Object2
@onready var star_2_ui: Sprite2D = $Node2D/star2

@onready var star_3: RigidBody2D = $Lv1Object3
@onready var star_3_ui: Sprite2D = $Node2D/star3





func _ready() -> void:
	Input.set_custom_mouse_cursor(main)


func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouse_left_down = true
		elif event.button_index == 1 and not event.is_pressed():
			mouse_left_down = false

func _process(float) -> void:
	# Perform some stuff.
	if mouse_left_down:
		Input.set_custom_mouse_cursor(click)
		if hover == "star1":
			star_1.visible = false
			star_1_ui.visible = true
			print("clicked")
			
		if hover == "star2":
			star_2.visible = false
			star_2_ui.visible = true
			print("clicked")
			
		if hover == "star3":
			star_3.visible = false
			star_3_ui.visible = true
			print("clicked")
		else:
			pass
	else:
		Input.set_custom_mouse_cursor(main)


func _star1_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star1"
		print("star1")
	else:
		pass
func _star1_mouse_exited() -> void:
	hover = ""

func _star2_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star2"
		print("star2")
	else:
		pass
func _star2_mouse_exited() -> void:
	hover = ""

func _star3_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star3"
		print("star3")
	else:
		pass
func _star3_mouse_exited() -> void:
	hover = ""
