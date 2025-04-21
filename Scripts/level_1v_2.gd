extends Node2D

#MOUSE CODES
var main = load("res://Assets/Placeholder/rhombus_outline.png")
var click = load("res://Assets/Placeholder/rhombus.png")

var hover = ""
var mouse_left_down: bool = false



#OBJECTS
@onready var star_1: RigidBody2D = $Stars/Lv1Object
@onready var star_1_ui: Sprite2D = $Node2D/star1

@onready var star_2: RigidBody2D = $Stars/Lv1Object2
@onready var star_2_ui: Sprite2D = $Node2D/star2

@onready var star_3: RigidBody2D = $Stars/Lv1Object3
@onready var star_3_ui: Sprite2D = $Node2D/star3

@onready var star_4: RigidBody2D = $Stars/Lv1Object4
@onready var star_4_ui: Sprite2D = $Node2D/star4

@onready var star_5: RigidBody2D = $Stars/Lv1Object5
@onready var star_5_ui: Sprite2D = $Node2D/star5

@onready var star_6: RigidBody2D = $Stars/Lv1Object6
@onready var star_6_ui: Sprite2D = $Node2D/star6

@onready var star_7: RigidBody2D = $Stars/Lv1Object7
@onready var star_7_ui: Sprite2D = $Node2D/star7

@onready var star_8: RigidBody2D = $Stars/Lv1Object8
@onready var star_8_ui: Sprite2D = $Node2D/star8

@onready var star_9: RigidBody2D = $Stars/Lv1Object9
@onready var star_9_ui: Sprite2D = $Node2D/star9

@onready var star_10: RigidBody2D = $Stars/Lv1Object10
@onready var star_10_ui: Sprite2D = $Node2D/star10

@onready var star_11: RigidBody2D = $Stars/Lv1Object11
@onready var star_11_ui: Sprite2D = $Node2D/star11


@onready var star_12: RigidBody2D = $Stars/Lv1Object12
@onready var star_12_ui: Sprite2D = $Node2D/star12

@onready var star_13: RigidBody2D = $Stars/Lv1Object13
@onready var star_13_ui: Sprite2D = $Node2D/star13

@onready var star_14: RigidBody2D = $Stars/Lv1Object14
@onready var star_14_ui: Sprite2D = $Node2D/star14

@onready var star_15: RigidBody2D = $Stars/Lv1Object15
@onready var star_15_ui: Sprite2D = $Node2D/star15



@onready var next_scene_prompt: RichTextLabel = $NextScenePrompt



@onready var timer: Timer = $Timer
@onready var time_left: RichTextLabel = $TimeLeft



func _ready() -> void:
	Input.set_custom_mouse_cursor(main)
	$Camera2D.screen_shake(7, 5000.0)
	GlobalScript.total_time_in_secs = $Timer.time_left
	
	star_1_ui.visible = false
	star_2_ui.visible = false
	star_3_ui.visible = false
	star_4_ui.visible = false
	star_5_ui.visible = false
	star_6_ui.visible = false
	star_7_ui.visible = false
	star_8_ui.visible = false
	star_9_ui.visible = false
	star_10_ui.visible = false
	star_11_ui.visible = false
	star_12_ui.visible = false
	star_13_ui.visible = false
	star_14_ui.visible = false
	star_15_ui.visible = false
	
	
	next_scene_prompt.visible = false
	
	pass

func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.button_index == 1 and event.is_pressed():
			mouse_left_down = true
		elif event.button_index == 1 and not event.is_pressed():
			mouse_left_down = false

func _process(float) -> void:
	#time_left.text = "%s" % roundf($Timer.time_left)
	var m = int($Timer.time_left / 60.0)
	var s = $Timer.time_left - m * 60
	$TimeLeft.text = '%02d:%02d' % [m, s]
	
	# Perform some stuff.
	if mouse_left_down:
		Input.set_custom_mouse_cursor(click)
		if hover == "star1":
			star_1.visible = false
			star_1_ui.visible = true
			print("clicked")
			
		elif hover == "star2":
			star_2.visible = false
			star_2_ui.visible = true
			print("clicked")
			
		elif hover == "star3":
			star_3.visible = false
			star_3_ui.visible = true
			print("clicked")
		
		elif hover == "star4":
			star_4.visible = false
			star_4_ui.visible = true
			print("clicked")
			
		elif hover == "star5":
			star_5.visible = false
			star_5_ui.visible = true
			print("clicked")
			
		elif hover == "star6":
			star_6.visible = false
			star_6_ui.visible = true
			print("clicked")
			
		elif hover == "star7":
			star_7.visible = false
			star_7_ui.visible = true
			print("clicked")
		
		elif hover == "star8":
			star_8.visible = false
			star_8_ui.visible = true
			print("clicked")
		
		elif hover == "star9":
			star_9.visible = false
			star_9_ui.visible = true
			print("clicked")
		
		elif hover == "star10":
			star_10.visible = false
			star_10_ui.visible = true
			print("clicked")
			
		elif hover == "star11":
			star_11.visible = false
			star_11_ui.visible = true
			print("clicked")
			
		elif hover == "star12":
			star_12.visible = false
			star_12_ui.visible = true
			print("clicked")
		
		elif hover == "star13":
			star_13.visible = false
			star_13_ui.visible = true
			print("clicked")
		
		elif hover == "star14":
			star_14.visible = false
			star_14_ui.visible = true
			print("clicked")
		
		elif hover == "star15":
			star_15.visible = false
			star_15_ui.visible = true
			print("clicked")
			
			
			
			
		
		elif star_1_ui.visible == true and star_2_ui.visible == true and star_3_ui.visible == true and star_4_ui.visible == true and star_5_ui.visible == true and star_6_ui.visible == true and star_7_ui.visible == true and star_8_ui.visible == true and star_9_ui.visible == true and star_10_ui.visible == true and star_11_ui.visible == true and star_12_ui.visible == true and star_13_ui.visible == true and star_14_ui.visible == true and star_15_ui.visible == true:
			next_scene_prompt.visible = true
			await get_tree().create_timer(4).timeout
			print("time is done")
			get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
					
		
		else:
			pass
	else:
		Input.set_custom_mouse_cursor(main)





func _on_button_pressed() -> void:
	print("PRESSED")
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")







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


func _star4_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star4"
		print("star4")
func _star4_mouse_exited() -> void:
	hover = ""


func _star5_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star5"
		print("star5")
func _star5_mouse_exited() -> void:
	hover = ""


func _star6_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star6"
		print("star6")
func _star6_mouse_exited() -> void:
	hover = ""


func _star7_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star7"
		print("star7")
func _star7_mouse_exited() -> void:
	hover = ""


func _star8_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star8"
		print("star8")
func _star8_mouse_exited() -> void:
	hover = ""


func _star9_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star9"
		print("star9")
func _star9_mouse_exited() -> void:
	hover = ""


func _star10_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star10"
		print("star10")
func _star10_mouse_exited() -> void:
	hover = ""


func _star11_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star11"
		print("star11")
func _star11_mouse_exited() -> void:
	hover = ""


func _star12_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star12"
		print("star12")
func _star12_mouse_exited() -> void:
	hover = ""


func _star13_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star13"
		print("star13")
func _star13_mouse_exited() -> void:
	hover = ""


func _star14_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star14"
		print("star14")
func _star14_mouse_exited() -> void:
	hover = ""


func _star15_mouse_entered() -> void:
	if mouse_left_down == false:
		hover = "star15"
		print("star15")
func _star15_mouse_exited() -> void:
	hover = ""
