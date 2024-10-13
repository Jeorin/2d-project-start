extends Button

func restart_game():
	get_tree().paused = false
	get_tree().reload_current_scene()
	
