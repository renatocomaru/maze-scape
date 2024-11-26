extends Button

@onready var hover_sound_player = $HoverSoundPlayer 
@onready var click_sound_player = $ClickSoundPlayer

func _on_mouse_entered() -> void:
	if hover_sound_player and !hover_sound_player.playing:
		hover_sound_player.play()


func _on_pressed() -> void:
	if click_sound_player and !click_sound_player.playing:
		click_sound_player.play()
