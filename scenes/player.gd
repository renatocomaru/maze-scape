extends CharacterBody2D

# Velocidade do personagem
const SPEED = 100.0
var score = 0
var visited_areas = []

# Referência ao AnimatedSprite2D e ao ScoreLabel
@onready var animated_sprite = $AnimatedSprite2D
@onready var score_label = $"../CanvasLayer/ScoreLabel"  # Ajuste o caminho se necessário

# Variável para manter a direção atual
var current_direction = "down"  # Pode ser "down", "up", "left" ou "right"

func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO
	var new_direction = ""

	# Verifica as teclas de direção e define a nova direção
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		new_direction = "right"
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		new_direction = "left"
	elif Input.is_action_pressed("ui_down"):
		direction.y += 1
		new_direction = "down"
	elif Input.is_action_pressed("ui_up"):
		direction.y -= 1
		new_direction = "up"

	# Se houver uma nova direção, reproduz a animação correspondente
	if new_direction != "":
		if current_direction != new_direction:
			current_direction = new_direction
		animated_sprite.play(new_direction)

	# Se não houver movimento, reproduz a animação de "parado"
	if direction == Vector2.ZERO:
		animated_sprite.play("idle_" + current_direction)  # Reproduz a animação de "parado"

	# Calcula e aplica o movimento
	self.velocity = direction.normalized() * SPEED
	move_and_slide()

# Função para incrementar a pontuação e verificar vitória
func increment_score(area_name: String):
	if area_name not in visited_areas:
		visited_areas.append(area_name)
		score += 1
		update_score_label()  # Atualiza a exibição da pontuação

		# Verifica se o jogador atingiu 4 pontos para mostrar a mensagem de vitória
		if score == 4:
			show_victory_message()

# Função para atualizar a pontuação na tela
func update_score_label():
	score_label.text = "Cidades: " + str(score)

# Função para mostrar mensagem de vitória
func show_victory_message():
	score_label.text = "Você não é mais um EXILADO!"
	await get_tree().create_timer(10).timeout
	get_tree().change_scene_to_file("res://scenes/EndGame.tscn")

# Funções de sinal de entrada para cada Local
func _on_local_1_body_entered(_body: Node2D) -> void:
	increment_score("Local1")

func _on_local_2_body_entered(_body: Node2D) -> void:
	increment_score("Local2")

func _on_local_3_body_entered(_body: Node2D) -> void:
	increment_score("Local3")

func _on_local_4_body_entered(_body: Node2D) -> void:
	increment_score("Local4")
