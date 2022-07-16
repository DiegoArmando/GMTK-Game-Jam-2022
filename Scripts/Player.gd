extends Node

export (NodePath) var player_sprite
onready var mysprite = get_node(player_sprite)

export (NodePath) var money_path
onready var money_text = get_node(money_path)

export (NodePath) var mood_path
onready var mood_text = get_node(mood_path)

# Declare member variables here. Examples:
var mood = 0
var money = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	
	money_text.text = "$" + String(money)
	mood_text.text = "Mood:" + String(mood)
	
	if mood > 0:
		mysprite.animation = "Happy"
	elif mood < 0:
		mysprite.animation = "Mad"
	else:
		mysprite.animation = "Neutral"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

