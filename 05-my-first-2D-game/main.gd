extends Node
@export var mob_scene: PackedScene

var score

func _ready():
	pass

func _process(_delta):
	pass

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$DeathSound.play()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready !")
	get_tree().call_group("mobs", "queue_free")
	$Music.play()

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_mob_timer_timeout():
	# On créé une instance de la scène "Mob"
	var mob = mob_scene.instantiate()
	
	# On choisit une position aléatoire avec Path2D (le "PathFollow2D" renommé en "MobSpawnLocation")
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	# On régle la position aléatoire du mob à 90° de la direction du path
	var direction = mob_spawn_location.rotation + PI / 2
	
	# On associe le spawn du mob avec la position aléatoire que nous venons de régler
	mob.position = mob_spawn_location.position
	
	# On ajoute un peu d'aléatoire et de variété dans la direction du mob
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	# On choisit la vélocité/vitesse du mob
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	# On provoque le spawn d'un mob en l'ajoutant à la scène (cf la var "mob")
	add_child(mob)

