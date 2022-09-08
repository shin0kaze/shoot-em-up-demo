extends CanvasLayer

func _init():
	self.visible = false

func _input(event):
	if event.is_action_pressed('game_pause'):
		get_tree().paused = not get_tree().paused 
		self.visible = not self.visible


func _on_continue_pressed():
	get_tree().paused = false 
	self.visible = false
