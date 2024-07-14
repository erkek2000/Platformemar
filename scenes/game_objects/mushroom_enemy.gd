extends RigidBody2D
@onready var game_manager = $"../../../GameManager"
	

func _on_area_2d_body_entered(body):
	if (body.name == "Player"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if y_delta > 30:
			print ("Destroy enemy")
			queue_free()
			body.jump()
		else:
			print("Decrease player health")
			game_manager.decrease_health()
			if x_delta > 0:
				body.hurt(1500)
			else:
				body.hurt(-1500)
