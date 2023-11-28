extends CanvasLayer

# Envoie une notification que le button "Start" a été préssé 
signal start_game

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	
	# On attend que le timer de MessageTimer soit fini
	await $MessageTimer.timeout
	
	$Message.text = "Gremlinvasion"
	$Message.show()
	
	# Générer un timer unique et attendre qu'il se finisse
	await get_tree().create_timer(1.0).timeout
	

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()

