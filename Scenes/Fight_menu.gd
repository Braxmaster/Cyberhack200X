extends Node2D

signal what_you_picked(pick)
var cur_option
var options

func _ready():
	options = get_children()
	cur_option = 0
	highlight_option(cur_option)

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		next_option("up")
		
	if Input.is_action_just_pressed("ui_down"):
		next_option("down")
	
	if Input.is_action_just_pressed("ui_accept"):
		set_process(false)
		print("You just pressed: " + options[cur_option].name)
		emit_signal("what_you_picked", options[cur_option].name)
	
func next_option(dir):
	if dir == "down":
		cur_option += 1
		if cur_option > len(options) - 1:
			cur_option = 0
	
	if dir == "up":
		cur_option -= 1
		if cur_option < 0:
			cur_option = len(options) - 1
	highlight_option(cur_option)
			
func highlight_option(index):
	for i in options.size():
		if cur_option == i:
			options[i].uppercase = true
		else:
			options[i].uppercase = false


func _on_Arena_activate_menu():
	print("Activate_menu is sent!")
	set_process(true)
