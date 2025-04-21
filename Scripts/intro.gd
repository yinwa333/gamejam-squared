extends Node2D


var next_scene = ("res://Scenes/Intro 2.tscn")



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_file(next_scene)
