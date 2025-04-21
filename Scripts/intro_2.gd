extends Node2D



@onready var animation_player: AnimationPlayer = $Camera2D/CanvasLayer/Control/AnimationPlayer
var nextScene = ("res://Scripts/intro_3.gd")



func _ready() -> void:
	animation_player.play("typing2")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	await get_tree().create_timer(4).timeout
	get_tree().change_scene_to_file(nextScene)
