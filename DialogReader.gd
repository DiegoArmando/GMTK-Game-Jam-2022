extends MarginContainer

export var dialogPath = ""
export(float) var textSpeed = 0.05

var dialog

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "getDialog() has failed")
	pass # Replace with function body.

func getDialog() -> Array:
	var file = File.new()
	assert(file.file_exists(dialogPath), "File path for dialog does not exist");
	
	file.open(dialogPath, File.READ)
	var fileAsJson = file.get_as_text()
	
	var dialogOutput = parse_json(fileAsJson)
	if typeof(dialogOutput) == TYPE_ARRAY:
		return dialogOutput
	else:
		return []
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
