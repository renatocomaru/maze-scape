extends Node2D

@onready var end_theme = $AudioStreamPlayer2D

func _ready():
	$AnimationPlayer.play("fade_to_image")
	end_theme.play()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_to_image":
		$AnimationPlayer.play("credits")
	elif anim_name == "credits":
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
