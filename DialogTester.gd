extends Node2D

var dialog = preload("res://DialogBox.tscn")
var winner_tally = ""
signal start_dialogue(path)

func _ready():
	pass
	


func _on_DiceBoss_round_won(winner):
	winner_tally += String(winner)
	var d = dialog.instance()
	d.phraseNum = 0
	d.untilLine = 5
	connect("start_dialogue", d, "_on_start_dialogue")
	add_child(d)
	emit_signal("start_dialogue", winner_tally)


func _on_RestartGame_pressed():
	$EndScreen/EndOfGameBarrier.visible = false
	winner_tally = ""
	
