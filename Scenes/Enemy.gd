extends Node2D

signal finished

var hp = 20

func _ready():
	$Sprite/AnimationPlayer.set_current_animation("Chillin")
	$Enemy_hp.set_text("HP: " + str(hp))

func attack():
	print("Hello i am Slugman! I am now attacking!")
	$Sprite/AnimationPlayer.set_current_animation("Attack")
	yield($Sprite/AnimationPlayer, "animation_finished")
	$Sprite/AnimationPlayer.set_current_animation("Chillin")
	emit_signal("finished")

func get_damaged(damage_dealt):
	hp = hp - damage_dealt
	$Enemy_hp.set_text("HP: " + str(hp))
	if hp <= 0:
		print("Slugman died... :(")
		queue_free()