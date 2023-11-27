extends Area2D

@export var speed = 400 # Vitesse en pixel/seconde du joueur
var screen_size # Taille de la fenêtre du jeu

# _ready se lance automatiquement dès que la scène est appelée
func _ready():
	screen_size = get_viewport_rect().size

# _process(delta) est appelé à chaque frame. 'delta' représente le temps écoulé depuis la précédente frame, il représente une longueur de frame
func _process(delta):
	var velocity = Vector2.ZERO # Déclare le vecteur de mouvement du joueur
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
