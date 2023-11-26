extends Node

@export var mob_scene: PackedScene
var score


func _ready():
	# j'enlève new_game() du ready(), car j'ai mon HUD qui s'en charge, sinon le jeu va se lancer seul
	# new_game()
	pass

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
	# J'appelle la fonction correspondante du HUD
	$HUD.show_game_over()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	
	# actualiser le score
	$HUD.update_score(score)
	
	# afficher le message de démmarage "Sauve Noël"
	$HUD.show_message("Sauve Noël")

func _on_score_timer_timeout():
	score += 1
	
	# Je vais appeller la fonction correspondante du HUD, afin que l'affichage soit synchronisé avec le score en temps réél
	$HUD.update_score(score)

func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()


func _on_mob_timer_timeout():
	# Je crée une nouvelle instance de la scène "Mob' (mob.tscn)
	var mob = mob_scene.instantiate()
	
	# Je sélectionne une position aléatoire sur "Path2D" (renommé en "MobPath"
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()
	
	# Régler la direction des mobs perpendiculaire à la direction du path
	var direction = mob_spawn_location.rotation + PI / 2

	# Régler la position du mob sur une position aléatoire
	mob.position = mob_spawn_location.position
	
	# Ajouter un peu d'aléatoire à la direction
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	# Choisir la vélocité (la vitesse) du mob
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	# Faire spawn le mob en l'ajoutant à la scène "Main"
	add_child(mob)
