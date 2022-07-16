extends Node

export (NodePath) var public_1_path
onready var public_1 = get_node(public_1_path)
export (NodePath) var public_2_path
onready var public_2 = get_node(public_2_path)
export (NodePath) var public_3_path
onready var public_3 = get_node(public_3_path)

export (NodePath) var rolled_1_path
onready var rolled_1 = get_node(rolled_1_path)
export (NodePath) var rolled_2_path
onready var rolled_2 = get_node(rolled_2_path)
export (NodePath) var rolled_3_path
onready var rolled_3 = get_node(rolled_3_path)
export (NodePath) var rolled_4_path
onready var rolled_4 = get_node(rolled_4_path)
export (NodePath) var rolled_5_path
onready var rolled_5 = get_node(rolled_5_path)
export (NodePath) var rolled_6_path
onready var rolled_6 = get_node(rolled_6_path)

onready var publics = [public_1, public_2, public_3]
onready var rolled = [rolled_1, rolled_2, rolled_3, rolled_4, rolled_5, rolled_6]

var rng = RandomNumberGenerator.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RollButton_pressed():
	var rand_num = 0
	for die in publics:
		rand_num = rng.randi_range(0,5)
		match rand_num:
			0:	
				die.animation = "9"
			1:
				die.animation = "10"
			2:
				die.animation = "J"
			3:
				die.animation = "Q"
			4:
				die.animation = "K"
			5:
				die.animation = "A"
				
	for die in rolled:
		rand_num = rng.randi_range(0,5)
		match rand_num:
			0:	
				die.animation = "9"
			1:
				die.animation = "10"
			2:
				die.animation = "J"
			3:
				die.animation = "Q"
			4:
				die.animation = "K"
			5:
				die.animation = "A"
				
			 
