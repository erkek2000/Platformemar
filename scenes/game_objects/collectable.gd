extends Area2D

@onready var game_manager = $"../../../GameManager"
@onready var animation_player = $AnimationPlayer


func _on_body_entered(body):
	if (body.name == "Player"):
		animation_player.play("eat_animation")
		game_manager.add_point()
