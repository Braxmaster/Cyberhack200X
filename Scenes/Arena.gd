extends Node2D

var good_guys
var bad_guys
var turn

var damage

signal activate_menu

func _ready():
	good_guys = get_node("Players").get_children()
	bad_guys = get_node("Enemies").get_children()
	turn = 0
	for i in bad_guys:
		i.connect("finished", self, "_on_finished")


func _on_Fight_menu_what_you_picked(pick):
	if pick == "Fight":
		damage = $Players/Player.Fight()
		$Enemies/Enemy.get_damaged(damage)
	if pick == "Special":
		$Players/Player.Special()
	change_turn()

		
func change_turn():
	turn += 1
	if turn > good_guys.size() - 1:
		print("Changing turn!")
		for i in bad_guys:
			i.attack()
		turn = 0
		yield(get_node("Enemies/Enemy"), "finished")


func _on_finished():
	emit_signal("activate_menu")