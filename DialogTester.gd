extends Node2D

var dialog = preload("res://DialogBox.tscn")

func _ready():
	pass 



func _on_Button_pressed():
	var d = dialog.instance()
	d.phraseNum = 0
	d.untilLine = 5
	add_child(d)
