extends Node

@onready var op_theme = $AudioStreamPlayer2D
@onready var animation_player = $AnimationPlayer
@onready var click_sound_player = $CanvasLayer/Button/ClickSoundPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("start_game")
	op_theme.play()



func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if click_sound_player and !click_sound_player.playing:
		click_sound_player.play()
	animation_player.play("fade_out")
	
	await get_tree().create_timer(2.5).timeout
	
	get_tree().change_scene_to_file("res://scenes/Tutorial.tscn")
