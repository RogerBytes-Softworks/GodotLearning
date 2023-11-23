extends Area2D
signal hit

@export var speed = 400 # Vitesse à laquelle le joueur se déplace
var screen_size # Taille de la fenêtre de jeu

# Appelé quand le node entre dans l'arborescence de la scène la première fois, lors de l'execution
func _ready():
	screen_size = get_viewport_rect().size
	hide()


# _process() est appelé à chaque frame. 'delta' représente temps écoulé depuis la frame précedente
func _process(delta):
	var velocity = Vector2.ZERO # Le vecteur de mouvement du joueur. Ca fait (0, 0) 1er est x et 2e y
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
		# get_node("AnimatedSprite2D").play() 
	else:
		$AnimatedSprite2D.stop() # $ est un raccourci pour faire get_node(); ici c'est :
		# get_node("AnimatedSprite2D").stop() 
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	# Mes animations en dessous
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		# $AnimatedSprite2D.flip_v = false # J'ai commenté la ligne parce que je trouve ça laid, il a fait une animation bizarre sur Y, donc autant flip le perso sur y
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = velocity.y > 0


func _on_body_entered(body):
	hide() # Après avir été touché, le personnage disparaît
	hit.emit() # On emmet le signal "hit"
	
	$CollisionShape2D.disabled = false
	# Doit être différé car nous ne pouvons pas modifier les propriétés physiques lors d'un rappel (callback) physique.

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

