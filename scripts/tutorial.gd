extends Node

@onready var tutorial_theme = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("tutorial")
	tutorial_theme.play()
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		transition_to_maze()

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	transition_to_maze()
	
func transition_to_maze() -> void:
	get_tree().change_scene_to_file("res://scenes/Maze.tscn")
