extends CanvasLayer


# Notifie "Main" que le bouton a été préssé
signal start_game


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


#Cette fonction est appelée lorsque le joueur perd. Elle affiche "Vous avez perdu" pendant 2 secondes, puis retourne à l'écran d'accueil et, après une brève pause, affiche le bouton "Start".
func show_game_over():
	show_message("Vous avez perdu")
	# le await permet d'attendre la fin du coutdown de messagetimer
	await $MessageTimer.timeout
	
	$Message.text = "Gremlinvasion
X-Mas Never Die"
	$Message.show()
	
	# faire un timer unique and attendre sa fin
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)
	

func _on_message_timer_timeout():
	$Message.hide()


func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()
