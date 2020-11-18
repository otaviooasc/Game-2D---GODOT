extends Area2D

func _on_Next_Stage_body_entered(body):
	 print("Next level")
	 get_tree().change_scene("World2.tscn")
