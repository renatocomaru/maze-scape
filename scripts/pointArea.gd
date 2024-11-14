extends Area2D

@export var area_name: String

@onready var player = get_tree().root.get_node("/root/Maze/Player") 

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.increment_score(area_name)
		queue_free()  
