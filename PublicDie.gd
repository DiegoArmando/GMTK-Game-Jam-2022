extends AnimatedSprite

var held = false
var grabbable = false
onready var kmb = get_node("KinematicBody2D")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if grabbable and not held:
			held = true
	elif event is InputEventMouseButton and not event.pressed and event.button_index == BUTTON_LEFT:
		held = false
	elif event is InputEventMouseMotion and held:
		position = event.position
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	if held:
#		position = 
#	pass


func _on_KinematicBody2D_mouse_entered():
	grabbable = true


func _on_KinematicBody2D_mouse_exited():
	grabbable = false
