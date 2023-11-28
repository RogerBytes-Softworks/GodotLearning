extends Area2D
signal hit
@export var speed = 400 # Vitesse en pixel/seconde du joueur


var screen_size # Taille de la fenêtre du jeu

# _ready se lance automatiquement dès que la scène est appelée
func _ready():
	screen_size = get_viewport_rect().size
	hide()

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
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_body_entered(_body):
	hide() # Fait disparaître le joueur après avoir déclenché un collision
	hit.emit()
	
	# Cette opération doit être différée car nous ne pouvons pas modifier les propriétés physiques lors d'un callback physique.
	$CollisionShape2D.set_deferred("disabled", true)
	# La désactivation de la forme de collision de la zone peut provoquer une erreur si cela se produit au milieu du traitement des collisions du moteur. L'utilisation de set_deferred() indique à Godot d'attendre pour désactiver la forme jusqu'à ce qu'il soit sûr de le faire.

