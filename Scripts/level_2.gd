extends Node2D

@onready var camera_2d: Camera2D = $Camera2D

@onready var timer: Timer = $Timer



@onready var star_1: Area2D = $stars/Star1
@onready var star_2: Area2D = $stars/Star2
@onready var star_3: Area2D = $stars/Star3
@onready var star_4: Area2D = $stars/Star4
@onready var star_5: Area2D = $stars/Star5
@onready var star_6: Area2D = $stars/Star6
@onready var star_7: Area2D = $stars/Star7
@onready var star_8: Area2D = $stars/Star8
@onready var star_9: Area2D = $stars/Star9
@onready var star_10: Area2D = $stars/Star10
@onready var star_11: Area2D = $stars/Star11
@onready var star_12: Area2D = $stars/Star12
@onready var star_13: Area2D = $stars/Star13
@onready var star_14: Area2D = $stars/Star14
@onready var star_15: Area2D = $stars/Star15

@onready var slot_1: Area2D = $"PromptRocket1/Container/Slot 1"
@onready var slot_2: Area2D = $"PromptRocket1/Container/Slot 2"
@onready var slot_3: Area2D = $"PromptRocket1/Container/Slot 3"


@onready var r2_slot_1: Area2D = $"PromptRocket2/Container/Slot 1"
@onready var r2_slot_2: Area2D = $"PromptRocket2/Container/Slot 2"
@onready var r2_slot_3: Area2D = $"PromptRocket2/Container/Slot 3"





@onready var prompt_rocket_1: Node2D = $PromptRocket1
@onready var prompt_rocket_2: Node2D = $PromptRocket2
@onready var prompt_rocket_3: Node2D = $PromptRocket3




var is_inside_dropable = false
var body_ref
var initialPos : Vector2



@onready var button: RichTextLabel = $PromptRocket1/Button
@onready var button2: RichTextLabel = $PromptRocket2/Button





var slotPosition = Vector2(0,0)


var held_object = false

func _ready():
	#CAMERA
	$Camera2D.screen_shake(7, 5000.0)
	#TIMER
	GlobalScript.total_time_in_secs = $Timer.time_left
	
	##RESETTING BUTTONS
	button.visible = false
	button2.visible = false



##LETS STARS BE PICKED UP
func _on_pickable_clicked(object):
	if !held_object:
		object.pickup()
		held_object = object

##DROPPING STARS DOWN
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if held_object and !event.pressed:
			held_object.drop(Input.get_last_mouse_velocity() / 5.0)
			held_object = null
	
	if button.visible:
		if Input.is_action_pressed("shoot"):
			star_3.visible = false
			star_15.visible = false
			prompt_rocket_1.position.y -= 200
			await get_tree().create_timer(2).timeout
			print("time is done")
			prompt_rocket_1.position.y -= 700
			await get_tree().create_timer(1).timeout
			prompt_rocket_1.visible = false
			button.visible = false
	
	if button2.visible:
		if Input.is_action_just_pressed("shoot"):
			star_8.visible = false
			star_12.visible = false
			prompt_rocket_2.position.y -= 200
			await get_tree().create_timer(2).timeout
			print("time is done")
			prompt_rocket_2.position.y -= 700
			await get_tree().create_timer(1).timeout
			prompt_rocket_2.visible = false
			button2.visible = false
			await get_tree().create_timer(2).timeout
			get_tree().change_scene_to_file("res://Scenes/Outro.tscn")


func _process(delta: float) -> void:
	##TIMER SETTING ON THE TEXT
	var m = int($Timer.time_left / 60.0)
	var s = $Timer.time_left - m * 60
	$TimeLeft.text = '%02d:%02d' % [m, s]
	
	
	
	if slot_2.modulate == Color.CYAN and slot_3.modulate == Color.CYAN:
		button.visible = true
	
	if prompt_rocket_1.visible == false:
		prompt_rocket_2.visible = true
	
	if r2_slot_2.modulate == Color.CYAN and r2_slot_3.modulate == Color.CYAN:
		button2.visible = true
	
	if prompt_rocket_2.visible == false and prompt_rocket_1.visible == false:
		prompt_rocket_3.visible = true







func _on_star_3_area_entered(body: Area2D) -> void:
	if body.is_in_group('req 5'):
		is_inside_dropable = true
		body.modulate = Color(Color.CYAN, 1)
		slotPosition = Vector2(body.global_position.x, body.global_position.y)
		body_ref = body
		print("CORRECT")
func _on_star_3_area_exited(body: Area2D) -> void:
	if body.is_in_group('req 5'):
		is_inside_dropable = false
		body.modulate = Color(Color.WHITE, 1)
		body_ref = body
		print("WELP")

func _on_star_15_area_entered(body: Area2D) -> void:
	if body.is_in_group('req 5'):
		is_inside_dropable = true
		body.modulate = Color(Color.CYAN, 1)
		slotPosition = Vector2(body.global_position.x, body.global_position.y)
		body_ref = body
		print("CORRECT")
func _on_star_15_area_exited(body: Area2D) -> void:
	if body.is_in_group('req 5'):
		is_inside_dropable = false
		body.modulate = Color(Color.WHITE, 1)
		body_ref = body
		print("WELP")





func _on_star_12_area_entered(body: Area2D) -> void:
	if body.is_in_group('req 3'):
		is_inside_dropable = true
		body.modulate = Color(Color.CYAN, 1)
		slotPosition = Vector2(body.global_position.x, body.global_position.y)
		body_ref = body
		print("CORRECT")
func _on_star_12_area_exited(body: Area2D) -> void:
	if body.is_in_group('req 3'):
		is_inside_dropable = false
		body.modulate = Color(Color.WHITE, 1)
		body_ref = body
		print("WELP")

func _on_star_8_area_entered(body: Area2D) -> void:
	if body.is_in_group('req 3'):
		is_inside_dropable = true
		body.modulate = Color(Color.CYAN, 1)
		slotPosition = Vector2(body.global_position.x, body.global_position.y)
		body_ref = body
		print("CORRECT")
func _on_star_8_area_exited(body: Area2D) -> void:
	if body.is_in_group('req 3'):
		is_inside_dropable = false
		body.modulate = Color(Color.WHITE, 1)
		body_ref = body
		print("WELP")
