extends Control


func _on_new_game_pressed():
	get_tree().change_scene("res://levels/level-0.tscn")

func _on_load_pressed():
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().quit()
