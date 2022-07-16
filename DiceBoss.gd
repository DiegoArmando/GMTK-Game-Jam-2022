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

enum hand_type {BUST, TWO, STRAIGHT, THREE}

var rng = RandomNumberGenerator.new()

class HandSorter:
	static func sort_ascending(a,b):
		if a[0] == b[0]:
			return a[1] < b[1]
		return a[0] < b[0]
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
		rand_num = rng.randi_range(1,6)
		die.animation = str(rand_num)
				
	for die in rolled:
		rand_num = rng.randi_range(1,6)
		die.animation = str(rand_num)
				
			 


func _on_D1Button_pressed():
	#var tmp = $PublicDice.get_node("Public Die 1").animation
	evaluate_hands(int($PublicDice.get_node("Public Die 1").animation))
	pass # Replace with function body.


func _on_D2Button_pressed():
	evaluate_hands(int($PublicDice.get_node("Public Die 2").animation))
	pass # Replace with function body.


func _on_D3Button_pressed():
	evaluate_hands(int($PublicDice.get_node("Public Die 3").animation))
	pass # Replace with function body.
	
	
func determine_type(hand_values):
	if hand_values[0] == hand_values[1] and hand_values[1] == hand_values[2]:
		return hand_type.THREE
	elif (hand_values[0] + 1) == hand_values[1] and (hand_values[1] + 1) == hand_values[2]:
		return hand_type.STRAIGHT
	elif hand_values[0] == hand_values[1] or hand_values[1] == hand_values[2]:
		return hand_type.TWO
		
	return hand_type.BUST

func evaluate_hands(public_die_value):
	
	var p1_hand = [int($DicePool.get_node("Die 1").animation), int($DicePool.get_node("Die 2").animation), public_die_value]
	var p2_hand = [int($DicePool.get_node("Die 3").animation), int($DicePool.get_node("Die 4").animation), public_die_value]
	var p3_hand = [int($DicePool.get_node("Die 5").animation), int($DicePool.get_node("Die 6").animation), public_die_value]
	
	p1_hand.sort()
	p2_hand.sort()
	p3_hand.sort()
	
	var p1_high = p1_hand.back()
	var p2_high = p2_hand.back()
	var p3_high = p3_hand.back()
	
	var p1_type = determine_type(p1_hand)
	var p2_type = determine_type(p2_hand)
	var p3_type = determine_type(p3_hand)
	
	var p1_hand_obj = [p1_type, p1_high]
	var p2_hand_obj = [p2_type, p2_high]
	var p3_hand_obj = [p3_type, p3_high]
	
	var all_hands = [p1_hand_obj, p2_hand_obj, p3_hand_obj]
	all_hands.sort_custom()
	var winner
	match all_hands.back():
		p1_hand_obj:
			winner = "Player 1"
		p2_hand_obj:
			winner = "Player 2"
		p3_hand_obj:
			winner = "Player 3"
	
	$TestText.text = "Winner is " + winner
	#pass
