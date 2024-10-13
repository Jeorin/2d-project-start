extends CharacterBody2D

signal player_death
var player_health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 3.0
	var overlapping_enemies = %HurtBox.get_overlapping_bodies()
	if overlapping_enemies.size() > 0:
		player_health -= DAMAGE_RATE * overlapping_enemies.size() * delta
		%ProgressBar.value = player_health
		if player_health <= 0.0:
			player_death.emit()
