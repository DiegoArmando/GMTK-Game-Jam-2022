extends CanvasLayer

export var dialogPath = ""
export(float) var textSpeed = 0.05

var dialog
export(int) var phraseNum
export(int) var untilLine
var finishedDisplaying
var tween

func _on_start_dialogue(path):
	dialogPath = path
	phraseNum = 0
	dialog = getDialog()
	if "finished" in dialog[0]:
		get_tree().root.get_node("Node2D/EndScreen/EndOfGameBarrier").visible = true
		queue_free()
		return
	nextPhrase()

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Textbox Container/Timer".wait_time = textSpeed
	#dialog = getDialog()
	tween = $"Textbox Container/Panel/Text Postion/VBoxContainer/Tween"
	finishedDisplaying = true
	#assert(dialog, "getDialog() has failed")
	#nextPhrase()
	
func _process(_delta):
	#$"Textbox Container/Panel/Text Postion/VBoxContainer/Indicator".visible = finishedDisplaying
	if Input.is_action_just_pressed("ui_accept"):
		if finishedDisplaying:
			nextPhrase()
		else:
			tween.stop_all()
			finishedDisplaying = true
			$"Textbox Container/Panel/Text Postion/VBoxContainer/Dialog".visible_characters = -1
	
	

func nextPhrase() -> void:
	if (phraseNum >= dialog.size()):
		queue_free()
		return
	finishedDisplaying = false
	$"Textbox Container/Panel/Text Postion/VBoxContainer/CharacterName".bbcode_text = dialog[phraseNum]["Name"]
	$"Textbox Container/Panel/Text Postion/VBoxContainer/Dialog".bbcode_text = dialog[phraseNum]["Text"]
	$"Textbox Container/Panel/Text Postion/VBoxContainer/Dialog".visible_characters = 0
	tween.interpolate_property(
		$"Textbox Container/Panel/Text Postion/VBoxContainer/Dialog", "visible_characters", 0, 
		$"Textbox Container/Panel/Text Postion/VBoxContainer/Dialog".text.length(), $"Textbox Container/Panel/Text Postion/VBoxContainer/Dialog".text.length()/45.0,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
	)
	tween.start()
	phraseNum += 1
	

func getDialog() -> Array:
#	return [{"Name": "Dude", "Text": "Hey, what'chu looking at, punk?"},
#	{"Name": "Fellah", "Text": "This is the [wave]Dialog System[/wave]"},
#	{"Name": "Small Guy", "Text": "[shake]Well, more the textbox, not the full thing[/shake]"},
#	{"Name": "Individual", "Text": "QUIET! That doesn't mean we don't have [rainbow][tornado]schemes[/tornado][/rainbow] planned for it!"},
#	{'Name': 'Polite One', 'Text': 'Could you please come back later? Sorry!'}];
	var file = File.new()
	if not file.file_exists("res://Text/" + dialogPath + ".json"):
		return [{"finished": true}]
	file.open("res://Text/" + dialogPath + ".json", File.READ)
	var fileAsJson = file.get_as_text()

	var dialogOutput = parse_json(fileAsJson)
	if typeof(dialogOutput) == TYPE_ARRAY:
		return dialogOutput
	else:
		return []



func _on_Tween_tween_completed(_object, _key):
	finishedDisplaying = true
	pass # Replace with function body.
