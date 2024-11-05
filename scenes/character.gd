extends Node2D

# Velocidade do personagem
var speed = 100

# Chamada para o AnimatedSprite2D
@onready var animated_sprite = $AnimatedSprite2D

# Variável para manter a direção atual
var current_direction = "down"  # Armazena apenas "down", "up", "left", ou "right"

# Função chamada quando o nó estiver pronto
func _ready() -> void:
	print("Personagem pronto!")

# Função que processa a cada frame
func _process(delta: float) -> void:
	var direction = Vector2()
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
	if direction == Vector2():  # Verifica se não há movimento
		animated_sprite.play("idle_" + current_direction)  # Reproduz a animação de "parado"

	# Aplica o movimento
	if direction != Vector2():
		direction = direction.normalized()

	# Aqui o delta continua a ser aplicado para suavidade de movimento
	position += direction * speed * delta
