extends Node2D




@onready var animation_player: AnimationPlayer = $Camera2D/CanvasLayer/Control/AnimationPlayer





func _ready() -> void:
	$Camera2D.screen_shake(7, 5000.0)
	animation_player.play("typingending")
