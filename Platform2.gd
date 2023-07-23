extends Area2D

func _on_body_entered(body):
	print(body.get_name())
	if body.get_name() == "Player":
		$Sprite2D/AnimatedSprite2D.play("glowing_blue_platform")
		$Sprite2D/AnimatedSprite2D/MissionComplete.visible = true
		print("Mission Complete!")
		
		await get_tree().create_timer(2.0).timeout
		print("NEXT SCENE")

		get_tree().change_scene_to_file("res://node_2d.tscn")
	
	


