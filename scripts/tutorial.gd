extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("tutorial")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://scenes/Maze.tscn")
