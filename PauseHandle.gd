extends Node

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused

func _process(_delta):
	$Background.visible = get_tree().paused
