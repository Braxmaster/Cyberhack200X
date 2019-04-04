extends Node2D

var hp = 20
var damage = 5

func _ready():
	pass

func Fight():
	return damage

func Special():
	$Popup.popup()

